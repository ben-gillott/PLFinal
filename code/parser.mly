%{
open Ast
%}

%token <int> INT
/* %token <string> ID */
%token <string> STRING
%token TRUE
%token FALSE
%token LEQ
%token TIMES  
%token PLUS
%token LPAREN
%token RPAREN
%token RBRACK
%token LBRACK
%token COMMA
%token COLON
%token TAGGED
%token LET
%token EQUALS
%token IN
%token IF
%token THEN
%token ELSE
%token VECTOR2
%token EOF
%nonassoc IN
%nonassoc ELSE
%left LEQ
%left PLUS
%left TIMES  

%start <Ast.expr> prog

%%

prog:
	| e = expr; EOF { e }
	;
	
expr:
	| i = INT { Int i }
	| x = STRING { Var x }
	| TRUE { Bool true }
	| FALSE { Bool false }
	| VECTOR2; LPAREN; e1 = expr; COMMA; e2 = expr; RPAREN {Vector2(e1, e2)}
	| e1 = expr; LEQ; e2 = expr { Binop (Leq, e1, e2) }
	| e1 = expr; TIMES; e2 = expr { Binop (Mult, e1, e2) } 
	| e1 = expr; PLUS; e2 = expr { Binop (Add, e1, e2) }
	| LET; x = STRING; EQUALS; e1 = expr; IN; e2 = expr { Let (x, e1, e2) }
	| IF; e1 = expr; THEN; e2 = expr; ELSE; e3 = expr { If (e1, e2, e3) }
	| LPAREN; e=expr; RPAREN {e} 
	| LPAREN; e=expr; RPAREN; TAGGED; LBRACK; s = STRING; COLON; v = STRING; RBRACK {TaggedExpr (e, Tag(s, v))}
	;

	/* nonterminal value, subset of first 4, Int var bool expr, in parentheses */
	/* subset of expr lexing */
	
