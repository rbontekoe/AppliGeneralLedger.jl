# Examples

## Example 1 -  developer

```julia
# test.jl

# link to model
include("./src/infrastructure/infrastructure.jl")

# create entries including VAT
entry1 = create_journal_entry("20200700", "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
entry2 = create_journal_entry("20201500", "PRG", "A1002", 1300, 8000, 1000.0, 0.0, 210.0, "LS")

# process the entries
process([entry1, entry2])

# print stored JournalEntry's
r = read_from_file("test_journal.txt")

println(DataFrame(r))

# print stored Records's
r = read_from_file("test_ledger.txt")

println(DataFrame(r))

# create paid invoice entries
entry1 = create_journal_entry("20201500", "APPLI", "A1001", 1150, 1300, 1210.0, 0.0, 0.0, "LS")
entry2 = create_journal_entry("20201500", "PRG", "A1002", 1150, 1300, 1210.0, 0.0, 0.0, "LS")

# print stored JournalEntry's
process([entry1, entry2])

# print stored JournalEntry's
r = read_from_file("test_ledger.txt")

df = DataFrame(r)

println(df)

# print accounts receivable

df2 = df[df.accountid .== 1300, :]

#= OR

using Query

x = df |> @filter(_.accountid == 1300) |> DataFrame
=#

println(df2)

# remove files
cmd = `rm test_ledger.txt test_journal.txt`

run(cmd)

```

# Example 2 - user

```julia
julia> using AppliGeneralLedger
[ Info: Precompiling AppliGeneralLedger [153ef306-36d1-11ea-1f0d-e3f38f84e10d]

julia> entry1 = create_journal_entry("20200700", "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
AppliGeneralLedger.JournalEntry("20200700", 3, 2020-03-03T14:56:54.508, "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")

julia> entry2 = create_journal_entry("20201500", "PRG", "A1002", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
AppliGeneralLedger.JournalEntry("20201500", 3, 2020-03-03T14:56:57.475, "PRG", "A1002", 1300, 8000, 1000.0, 0.0, 210.0, "LS")

julia> process([entry1, entry2])

julia> r = AppliGeneralLedger.read_from_file("test_ledger.txt")
6-element Array{Any,1}:
 AppliGeneralLedger.Record("20200700", 1300, 2020-03-03T14:56:54.508, "APPLI", "A1001", 1210.0, 0.0, "LS")
 AppliGeneralLedger.Record("20200700", 8000, 2020-03-03T14:56:54.508, "APPLI", "A1001", 0.0, 1000.0, "LS")
 AppliGeneralLedger.Record("20200700", 4000, 2020-03-03T14:56:54.508, "APPLI", "A1001", 0.0, 210.0, "LS")
 AppliGeneralLedger.Record("20201500", 1300, 2020-03-03T14:56:57.475, "PRG", "A1002", 1210.0, 0.0, "LS")
 AppliGeneralLedger.Record("20201500", 8000, 2020-03-03T14:56:57.475, "PRG", "A1002", 0.0, 1000.0, "LS")
 AppliGeneralLedger.Record("20201500", 4000, 2020-03-03T14:56:57.475, "PRG", "A1002", 0.0, 210.0, "LS")

julia> using DataFrames

julia> DataFrame(r)
6×8 DataFrame
│ Row │ id       │ accountid │ date                    │ customerid │ invoice_nbr │ debit   │ credit  │ descr  │
│     │ String   │ Int64     │ Dates.DateTime          │ String     │ String      │ Float64 │ Float64 │ String │
├─────┼──────────┼───────────┼─────────────────────────┼────────────┼─────────────┼─────────┼─────────┼────────┤
│ 1   │ 20200700 │ 1300      │ 2020-03-03T14:56:54.508 │ APPLI      │ A1001       │ 1210.0  │ 0.0     │ LS     │
│ 2   │ 20200700 │ 8000      │ 2020-03-03T14:56:54.508 │ APPLI      │ A1001       │ 0.0     │ 1000.0  │ LS     │
│ 3   │ 20200700 │ 4000      │ 2020-03-03T14:56:54.508 │ APPLI      │ A1001       │ 0.0     │ 210.0   │ LS     │
│ 4   │ 20201500 │ 1300      │ 2020-03-03T14:56:57.475 │ PRG        │ A1002       │ 1210.0  │ 0.0     │ LS     │
│ 5   │ 20201500 │ 8000      │ 2020-03-03T14:56:57.475 │ PRG        │ A1002       │ 0.0     │ 1000.0  │ LS     │
│ 6   │ 20201500 │ 4000      │ 2020-03-03T14:56:57.475 │ PRG        │ A1002       │ 0.0     │ 210.0   │ LS     │

julia> entry1 = create_journal_entry("20201500", "APPLI", "A1001", 1150, 1300, 1210.0, 0.0, 0.0, "LS")
AppliGeneralLedger.JournalEntry("20201500", 3, 2020-03-03T15:00:56.578, "APPLI", "A1001", 1150, 1300, 1210.0, 0.0, 0.0, "LS")

julia> entry2 = create_journal_entry("20201500", "PRG", "A1002", 1150, 1300, 1210.0, 0.0, 0.0, "LS")
AppliGeneralLedger.JournalEntry("20201500", 3, 2020-03-03T15:00:58.199, "PRG", "A1002", 1150, 1300, 1210.0, 0.0, 0.0, "LS")

julia> process([entry1, entry2])

julia> r = AppliGeneralLedger.read_from_file("test_ledger.txt")
10-element Array{Any,1}:
 AppliGeneralLedger.Record("20200700", 1300, 2020-03-03T14:56:54.508, "APPLI", "A1001", 1210.0, 0.0, "LS")
 AppliGeneralLedger.Record("20200700", 8000, 2020-03-03T14:56:54.508, "APPLI", "A1001", 0.0, 1000.0, "LS")
 AppliGeneralLedger.Record("20200700", 4000, 2020-03-03T14:56:54.508, "APPLI", "A1001", 0.0, 210.0, "LS")
 AppliGeneralLedger.Record("20201500", 1300, 2020-03-03T14:56:57.475, "PRG", "A1002", 1210.0, 0.0, "LS")
 AppliGeneralLedger.Record("20201500", 8000, 2020-03-03T14:56:57.475, "PRG", "A1002", 0.0, 1000.0, "LS")
 AppliGeneralLedger.Record("20201500", 4000, 2020-03-03T14:56:57.475, "PRG", "A1002", 0.0, 210.0, "LS")
 AppliGeneralLedger.Record("20201500", 1150, 2020-03-03T15:00:56.578, "APPLI", "A1001", 1210.0, 0.0, "LS")
 AppliGeneralLedger.Record("20201500", 1300, 2020-03-03T15:00:56.578, "APPLI", "A1001", 0.0, 1210.0, "LS")
 AppliGeneralLedger.Record("20201500", 1150, 2020-03-03T15:00:58.199, "PRG", "A1002", 1210.0, 0.0, "LS")
 AppliGeneralLedger.Record("20201500", 1300, 2020-03-03T15:00:58.199, "PRG", "A1002", 0.0, 1210.0, "LS")

 julia> df = DataFrame(r)
10×8 DataFrame
│ Row │ id       │ accountid │ date                    │ customerid │ invoice_nbr │ debit   │ credit  │ descr  │
│     │ String   │ Int64     │ Dates.DateTime          │ String     │ String      │ Float64 │ Float64 │ String │
├─────┼──────────┼───────────┼─────────────────────────┼────────────┼─────────────┼─────────┼─────────┼────────┤
│ 1   │ 20200700 │ 1300      │ 2020-03-03T14:56:54.508 │ APPLI      │ A1001       │ 1210.0  │ 0.0     │ LS     │
│ 2   │ 20200700 │ 8000      │ 2020-03-03T14:56:54.508 │ APPLI      │ A1001       │ 0.0     │ 1000.0  │ LS     │
⋮
│ 8   │ 20201500 │ 1300      │ 2020-03-03T15:00:56.578 │ APPLI      │ A1001       │ 0.0     │ 1210.0  │ LS     │
│ 9   │ 20201500 │ 1150      │ 2020-03-03T15:00:58.199 │ PRG        │ A1002       │ 1210.0  │ 0.0     │ LS     │
│ 10  │ 20201500 │ 1300      │ 2020-03-03T15:00:58.199 │ PRG        │ A1002       │ 0.0     │ 1210.0  │ LS     │

julia> df2 = df[df.accountid .== 1300, :]
4×8 DataFrame
│ Row │ id       │ accountid │ date                    │ customerid │ invoice_nbr │ debit   │ credit  │ descr  │
│     │ String   │ Int64     │ Dates.DateTime          │ String     │ String      │ Float64 │ Float64 │ String │
├─────┼──────────┼───────────┼─────────────────────────┼────────────┼─────────────┼─────────┼─────────┼────────┤
│ 1   │ 20200700 │ 1300      │ 2020-03-03T14:56:54.508 │ APPLI      │ A1001       │ 1210.0  │ 0.0     │ LS     │
│ 2   │ 20201500 │ 1300      │ 2020-03-03T14:56:57.475 │ PRG        │ A1002       │ 1210.0  │ 0.0     │ LS     │
│ 3   │ 20201500 │ 1300      │ 2020-03-03T15:00:56.578 │ APPLI      │ A1001       │ 0.0     │ 1210.0  │ LS     │
│ 4   │ 20201500 │ 1300      │ 2020-03-03T15:00:58.199 │ PRG        │ A1002       │ 0.0     │ 1210.0  │ LS     │

julia> cmd = `rm test_ledger.txt test_journal.txt`
`rm test_ledger.txt test_journal.txt`

julia> run(cmd)
Process(`rm test_ledger.txt test_journal.txt`, ProcessExited(0))
```
