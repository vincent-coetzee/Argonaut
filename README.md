### Argonaut

Argonaut is named after the Argonauts that JSON was the captain of.

#### Notes

1. I intentionally prefix instance variables ( member variables ) with self when using them because
I believe in being as explicit as possible in code. Prefixing the instance variable with self ensures that
a) one's intentions of using the instance variable rather than a local variable are clear and b) ensures that
if there is in fact a local variable with the same name that is shadowing the instance variable that the instance
variable will in fact be used over the local variable.

2. I typically define the the plural of a type as the type name + "s" as an array of the unit type. This definition
will usually be placed after the definition of the unit type. For example, when I define "SquadMember", I define the
typealias "internal typealias SquadMembers = Array<SquadMember>" underneath the definition of the unit type. I do
this because more often than nor one makes use of the Array of the unit types and so it's convenient to have the
plural defined as an array of the unit type.
