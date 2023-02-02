module JuliaFormatterDaemonMode

using DaemonMode, Sockets

function runsocket(sock, fcompletename, args)
  println(sock, DaemonMode.token_runfile)
  println(sock, pwd())
  println(sock, fcompletename)
  println(sock, join(args, " "))
  line = readline(sock)
  token_size = length(DaemonMode.token_ok_end)

  while (length(line) < token_size || !occursin(DaemonMode.token_end, line))
    println(stdout, line)
    line = readline(sock)
  end
  result = Int(occursin(DaemonMode.token_error_end, line)::Bool)

  if length(line) > token_size
    end_line = replace(line, DaemonMode.token_ok_end => "")
    end_line = replace(end_line, DaemonMode.token_error_end => "")
    print(stdout, end_line)
  end
  return result
end

function fmt(
  args::Vector{String} = String[],
  fname::String = joinpath(@__DIR__, "..", "bin", "juliafmtcore")
)
  port = DaemonMode.PORT
  local sock::TCPSocket
  try
    sock = Sockets.connect(port)
  catch e
    if e isa Base.IOError
      run(
        `$(Base.julia_cmd()) --project=$(joinpath(@__DIR__,"..")) --startup-file=no -e 'using DaemonMode; serve()'`;
        wait = false
      )
      sleep(1.0)
      sock = Sockets.connect(port)
    else
      rethrow(e)
    end
  end
  return runsocket(sock, fname, args)
end

function __init__()
  ccall(:jl_generating_output, Cint, ()) != 1 && return
  precompile(fmt, (Vector{String},))
end
end
