#### Pattern matching

`=` in Elixir is the `MATCH` operator, not the `EQUALS` operator. Pattern matching can be done between complex types, like tuples.

`^` can be used to `pin` variables so they do not change when matching operators would otherwise cause them to.

`_` is essentially a reserved `void` variable. `_` on the LHS of a pattern match will do nothing, but will return success. `_` can never be set.

#### Documentation

`@doc` doc blocks are used to document functions

    @doc """
    This is my documentation
    """
    defp get(door) do
      code
    end

`h` can be used at the command line to retrieve documentation for a function.

>`h Portal.Door.start_link`

#### Structs

Structs are defined inside of a module and use the same name as the module. Structs are built on top of __maps__, which are the "go to" data structure in Elixir for key-value pairs.

>    Map: `%{:a => 1, 2 => :b}`
>
>    `map[:a]` = 1
>
>    `map[2]` = :b
>
>    `map[c]` = nil

Structs are like defining a module as a new Type and define the requirements to create one.

#### Inspecting with Protocols

Adding an `inspect` protocol implementation for a module allows you to determine how it is represented when inspected. `iex` uses inspect to represent types in the console.

See example in `portal.ex`

`#{}` blocks in strings are like <%= %> blocks in old WebForms i think?
