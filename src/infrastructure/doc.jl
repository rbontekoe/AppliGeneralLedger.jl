# doc.jl - infrastructure

"""
    process(entries::Array{JournalEntry, 1}, path_journal="./journal.txt", path_ledger="./ledger.txt", )

It adds a `JournalEntry` to the file `path_journal,` converts it into `Record`'s, and adds them to the file `path_ledger.`

@see also [`read_from_file`](@ref)

# Example

```
julia> include("./src/infrastructure/infrastructure.jl")
process (generic function with 1 method)

julia> entry1 = create_journal_entry("20200700", "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
JournalEntry("20200700", 3, 2020-03-03T13:31:07.953, "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")

julia> entry2 = create_journal_entry("20201500", "PRG", "A1002", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
JournalEntry("20201500", 3, 2020-03-03T13:31:07.955, "PRG", "A1002", 1300, 8000, 1000.0, 0.0, 210.0, "LS")

julia> process([entry1, entry2])
```
"""
function process end


"""
    function read_from_file(path::String)::Array{Any, 1}

It reads (structured) data back from a file.

# Example

```
julia> include("./src/infrastructure/infrastructure.jl")
process (generic function with 1 method)

julia> entry1 = create_journal_entry("20200700", "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
JournalEntry("20200700", 3, 2020-03-03T13:32:46.7, "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")

julia> entry2 = create_journal_entry("20201500", "PRG", "A1002", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
JournalEntry("20201500", 3, 2020-03-03T13:32:46.702, "PRG", "A1002", 1300, 8000, 1000.0, 0.0, 210.0, "LS")

julia> process([entry1, entry2])

julia> r = read_from_file("./test_journal.txt")
2-element Array{Any,1}:
 JournalEntry("20200700", 3, 2020-03-03T13:32:46.7, "APPLI", "A1001", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
 JournalEntry("20201500", 3, 2020-03-03T13:32:46.702, "PRG", "A1002", 1300, 8000, 1000.0, 0.0, 210.0, "LS")
```
"""
function read_from_file end

"""
    add_to_file(path::String, data::Array{T, 1} where T <: Any)

Adds an object to a file.

# Example

```
julia> struct Person
           name:: String
       end

julia> donald = Person("Donald Duck")
Person("Donald Duck")

julia> add_to_file("./persons.txt", [donald])

julia> read_from_file("./persons.txt")
1-element Array{Any,1}:
 Person("Donald Duck")
```
"""
function add_to_file end
