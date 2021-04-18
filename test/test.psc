// PSeInt Test File
//
// Language:			PSeInt
// Current Maintainer:	Angel Berlanga <angel dot tigre at hotmail dot com>
// URL:					https://github.com/EddyBer16/pseint.vim
// Last Change:			2021-04-17

subproceso print(text)
  escribir text;
finsubproceso

subproceso result <- sum(firstNumber, secondNumber)
  definir result como real;
  result = firstNumber + secondNumber;
finsubproceso

proceso main
  definir i como entero;
  definir boolean como logico;
  boolean = verdadero;
  i = 0;

  leer i;

  para i hasta 10 con paso 1 hacer
	escribir i;
  finpara

  si i < 10 y i > 0 o no i >= 20 entonces
    escribir "This is a string"
  sino
    i = sum(i, 3)
    i = i - 3;
    i = i * 3;
    i = i / 3;
    i = i ^ 2;
    i = rc(i);
    i = i ** 2;
    i = rc(i);
    escribir i % 3;
    escribir i mod 3;
  finsi

  segun i hacer
    1:
      escribir "1";
    2:
      escribir "2";
    de otro modo:
      escribir "n";
  finsegun
finproceso
