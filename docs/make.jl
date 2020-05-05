using Documenter, AppliGeneralLedger

makedocs(;
    modules=[AppliGeneralLedger],
    format=Documenter.HTML(),
    pages=[
        "General Ledger" => "index.md",
        "1 - API" => "chapter1.md",
        "2 - Infrastructure" => "chapter2.md",
        "3 - Examples" => "chapter3.md",
    ],
    repo="https://github.com/rbontekoe/AppliGeneralLedger.jl/blob/{commit}{path}#L{line}",
    sitename="AppliGeneralLedger.jl",
    authors="Rob Bontekoe",
    assets=String[],
)

deploydocs(;
    repo="github.com/rbontekoe/AppliGeneralLedger.jl",
)
