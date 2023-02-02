using JuliaFormatterDaemonMode
using Documenter

DocMeta.setdocmeta!(JuliaFormatterDaemonMode, :DocTestSetup, :(using JuliaFormatterDaemonMode); recursive=true)

makedocs(;
    modules=[JuliaFormatterDaemonMode],
    authors="Chris Elrod <elrodc@gmail.com> and contributors",
    repo="https://github.com/chriselrod/JuliaFormatterDaemonMode.jl/blob/{commit}{path}#{line}",
    sitename="JuliaFormatterDaemonMode.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://chriselrod.github.io/JuliaFormatterDaemonMode.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/chriselrod/JuliaFormatterDaemonMode.jl",
    devbranch="main",
)
