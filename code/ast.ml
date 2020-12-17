(** The type of binary operators. *)
type bop = 
  | Add
  | Mult
  | Leq

(* type tag = string * string *)
type tag = Tag of string * string

(** The type of the abstract syntax tree (AST). *)
type expr =
  | Var of string
  | Int of int
  | Bool of bool
  | Binop of bop * expr * expr
  | Let of string * expr * expr
  | If of expr * expr * expr
  | Vector2 of expr * expr
  | TaggedExpr of expr * tag