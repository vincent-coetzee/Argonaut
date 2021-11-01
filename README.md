### Argonaut

Argonaut is named after the Argonauts that JSON was the captain of in Greek ( and Roman ) mythology. 

#### Notes

1. This project was built with Xcode 13 and Swift 5.5 and needs to be built with
Xcode 13 and Swift 5.5 to function correctly.

2. I don't believe in centalizing constants the way some developers do ( i.e putting all constants into
a struct called Argonauts and then referencing them from there). Swift has a policy of clarity at the point
of use, which I interpret to mean that constants need to be defined CLOSE to the point at which they are used
in order to make it easier to understand what they are and how they are used. For that reason I try to declare
most constants as private and in the struct or class in which they are used. If a constant will be used across
several classes or structs, I will declare it in one particular struct or class as public and then reference
it from the other structs and classes.

3. I intentionally prefix instance variables ( member variables ) with "self" when using them because
I believe in being as explicit as possible in code. Prefixing the instance variable with "self" ensures that
a) one's intentions of using the instance variable rather than a local variable are clear and b) ensures that
if there is in fact a local variable with the same name that is shadowing the instance variable that the instance
variable will be used over the local variable.

4. I typically define the the plural of a type as the type name + "s" as an array of the unit type. This definition
will usually be placed after the definition of the unit type. For example, when I define "SquadMember", I define the
typealias "internal typealias SquadMembers = Array\<SquadMember\>" underneath the definition of the unit type. I do
this because more often than not one makes use of the Array of the unit types and so it's convenient to have the
plural defined as an array of the unit type.

5. I intentionally use JSONEncoder when sending JSON but NSJSONSerialization when decoding JSON for display, the reason for this being
it is usually easier to use JSONEncoder/JSONDecoder when working with JSON and structs/classes however I wish to display
the JSON that is coming back from the server in a tree structure ( i.e. in an NSOutlineView ) and in that case it is 
easier to have JSON come back as Arrays and Dictionaries than as structures and classes which is why NSJSONSerialization
is a better solution.

6. The fields handled for JSON are Object, Array, String, Number and Null, the reson for this being that these are the
primary types that constitute JSON. I considered handling dates and times as well but there is no way of accurately 
distinguishing a date or time field from any other numeric field in a valid way. If one is decoding a known piece of
JSON then one could correctly decode dates and times but that severely limits the flexibility of the tool.
