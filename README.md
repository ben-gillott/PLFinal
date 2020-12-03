CS 4110 Final Project - Beta
==================

===Credits===
Ocamlyyx code taken from the textbook at: https://www.cs.cornell.edu/courses/cs3110/2019sp/textbook/interp/intro.html


Requires:
opam install ocamlfind
opam install ocamlbuild

===Build===
make clean
    Remove any byte files and the _build folder

make build
    Build the project without running it
    
make test
    Run the tests in the test folder

make
    build and enter utop

While in utop there are two functions, parse (string) and typecheck (expression)

Example use
    let exprOut = parse "let x = 3110 in x + x";;
        //yields Let ("x", Int 3110, Binop (Add, Var "x", Var "x"))
    typecheck exprOut;;


