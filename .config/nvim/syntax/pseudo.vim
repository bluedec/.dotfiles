
syntax keyword accion ACCION FIN_ACCION ES AMBIENTE PROCESO FIN_AMBIENTE FIN_PROCESO
highlight link accion Constant

syntax keyword condicionales PARA HASTA TO FIN_PARA MIENTRAS REPETIR repetir fin_repetir FIN_REPETIR HASTA QUE hasta que FIN_MIENTRAS SI HACER SINO FIN_SI SEGUN FIN_SEGUN FUNCION funcion ambiente proceso fin_funcion FIN_FUNCION PROCEDIMIENTO FIN_PROCEDIMIENTO procedimiento fin_procedimiento 
syntax keyword condicionales SUBACCION FIN_SUBACCION FIN_PROCEDIMIENTO PROCEDIMIENTO procedimiento es fin_procedimiento FIN_PROCEDIMIENTO
highlight link condicionales Conditional

syntax keyword pseudoKeyword ABRIR Abrir CERRAR Cerrar GRABAR Grabar ARR AVZ crear CREAR
syntax keyword pseudoKeyword FUNCTION FUNCION RETURN
syntax keyword pseudoKeyword LEER Leer ESCRIBIR Esc Escribir ESC
syntax keyword pseudoKeyword REGISTRO FIN_REGISTRO
syntax keyword pseudoKeyword ARCHIVO FIN_ARCHIVO
highlight link pseudoKeyword Keyword

syntax keyword datatype ALFA alfa ENTERO entero REAL real Archivo ARCHIVO secuencia SECUENCIA de
syntax keyword datatype caracter CARACTER logico
highlight link datatype Type

syntax keyword boolean TRUE FALSE V F VERDADERO FALSO
highlight link boolean Boolean

syntax match pseudoNumber "\<[0-9]\+\>"
highlight link pseudoNumber Number

syntax match pseudoComment "//.*$"
highlight link pseudoComment Comment

syntax region pseudoString start=/"/ end=/"/
syntax region pseudoString start=/'/ end=/'/
highlight link pseudoString Character

