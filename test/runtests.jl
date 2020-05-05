using AppliGeneralLedger
using DataFrames
using Test

# TEST MODEL
@testset "Journal" begin
    entry = create_journal_entry("20200700", "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
    @test entry.id == "20200700"
    @test entry.customer_id == "APPLI"
    @test entry.invoice_nbr == "A1001"
    @test entry.from == 1300
    @test entry.to == 8000
    @test entry.debit == 1000.0
    @test entry.credit == 0
    @test entry.vat == 210.0
    @test entry.descr == "LS"
end

#=
@testset "From" begin
    entry = create_journal_entry("20200700", "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
    r1 = create_record_from(entry)
    r2 = create_record_to(entry)
    r3 = create_record_vat(entry, 4000)
    @test r1.debit == 1210
    @test r2.credit == 1000
    @test r3.credit == 210
    @test r1.debit == r2.credit + r3.credit
end

@testset "To" begin
    entry = create_journal_entry("20200700", "APPLI", "A1001", 1150, 1300, 1210.0, 0.0, 0.0, "LS")
    r1 = create_record_from(entry)
    r2 = create_record_to(entry)
    r3 = create_record_vat(entry, 4000)
    @test r1.debit == 1210
    @test r2.credit == 1210
    @test r3.credit == 0.0
    @test r1.debit == r2.credit + r3.credit
end
=#

@testset "Database read" begin
    entry1 = create_journal_entry("20200700", "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
    entry2 = create_journal_entry("20200700", "PRG", "A1002", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
    process([entry1, entry2])

    items =  read_from_file("./test_ledger.txt")
    df = DataFrame(items)
    result = sum(df.debit) - sum(df.credit)
    @test sum(result) == 0

    cmd = `rm test_journal.txt test_ledger.txt`
    run(cmd)
end
