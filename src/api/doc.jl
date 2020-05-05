# doc.jl - api

"""
    create_journal_entry(::String, ::String, ::String, ::Int64, ::Int64, ::Float64, ::Float64, ::Float64, ::String)::JournalEntry

    It creates a general ledger `JournalEntry.`
.
# Example

```
julia> entry = create_journal_entry("20200700", "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
JournalEntry("20200700", 3, 2020-03-03T13:25:29.277, "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
```
"""
function create_journal_entry end

"""
    create_account(::String, ::String, ::String)::Account

# Example

```
julia> account = create_account("8000", "Sales", "")
Account("8000", "Sales", "")
```
"""
function create_account end

"""
    create_record_from(entry::JournalEntry)::Record

It creates a general ledger `Record` from a `JournalEntry.`

@see also [`add_to_file`](@ref), [`read_from_file`](@ref)

# Example

```
julia> entry = create_journal_entry("20200700", "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
JournalEntry("20200700", 3, 2020-03-03T13:28:14.696, "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")

julia> record_from = create_record_from(entry)
Record("20200700", 1300, 2020-03-03T13:28:14.696, "APPLI", "A1001", 1210.0, 0.0, "LS")

julia> add_to_file("./test_ledger.txt", [record_from])
```
"""
function create_record_from end

"""
    create_record_to(::JournalEntry)::Record

It creates a general ledger `Record` from a `JournalEntry.`

@see also [`add_to_file`](@ref)

# Example
```
julia> entry = create_journal_entry("20200700", "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
JournalEntry("20200700", 3, 2020-03-03T13:28:54.701, "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")

julia> record_to = create_record_to(entry)
Record("20200700", 8000, 2020-03-03T13:28:54.701, "APPLI", "A1001", 0.0, 1000.0, "LS")

julia> add_to_file("./test_ledger.txt", [record_to])
```
"""
function create_record_to end

"""
    create_record_vat(::JournalEntry, ::Int)::Record

It creates a general ledger `Record` from a `JournalEntry.`

@see also [`add_to_file`](@ref)

# Example

```
julia> entry = create_journal_entry("20200700", "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
JournalEntry("20200700", 3, 2020-03-03T13:29:41.847, "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")

julia> record_vat = create_record_vat(entry, 4000)
Record("20200700", 4000, 2020-03-03T13:29:41.847, "APPLI", "A1001", 0.0, 210.0, "LS")

julia> add_to_file("./test_ledger.txt", [record_vat])

```
"""
function create_record_vat end
