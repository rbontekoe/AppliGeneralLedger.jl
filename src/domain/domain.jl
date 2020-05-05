# domain.jl

using Dates

# ??? customer id
struct JournalEntry
    id::String
    period::Int64
    date::DateTime
    customer_id::String
    invoice_nbr::String
    from::Int64
    to::Int64
    debit::Float64
    credit::Float64
    vat::Float64
    descr::String
    # constructors
    JournalEntry(id, period, date, customer_id, invoice_nbr, from, to, debit, credit, vat, descr) =
        new(id, period, date, customer_id, invoice_nbr, from, to, debit, credit, vat, descr)
end # JournalEntry

struct Record
    id::String # was stm_nbr
    accountid::Int64
    date::DateTime
    customerid::String
    invoice_nbr::String
    debit::Float64
    credit::Float64
    descr::String
end # Record

struct Account
    id::String
    name::String
    group::String
    # constructors
    Account(id, name) = new(id, name, "")
    Account(id, name, group) = new(id, name, group)
end # Account
