using LinearAlgebra
using SparseArrays

σ = (0.5*sparse([0.  1.; 1.  0.]),
    0.5*sparse([0. -im; im  0.]),
    0.5*sparse([1.  0.; 0. -1.]))

function construct_1d_hamiltonian(Nx, Ny; Jx=Jx, Jy=Jy, Jz=Jz, Js=Js, isboundary=false)
    L = Nx * Ny
    adj = lattice_adjacency_map(Nx, Ny; pbc=isboundary)
    on_site = lattice_map_1d(Nx, Ny)
    J = Js * reshape(kron(adj_horz, [1, 1, 1]), (3, L, L))
    h = reshape(kron(on_site, [Jx, Jy, Jz]), (3, L, L))
    H = construct_hamiltonian(J, h)
    @assert H  ≈  H'
    H
end

function construct_2d_hamiltonian(Nx, Ny; Jx=Jx, Jy=Jy, Jz=Jz, isboundary=false)
    L = Nx * Ny
    adj_horz = lattice_adjacency_map_horz(Nx, Ny; pbc=isboundary)
    adj_vert = lattice_adjacency_map_vert(Nx, Ny; pbc=isboundary)
    J = Jx * reshape(kron(adj_horz, [1, 1, 1]), (3, L, L)) + Jy * reshape(kron(adj_vert, [1, 1, 1]), (3, L, L))
    H = construct_hamiltonian(J)
    @assert H  ≈  H'
    H
end


"""
 Construct a Heisenberg-type Hamiltonian as sparse matrix using site-dependent interaction strength, with nearest-neighbor interactions according to adjacency.
"""
function construct_hamiltonian(J::Array{<:Real,3})
    L = size(J, 3)
    @assert(size(J) == (3, L, L))

    # spin operators (Pauli matrices divided by 2)
    sigma12 = (0.5*sparse([0.  1.; 1.  0.]),
                0.5*sparse([0. -im; im  0.]),
                0.5*sparse([1.  0.; 0. -1.]))

    H = spzeros(Float64, 2^L, 2^L)

    # interaction terms
    for i in 1:L
        for j in i+1:L
            for k in 1:3
                # considering only entries in J for i < j
                if J[k, i, j] ≠ 0
                    H -= J[k, i, j] * real(kron(sparse_identity(2^(L-j)), sigma12[k], sparse_identity(2^(j-i-1)), sigma12[k], sparse_identity(2^(i-1))))
                end
            end
        end
    end

    return H
end
    

"""
 Construct a Heisenberg-type Hamiltonian as sparse matrix using site-dependent interaction strength, with nearest-neighbor interactions according to adjacency.
"""
function construct_hamiltonian(J::Array{<:Real,3}, h::Array{<:Real,3})
    L = size(J, 3)
    @assert(size(J) == (3, L, L))
    # spin operators (Pauli matrices divided by 2)

    H = spzeros(Float64, 2^L, 2^L)

    σ = (0.5*sparse([0.  1.; 1.  0.]),
        0.5*sparse([0. -im; im  0.]),
        0.5*sparse([1.  0.; 0. -1.]))

    # interaction terms
    for i in 1:L
        for j in i+1:L
            for k in 1:3
                # considering only entries in J for i < j
                if J[k, i, j] ≠ 0
                    H += J[k, i, j] * real(kron(sparse_identity(2^(L-j)), σ[k], sparse_identity(2^(j-i-1)), σ[k], sparse_identity(2^(i-1))))
                end
            end
        end
    end

    for i in 1:L
        for k in 1:3
            if h[k, i, i] ≠ 0
                H += h[k, i, i] * real(kron(sparse_identity(2^(L-i)), σ[k], sparse_identity(2^(i-1))))
            end
        end
    end

    return H
end
