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
  |_ -> failwith "IllTyped"


let rec check_exp (e:exp) : typ =
  check_exp2 [] e
