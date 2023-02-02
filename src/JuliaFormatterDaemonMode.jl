module JuliaFormatterDaemonMode

using DaemonMode

const fname = joinpath(@__DIR__, "..", "bin", "juliafmtcore")
fmt(args::Vector{String}) = DaemonMode.runfile(fname; args)

function __init__()
  ccall(:jl_generating_output, Cint, ()) != 1 && return
  precompile(fmt, (Vector{String},))
end
end
