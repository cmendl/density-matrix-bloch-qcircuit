using Qaintessent

"""
Identity map as sparse matrix with real-valued entries.
"""
sparse_identity(n) = sparse(1.0*I, n, n)

"""
Construct a parametrized quantum layer consisting of single qubit rotation gates.
"""
function single_qubit_layer(L::Integer)
    # local gates
    # [circuit_gate(i, RotationGate(0.05*π*randn(3))) for i in 1:L]
    cgc = CircuitGate[]
    append!(cgc, [circuit_gate(i, RxGate(0.05*π*randn())) for i in 1:L])
    append!(cgc, [circuit_gate(i, RyGate(0.05*π*randn())) for i in 1:L])
    append!(cgc, [circuit_gate(i, RzGate(0.05*π*randn())) for i in 1:L])
    cgc
end

"""
Construct a parametrized quantum layer consisting of two qubit entanglement gates for 1D chain.
"""
function trotterized_layer_1d(L::Integer, istart::Integer; boundary::Bool=false)
    # interaction gates
    vcat(
        [circuit_gate(i, i+1, EntanglementXXGate(0.05π*randn())) for i in istart:2:L-1],
        ifelse(boundary, [circuit_gate(L, 1, EntanglementXXGate(0.05π*randn()))], []),
        [circuit_gate(i, i+1, EntanglementYYGate(0.05π*randn())) for i in istart:2:L-1],
        ifelse(boundary, [circuit_gate(L, 1, EntanglementYYGate(0.05π*randn()))], []),
        [circuit_gate(i, i+1, EntanglementZZGate(0.05π*randn())) for i in istart:2:L-1],
        ifelse(boundary, [circuit_gate(L, 1, EntanglementZZGate(0.05π*randn()))], [])
    )
end

function create_cgc(L::Int; isboundary::Bool=false)
    cgc = CircuitGate[]
    layers = 3
    for _ in 1:layers
        append!(cgc, single_qubit_layer(L::Integer))
        append!(cgc, trotterized_layer_1d(L, 1; boundary=isboundary))
        append!(cgc, trotterized_layer_1d(L, 2; boundary=isboundary))
        
    end

    cgc
end

