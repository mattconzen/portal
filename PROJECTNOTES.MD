#### Pattern matching

`=` in Elixir is the `MATCH` operator, not the `EQUALS` operator. Pattern matching can be done between complex types, like tuples.

`^` can be used to `pin` variables so they do not change when matching operators would otherwise cause them to.

`_` is essentially a reserved `void` variable. `_` on the LHS of a pattern match will do nothing, but will return success. `_` can never be set.

#### Documentation

`h` can be used at the command line to retrieve documentation for a function.

>`h Portal.Door.start_link`
