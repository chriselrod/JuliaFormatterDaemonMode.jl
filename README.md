# JuliaFormatterDaemonMode

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://chriselrod.github.io/JuliaFormatterDaemonMode.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://chriselrod.github.io/JuliaFormatterDaemonMode.jl/dev/)
[![Build Status](https://github.com/chriselrod/JuliaFormatterDaemonMode.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/chriselrod/JuliaFormatterDaemonMode.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/chriselrod/JuliaFormatterDaemonMode.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/chriselrod/JuliaFormatterDaemonMode.jl)

Example use, from the commandline:
```
$ julia --project=~/.julia/dev/JuliaFormatterDaemonMode/ -e 'using Pkg; Pkg.update()'
$ julia --project=~/.julia/dev/JuliaFormatterDaemonMode/ -e 'using DaemonMode; serve()'&
$ time ~/.julia/dev/JuliaFormatterDaemonMode/bin/juliafmt ~/.julia/dev/Octavian/
2.305 secs
$ time ~/.julia/dev/JuliaFormatterDaemonMode/bin/juliafmt ~/.julia/dev/Octavian/
0.334 secs
```

