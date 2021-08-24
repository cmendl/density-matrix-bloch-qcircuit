module density_demo

include("util.jl")
export 
    xlogx,
    neumann_entropy,
    binary_entropy,
    thermal_logZ,
    latent_density,
    sigmoid,
    trdistance,
    fidelity

include("adjacency_map.jl")
export
    lattice_adjacency_map,
    lattice_adjacency_map_horz,
    lattice_adjacency_map_vert,
    lattice_map_1d

include("construct_hamiltonian.jl")
export 
    construct_hamiltonian,
    construct_1d_hamiltonian,
    construct_2d_hamiltonian

include("thermal_states.jl")
export
    thermal_state,
    thermal_logZ

include("construct_circuit.jl")
export
    create_cgc


end # module
