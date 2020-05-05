using Documenter, AppliGeneralLedger

makedocs(;
    modules=[AppliGeneralLedger],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/rbontekoe/AppliGeneralLedger.jl/blob/{commit}{path}#L{line}",
    sitename="AppliGeneralLedger.jl",
    authors="Rob Bontekoe",
    assets=String[],
)

deploydocs(;
    repo="github.com/rbontekoe/AppliGeneralLedger.jl",
)
