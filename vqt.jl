using Logging
using Qaintessent
using Qaintellect
using Flux
using IterTools: ncycle
using JLD
using Plots
using LaTeXStrings
using LinearAlgebra
push!(LOAD_PATH, "./density_demo/")
using density_demo

global debug = false
global visualize = false

folder_name = "demo"
if !isdir(folder_name)
    mkdir(folder_name)
end
Base.Filesystem.cd(folder_name)

global Nx = 2
global Ny = 2
global isboundary = false

@assert Nx > 0 "Dimension of lattice must be positive and greater than 0"
@assert Ny > 0 "Dimension of lattice must be positive and greater than 0"

"""
Identity map as sparse matrix with real-valued entries.
"""
sparse_identity(n) = sparse(1.0*I, n, n)

function train(θlist, σtherm, ftarget, circ, cgc, steps)
    paras1 = Flux.params(θlist)
    Flux.params!(paras1, circ)
    delete!(paras1, circ.meas[1].operator)
    # there is not actually any input data for training
    data = ncycle([()], steps)

    # define optimizer
    opt = AdaMax(0.005)

    # define evaluation function
    result_loss = []
    result_trdistance = []
    result_fidelity = []

    evalcb() = begin
        push!(result_loss, ftarget(θlist)) 
        push!(result_trdistance, trdistance(θlist, σtherm, cgc)) 
        push!(result_fidelity, fidelity(θlist, σtherm, cgc)) 
        if debug
            @info "ftarget(θlist): $(ftarget(θlist)), reference: $(thermal_logZ(β*H)); trdistance(θlist, σtherm, cgc): $(trdistance(θlist, σtherm, cgc)); fidelity(θlist, σtherm, cgc): $(fidelity(θlist, σtherm, cgc))"
        end
    end

    # perform optimization
    Flux.train!(() -> ftarget(θlist), paras1, data, opt, cb=evalcb)

    result_loss, result_trdistance, result_fidelity
end


function main(H::AbstractMatrix)
    if debug
        @debug "Constructed Hamiltonian is equivalent to sample $(H ≈ H')"
        @assert(H ≈ H')
    end
   
    if visualize
        # show eigenvalues
        scatter(eigvals(Matrix(H)), xlabel=L"i", ylabel=L"\lambda_i", legend=false)
    end

    reference_energy = thermal_logZ(β*H)

    # Ground truth
    σtherm = thermal_state(β*H)

    # Consistency check
    @assert tr(σtherm)  ≈ 1 "Trace of thermal state should be 1"

    if visualize
        heatmap(log.(max.(σtherm, 1e-4)), title=L"\sigma_{\beta}", yflip=true, aspect_ratio=:equal)
    end
    
    # parameterized quantum circuit gate chain

    if visualize
        #visualize binary entropy
        plot(0:0.05:1, binary_entropy.(0:0.05:1), xlabel="p", ylabel="S(p)", legend=false)
    end

    losses = []
    trdistances = []
    fidelities = []

    # create circuit_gate

    samples = 50
    steps = 500
    for i in 1:samples
        cgc = create_cgc(L; isboundary=isboundary)
        
        # parameterized quantum circuit
        circ = Circuit{L}(cgc, [Hmeas])

        # randomize inputs 
        θopt = π/2 .* (1 .+ 0.2*randn(L))   

        # target function: β tr[ρ H] - S(ρ), with ρ = U ρlatent U†
        ftarget(θlist) = β * apply(latent_density(θlist), circ)[1] - sum(binary_entropy.((1 .+ cos.(θlist)) ./ 2))
        
        result_loss, result_trdistance, result_fidelity = train(θopt, σtherm, ftarget, circ, cgc, steps)
        push!(losses, result_loss .- reference_energy)
        push!(trdistances, result_trdistance)
        push!(fidelities, result_fidelity)
    end
    @info "Processing data"
    results_string = "beta"*string(β)*".jld"
    save(results_string, "losses", losses,
             "trdistances", trdistances,
             "fidelities", fidelities)
end

Js = 0
Jy = 0
Jx = 1
Jz = 1

# number of lattice sites
#L = size(adj, 1)
L = Nx*Ny

@info "Construct Hamiltonian"
# construct 2d hamiltonian
H = construct_2d_hamiltonian(Nx, Ny; Jx=Jx, Jy=Jy, Jz=Jz)
# construct 1d hamiltonian
#H = construct_1d_hamiltonian(Nx, Ny; Jx=Jx, Jy=Jy, Jz=Jz, Js=Js)

# use Hamiltonian as measurement operator; note that H gets converted to a complex matrix here
global Hmeas = MeasurementOperator(H, Tuple(1:L));

for b in 0:0.1:0.2
    @info "Running fidelity: $b"
    #try
        global β = b
        main(H)
    #catch e
    #    showerror(stdout, e)
    #    @info "Did not run complete $(b)"
    #end
end

