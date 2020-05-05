include("../domain/domain.jl")
include("./doc.jl")

# https://www.investopedia.com/terms/j/journal.asp

create_journal_entry(
    id::String,
    customer_id::String,
    invoice_nbr::String,
    from::Int64,
    to::Int64,
    debit::Float64,
    credit::Float64,
    vat::Float64,
    descr::String) = JournalEntry(
        id,
        Dates.month(now()),
        now(),
        customer_id,
        invoice_nbr,
        from,
        to,
        debit,
        credit,
        vat,
        descr)

create_account(id::String, name::String, group::String) = Account(id, name)

create_record_from(entry::JournalEntry) = Record(
    entry.id,
    entry.from,
    entry.date,
    entry.customer_id,
    entry.invoice_nbr,
    entry.debit + entry.vat,
    0,
    entry.descr)

create_record_to(entry::JournalEntry) = Record(
    entry.id,
    entry.to,
    entry.date,
    entry.customer_id,
    entry.invoice_nbr,
    0,
    entry.debit,
    entry.descr)

create_record_vat(entry::JournalEntry, vat_account_nbr::Int) = Record(
    entry.id,
    vat_account_nbr,
    entry.date,
    entry.customer_id,
    entry.invoice_nbr,
    0,
    entry.vat,
    entry.descr)
