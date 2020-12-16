open Ast

type error_info = string
exception IllTyped of error_info


let rec check_exp2 (s : (var * typ) list) (e:exp) : typ =
  match e with
  | True -> TBase "boolean"
  | False -> TBase "boolean"
  | Empty t -> t
  | Int i -> TBase "integer"
  | Var v -> snd (List.find (fun st -> fst st = v) s)
  (* | App of exp * exp -> *)
  | Lam (v,t,e) -> 
    (* Add v to store, then run on e *)
    TFun (t, (check_exp2 ((v,t)::s) e))
  | Let (v,e1,e2) -> 
    (* Set v to type t in store, and call check type on e2 with the new store *)
    check_exp2 ((v, (check_exp2 s e1))::s) e2
  | Binary (bop, e1, e2) ->
    (match bop with 
    | Plus -> 
      (match (e1,e2) with
      |(Int i1, Int i2) -> TBase "integer" 
      |_ -> failwith "IllTyped")
    | Minus-> 
      (match (e1,e2) with
      |(Int i1, Int i2) -> TBase "integer" 
      |_ -> failwith "IllTyped")
    | Times-> 
      (match (e1,e2) with
      |(Int i1, Int i2) -> TBase "integer" 
      |_ -> failwith "IllTyped")

    | Less ->
      (match (e1,e2) with
      |(Int i1, Int i2) -> TBase "boolean" 
      |_ -> failwith "IllTyped")
    | Greater ->
      (match (e1,e2) with
      |(Int i1, Int i2) -> TBase "boolean" 
      |_ -> failwith "IllTyped")
  
    | And ->
      (match (e1,e2) with
      |(True, True) -> TBase "boolean" 
      |(True, False) -> TBase "boolean" 
      |(False, True) -> TBase "boolean" 
      |(False, False) -> TBase "boolean" 
      |_ -> failwith "IllTyped")
    | Or -> 
      (match (e1,e2) with
      |(True, True) -> TBase "boolean" 
      |(True, False) -> TBase "boolean" 
      |(False, True) -> TBase "boolean" 
      |(False, False) -> TBase "boolean" 
      |_ -> failwith "IllTyped")

    | Cons -> 
    ( match (check_exp2 s e2) with
      |TList t -> 
        (match check_exp2 s e1 with 
          |t -> TList t
          |_ -> failwith "IllTyped"
        )
      |_ -> failwith "IllTyped")

    |Equal -> 
      (if (check_exp2 s e1) == (check_exp2 s e1)
        then TBase "boolean"
      else failwith "IllTyped"
      )

    |_ -> failwith "IllTyped")
  (* | Unary of unop * exp *)
  (* | Tuple of exp list *)
  (* | Proj of exp * int *)
  (* | Fix of exp *)
  (* | If of exp * exp * exp *)
  (* | Match of exp * exp * exp *)
  |_ -> failwith "IllTyped"


let rec check_exp (e:exp) : typ =
  check_exp2 [] e
