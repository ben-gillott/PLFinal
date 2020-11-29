open Ast 

let parse (s : string) : expr =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast


(* Example use
    # parse "let x = 3110 in x + x";;
    - : expr = Let ("x", Int 3110, Binop (Add, Var "x", Var "x"))
 *)