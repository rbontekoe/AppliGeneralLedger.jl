# infrastructure.jl

using DataFrames
#using SQLite
#using Dates
#using SQLite

using Serialization

include("../api/api.jl")
include("./db.jl")
include("./doc.jl")

const VAT_ACCOUNT = 4000

process(entries::Array{JournalEntry, 1}; path_journal="./test_journal.txt", path_ledger="./test_ledger.txt") = begin
    # archive journal entries
    add_to_file(path_journal, entries)

    # store records
    for entry in entries
        debit = create_record_from(entry)
        credit = create_record_to(entry)
        vat = create_record_vat(entry, VAT_ACCOUNT)

        records = entry.vat != 0 ? [debit, credit, vat] : [debit, credit]

        add_to_file(path_ledger, records)
    end

end # process
