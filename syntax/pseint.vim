if exists('b:current_syntax') | finish | endif

syn keyword pseintStatement 	proceso Proceso finproceso Finproceso FinProceso finProceso limpiar pantalla Limpiar Pantalla nextgroup=pseintFunction skipwhite
syn keyword pseintPrint			imprimir Imprimir
syn keyword pseintConditional	si sino finsi Si SiNo Sino Finsi FinSi
syn keyword pseintRepeat		repetir Repetir mientras Mientras
syn keyword pseintRepeat		finrepetir FinRepetir Finrepetir finRepetir
syn keyword pseintRepeat		finmientras FinMientras Finmientras finMientras
syn keyword pseintOperator		y o no entonces hacer que hasta
syn keyword pseintOperator		Y O No Entonces Hacer Que Hasta
syn keyword pseintBuiltIn		cadena Cadena caracter Caracter entero Entero real Real logico Logico
syn keyword pseintBuiltIn		cadenas Cadenas caracteres Caracteres enteros Enteros reales Reales logicos Logicos
syn	keyword	pseintBoolean		verdadero falso Verdadero Falso

syn region 	pseintString 		start=/"/ end=/"/ oneline 

syn match	pseintComment		'//.*$' display

syn match 	pseintNumber 		"\v<\d+>"
syn match 	pseintNumber 		"\v<\d+\.\d+>"

hi def link pseintNumber		Number
hi def link pseintString		String
hi def link pseintStatement		Statement
hi def link pseintPrint			Special
hi def link pseintFunction		Function
hi def link pseintConditional	Conditional
hi def link pseintRepeat		Repeat
hi def link pseintOperator 		Operator
hi def link pseintBuiltIn		Type
hi def link	pseintString		String
hi def link pseintBoolean		Boolean
hi def link pseintComment		Commnent

let b:current_syntax = 'pseint'
