### Argonaut

Argonaut is named after the Argonauts that JSON was the captain of in Greek ( and Roman mythology ). 

#### Notes

1. master is the primary branch, not main.

2. This project was built with Xcode 13 and Swift 5.5 and quite probably needs to be built with
Xcode 13 to function correctly.

3. I don't believe in centalizing constants the way some developers do ( i.e putting all constants into
a struct called Argonauts and then referencing them from there). Swift has a policy of clarity at the point
of use, which I interpret to mean that constants need to be defined CLOSE to the point at which they are used
in order to make it easier to understand what they are and how they are used. For that reason I try to declare
most constants as private and in the struct or class in which they are used. If a constant will be used across
several classes or structs, I will declare them in one particular struct or class as public and then reference
them from the other structs and classes.

4. I intentionally prefix instance variables ( member variables ) with self when using them because
I believe in being as explicit as possible in code. Prefixing the instance variable with self ensures that
a) one's intentions of using the instance variable rather than a local variable are clear and b) ensures that
if there is in fact a local variable with the same name that is shadowing the instance variable that the instance
variable will in fact be used over the local variable.

5. I typically define the the plural of a type as the type name + "s" as an array of the unit type. This definition
will usually be placed after the definition of the unit type. For example, when I define "SquadMember", I define the
typealias "internal typealias SquadMembers = Array<SquadMember>" underneath the definition of the unit type. I do
this because more often than nor one makes use of the Array of the unit types and so it's convenient to have the
plural defined as an array of the unit type.
