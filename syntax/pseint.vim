" Vim Syntax File
" Language:		PSeInt
" Maintainer:	Angel Berlanga <angel dot tigre at hotmail dot com>
" URL:			https://github.com/EddyBer16/pseint.vim
" Last Change:	2021-04-17
" Filenames:	*.psc
" Version:		0.8.0

if exists('b:current_syntax') | finish | endif

syn sync fromstart
syn case match

" BASIC TOKENS
syn match	pseintSemicolon	+;+
syn match	pseintAssignmentEqual	+=+ contained skipwhite skipempty nextgroup=@pseintExpression,pseintBuiltin,pseintIdentifier
syn match	pseintAssignmentArrow	+<-+ contained skipwhite skipempty nextgroup=pseintFunctionName,@pseintExpression,pseintBuiltin,pseintIdentifier

" Operators
" Mod operator (mod)
syn keyword	pseintModOperator	mod Mod skipwhite skipempty
" Arithmetic operators (^, **, *, %, /)
syn match	pseintOperator		+\%(\^\|\*\*\|[*%]\|/\%([/*]\)\@!\)+ skipwhite skipempty nextgroup=@pseintExpression
" Arithmetic operators (+, -)
syn match	pseintOperator		+\%([+-]\)+ skipwhite skipempty nextgroup=@pseintExpression
" Comparison operators (==, !=, >, >=, <, <=)
syn match	pseintOperator		+\%([=!]=\?\|[<>]=\?\)+ skipwhite skipempty nextgroup=@pseintExpression
syn cluster	pseintOperators		contains=pseintOperator

" Comments
syn keyword pseintCommentTodo 	contained TODO FIXME XXX TBD
syn region	pseintComment		start=+//+ end=/$/ contains=pseintCommentTodo,@Spell extend keepend

" Declaration
syn keyword	pseintDeclaration	definir Definir skipwhite skipempty nextgroup=pseintIdentifier
syn keyword pseintDeclarationType 	como Como skipwhite skipempty nextgroup=pseintVariableType
syn keyword pseintVariableType	cadena Cadena caracter Caracter entero Entero real Real logico Logico
syn keyword pseintVariableType	cadenas Cadenas caracteres Caracteres enteros Enteros reales Reales logicos Logicos
syn match	pseintIdentifier	+\<\K\k*\>+ contained skipwhite skipempty nextgroup=pseintDeclarationType,pseintAssignmentEqual,pseintAssignmentArrow,@pseintOperators

" Keywords
syn keyword pseintKeywords		escribir Escribir leer Leer skipwhite skipempty nextgroup=pseintString,pseintIdentifier

" STRINGS
syn region 	pseintString 		start=+\z(["]\)+ end=+\z1+ contains=@Spell oneline skipwhite skipempty nextgroup=@pseintOperators

" BUILT-IN VALUES
syn keyword	pseintBuiltin		verdadero falso Verdadero Falso pi PI 

" BUILT-IN FUNCTIONS
syn keyword	pseintBuiltinFunction	abs trunc redon rc sen cos tan asen acos atan ln exp azar contained
syn keyword pseintBuiltinFunction	Abs Trunc Redon Rc Sen Cos Tan Asen Acos Atan Ln Exp Azar contained
syn keyword pseintBuiltinFunction	longitud subcadena Subcadena subCadena concatenar convertiranumero Convertiranumero ConvertirAnumero convertirAnumero convertirANumero convertiraNumero mayuscular minusculas contained
syn keyword pseintBuiltinFunction	Longitud SubCadena Concatenar ConvertirANumero ConvertirATexto Mayusculas Minuscular contained

" PROPERTY ACCESSOR a[0]
syn region	pseintAccessor	matchgroup=pseintAccessorBrackets start=+\[+ end=+]+ contained contains=@pseintExpression skipwhite skipempty nextgroup=pseintAccessor,@pseintOperators

" FUNCTION
syn keyword pseintFunction	algoritmo Algoritmo proceso Proceso subproceso SubProceso subProceso skipwhite skipempty nextgroup=pseintFunctionName
syn keyword pseintFunction	finalgoritmo FinAlgoritmo Finalgoritmo finAlgoritmo 
syn match 	pseintFunctionName	+\<\K\k*\>+ contained skipwhite skipempty nextgroup=pseintFunctionArgs
syn keyword pseintEndFunction	finproceso FinProceso Finproceso finProceso
syn keyword pseintEndFunction	finsubproceso FinSubProceso FinSubproceso Finsubproceso finSubproceso finSubProceso finsubProceso
syn region 	pseintFunctionArgs	matchgroup=pseintFunctionParens start=+(+ end=+)+ contained contains=pseintComment,pseintIdentifier skipwhite skipempty fold

" FUNCTION CALL
syn match	pseintFunctionCall	+\<\K\k*\>\%(\_s*<\%(\_[^&|)]\{-1,}\%([&|]\_[^&|)]\{-1,}\)*\)>\)\?\%(\_s*\%(?\.\)\?\_s*(\)\@=+ contains=pseintBuiltinFunction skipwhite skipempty nextgroup=pseintFunctionCallArgs
syn region	pseintFunctionCallArgs	matchgroup=pseintFunctionParens start=+(+ end=+)+ contained contains=@pseintExpression skipwhite skipempty nextgroup=pseintAccessor,pseintFunctionCallArgs,@pseintOperators

" Conditionals
syn keyword pseintIf	si Si entonces Entonces skipwhite skipempty nextgroup=@pseintExpression
syn keyword pseintElse	sino Sino SiNo siNo
syn keyword pseintEndIf	finsi Finsi finSi FinSi

" LOGIC OPERATORS AND BOOLEANS
syn keyword pseintLogicOperators	y Y o O no No skipwhite skipempty nextgroup=@pseintExpression

" LOOPS
syn keyword	pseintFor		para Para hasta Hasta con Con paso Paso hacer Hacer skipwhite skipempty
syn keyword pseintEndFor	finpara Finpara FinPara finPara
syn keyword pseintWhile		mientras Mientras skipwhite skipempty
syn keyword pseintEndWhile  FinMientras finMientras finmientras finMientras

" Switch
syn keyword pseintSwitch		segun Segun skipwhite skipempty
syn keyword pseintEndSwitch		finsegun finSegun Finsegun FinSegun
syn keyword pseintSwitchDefault	de otro modo De Otro Modo

syn cluster pseintExpression	contains=pseintComment,pseintString,pseintNumber,pseintFunction

syn match 	pseintNumber 		+\d+
syn match 	pseintNumber 		"\v<\d+\.\d+>"

hi def link pseintNumber			Number
hi def link pseintString			String

" Basics
hi def link	pseintAssignmentEqual	Operator
hi def link	pseintAssignmentArrow	Operator

" Operators
hi def link pseintOperator			Statement
hi def link pseintLogicOperators	Operator
hi def link pseintModOperator		Operator

" Comments
hi def link pseintComment			Comment
hi def link	pseintCommentTodo		Todo

" Declaration
hi def link pseintDeclaration		Keyword
hi def link pseintDeclarationType	Keyword
hi def link pseintVariableType		Keyword

" Keywords
hi def link pseintKeywords			Type

" STRING AND VALUES
hi def link	pseintString			String
hi def link pseintBuiltin			Keyword
hi def link pseintBuiltinFunction	Operator

" FUNCTIONS
hi def link	pseintFunction			Statement
hi def link pseintEndFunction		Statement
hi def link	pseintFunctionName		Function
hi def link	pseintFunctionParens	Normal

" FUNCTION CALL
hi def link pseintFunctionCall		Function

" Conditionals
hi def link pseintIf				Conditional
hi def link pseintElse				Conditional
hi def link pseintEndIf				Conditional

" LOOPS
hi def link pseintFor				Repeat
hi def link pseintEndFor			Repeat
hi def link pseintWhile				Repeat
hi def link pseintEndWhile			Repeat

" Switch
hi def link pseintSwitch			Conditional
hi def link pseintSwitchDefault		Conditional
hi def link pseintEndSwitch			Conditional

let b:current_syntax = 'pseint'
