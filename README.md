CS 4110 Final Project - Beta
==================

===Credits===
Ocamlyyx code taken from the textbook at: https://www.cs.cornell.edu/courses/cs3110/2019sp/textbook/interp/intro.html


===Build===
type "make" to enter utop

parse:
Example use
    # parse "let x = 3110 in x + x";;
    - : expr = Let ("x", Int 3110, Binop (Add, Var "x", Var "x"))
    parse expr;;

typecheck (expression)