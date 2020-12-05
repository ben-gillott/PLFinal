# Type Assistance for Graphics System (T.A.G.S.)

The goal of this language is to eliminate subtle bugs when transforming between reference points or coordinate systems. This is inspired by the subtle bugs in computer graphics, transforming between 3D references such as "Model", or "World".

**T.A.G.S.** reduces these errors by adding a "tag" to each expression. For example a Vector with the tag "coordinate system : cartesian". This would then be unable to be added to a Vector with the tag "coordinate system : spherical" as that would violate correctness! Thus it will force transformation correctness.

So far I have implemented a basic language similar to the arithmetic language, with variables, if, and basic binary operations. 


*Example - Code*
```
let exprOut = parse "let x = 3110 in x + x";;
->
Let ("x", Int 3110, Binop (Add, Var "x", Var "x"))
```

I then implemented a Vector2 expression to familiarize myself with the codebase - and while Tags could work perfectly fine on Ints or even Bools, it is nice to have something more graphics-y to keep the goals in mind. I ran into quite a bit of trouble implementing the Vector2 in the lexer and parser, but eventually got it working.

*Example - Vector*
```
parse "vector2(1 2)";;
->
Vector2 (Int 1, Int 2)
```

Next was the basic Tag system. For now I implemented it as a wrapper around expressions, of the form TaggedExpr(string * expr). Getting the parser to implement this was a bit tricky, but by implementing the keyword "tagged" I was able to make the syntax unique enough to be error free. 

*Example - Tag*
```
parse "(vector2(1 2)) tagged {coordinateSystem:cartesian}";;
->
TaggedExpr (Vector2(Int 1, Int 2), "coordinateSystem:cartesian")
```


*Example - More Abstract Tags*
```
parse "(42) tagged {coolnessOfInteger : veryCool}";;
->
TaggedExpr (Int 42, "coolnessOfInteger : veryCool")
//Which can now be only added with other Ints tagged as very cool integers
```

The final steps for this project will be to implement a less naive type checker that functions more as intended, and checks the values of multiple tags. I also aim to redesign the Tag structure from (string * expr) to (expr * List(string * string)). This will allow for less string parsing and smoother type checking.