CS 4110 Final Project - Beta
==================

===Credits===
Ocamlyyx code taken from the textbook at: https://www.cs.cornell.edu/courses/cs3110/2019sp/textbook/interp/intro.html


===Build & Run Instructions===

You may need to run:
    opam install ocamlfind
    opam install ocamlbuild


You can then run the following commands:

make clean
    Remove any byte files and the _build folder

make build
    Build the project without running it
    
make test
    Run the tests in the test file

make
    build and enter utop

While in utop there are two functions, parse (string) and typecheck (expression)


See full list of examples in the demo pdf.




Example base language use:
    let exprOut = parse "let x = 3110 in x + x";;
        //yields Let ("x", Int 3110, Binop (Add, Var "x", Var "x"))
    typecheck exprOut;;

Example vector:
    parse "vector2(1 2)";;
        //Yields Vector2 (Int 1, Int 2)
    
Example Tag:
    parse "(vector2(1 2)) tagged {system:cartesian}";;
    //Yields: TaggedExpr (Vector2(Int 1, Int 2), "system:cartesian")

More Abstract Tag Example:
    parse "(1) tagged {coolnessOfInteger:veryCool}";;
    //Yields: TaggedExpr (Int 1, "coolnessOfInteger:veryCool")


