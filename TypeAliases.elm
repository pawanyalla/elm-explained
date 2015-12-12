module TypeAliases where

{- A type alias doesn't define a type, it simply provides a convenient
   alternative name for another type or record shape.

   We can see this in action in this example. It will compile perfectly,
   and each output function will return a String. We may use the
   symbols Ship and Person, but the compiler sees them both the same,
   as a record with a name field.
-}

type alias Ship = { name : String }
type alias Person = { name : String }

-- We'll create a Ship and a Person, but in fact they are both just
-- a record with a name field. The compiler only sees them as this.

vessel : Ship
vessel = { name = "HMS Splendid" }

captain : Person
captain = { name = "Captain Robert Q. Peabody" }

-- Here are two functions which seem to take a Ship and a Person as
-- arguments, but in fact they are really just taking a record with
-- a name field.

launch : Ship -> String
launch s
  = "I name this ship " ++ s.name

greet : Person -> String
greet p
  = "Hello there, " ++ p.name

-- Here we launch a ship and greet a person. As you'd expect, both
-- functions compile fine and give the expected output.

launchShip = launch vessel
greetPerson = greet captain

-- But these next two functions also compile and execute okay.
-- That's because Ship and Person are not types, they're just aliases
-- for a record with a name field.

launchPerson = launch captain
greetShip = greet vessel

{- We can execute this in the Elm REPL to check

   > import TypeAliases
   > TypeAliases.launchShip
   "I name this ship HMS Splendid" : String
   > TypeAliases.greetPerson
   "Hello there, Captain Robert Q. Peabody" : String
   > TypeAliases.launchPerson
   "I name this ship Captain Robert Q. Peabody" : String
   > TypeAliases.greetShip
   "Hello there, HMS Splendid" : String
   >
   
-}