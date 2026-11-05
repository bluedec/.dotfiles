" Forzar el análisis desde el inicio del buffer: pseudoRegistro es una región
" multilínea y sin esto Vim puede perder su estado al calcular sintaxis en
" medio del archivo (p. ej. con synID() en los scripts de abajo, o al hacer scroll)
syntax sync fromstart

syntax keyword accion ACCION accion FIN_ACCION fin_accion FA fa ES es AMBIENTE ambiente PROCESO proceso FIN_AMBIENTE fin_ambiente FAM fam FIN_PROCESO fin_proceso FPR fpr
syntax keyword accion HV LV
highlight link accion Constant

syntax keyword condicionales PARA para MOD mod HASTA hasta TO to FIN_PARA fin_para FP fp MIENTRAS mientras REPETIR repetir FIN_REPETIR fin_repetir FREP frep HASTA QUE hasta que FIN_MIENTRAS fin_mientras FM fm SI si HACER hacer SINO sino FIN_SI fin_si FS fs SEGUN segun FIN_SEGUN fin_segun FSG fsg FUNCION funcion FIN_FUNCION fin_funcion FF ff PROCEDIMIENTO procedimiento FIN_PROCEDIMIENTO fin_procedimiento FPC fpc
syntax keyword condicionales entonces
syntax keyword condicionales SUBACCION subaccion FIN_SUBACCION fin_subaccion FSA fsa
highlight link condicionales Conditional

syntax keyword pseudoKeyword ABRIR Abrir abrir CERRAR Cerrar cerrar GRABAR Grabar grabar ARR arr AVZ avz CREAR Crear crear
syntax keyword pseudoKeyword FUNCTION function FUNCION funcion RETURN return
syntax keyword pseudoKeyword LEER Leer leer ESCRIBIR Escribir escribir ESC Esc esc
syntax keyword pseudoKeyword REGISTRO registro FIN_REGISTRO fin_registro FR fr
syntax keyword pseudoKeyword ARCHIVO Archivo archivo FIN_ARCHIVO fin_archivo FAR far
highlight link pseudoKeyword Keyword

syntax keyword datatype ALFA alfa ENTERO entero REAL real ARCHIVO Archivo archivo SECUENCIA secuencia DE de
syntax keyword datatype CARACTER caracter ARREGLO arreglo LOGICO logico
syntax keyword datatype ALFANUMERICO alfanumerico AN an
highlight link datatype Type

syntax keyword boolean TRUE true FALSE false V v F f VERDADERO verdadero FALSO falso
highlight link boolean Boolean

syntax match pseudoNumber "\<[0-9]\+\>"
highlight link pseudoNumber Number

syntax keyword pseudoNil NIL nil Nil
highlight pseudoNil ctermfg=117 guifg=#87d7ff

syntax match pseudoComment "//.*$"
highlight link pseudoComment Comment

syntax region pseudoString start=/"/ end=/"/
syntax region pseudoString start=/'/ end=/'/
highlight link pseudoString Character

syntax keyword datatype PTR ptr Ptr

" Variables con := después
syntax match pseudoVar "\<\h\w*\ze\s*:="
highlight pseudoVar ctermfg=211 guifg=#ff87af

" Operadores: aritméticos, comparación y asignación
syntax match pseudoOperator ":=\|<>\|<=\|>=\|[+\-*<>=]\|/\(\/\)\@!"
highlight link pseudoOperator Operator

" Acceso a campos de un registro: P.campo, *P.campo
syntax match pseudoFieldAccess "\.\zs\h\w*\>"
highlight pseudoFieldAccess ctermfg=114 guifg=#87d787

" Bloque = registro ... fr
syntax region pseudoRegistro matchgroup=pseudoKeyword
      \ start="=\s*\cregistro\>"hs=e-7
      \ end="\c\<\(fin_registro\|fr\)\>"
      \ contains=pseudoField,datatype,boolean,pseudoNumber,pseudoComment,pseudoString,pseudoNil,pseudoRegistro,pseudoRegistroName

" Fields: solo dentro de un registro
syntax match pseudoField "\<\h\w*\ze\s*:\(=\)\@!" contained
highlight link pseudoField Identifier

" Resaltar en todo el archivo las variables asignadas con :=
highlight link pseudoVarUse pseudoVar

" Aplica un color a una lista de nombres en todo el buffer, pero nunca justo
" después de un "." (ahí manda pseudoFieldAccess, aunque el nombre coincida
" con una variable/función/registro conocido)
function! s:ResaltarPalabras(grupo, nombres) abort
  silent! execute 'syntax clear' a:grupo
  if empty(a:nombres)
    return
  endif
  let patron = '\%(\.\)\@<!\<\%(' . join(a:nombres, '\|') . '\)\>'
  execute 'syntax match' a:grupo '"' . patron . '"'
endfunction

" Nombres de tipo registro: propio color, igual en la definición y donde se usan
highlight pseudoRegistroName ctermfg=141 guifg=#af87ff

function! s:ResaltarRegistros() abort
  let regs = {}
  for lnum in range(1, line('$'))
    let linea = getline(lnum)
    let m = matchlist(linea, '\c\<\(\h\w*\)\>\s*=\s*registro\>')
    if !empty(m)
      let regs[m[1]] = 1
    endif
  endfor
  call s:ResaltarPalabras('pseudoRegistroName', keys(regs))
endfunction

" Nombres de función/procedimiento: propio color, igual en definición y en cada llamada
highlight pseudoFunctionUse ctermfg=215 guifg=#ffaf5f

function! s:ResaltarFunciones() abort
  let funcs = {}
  for lnum in range(1, line('$'))
    let linea = getline(lnum)
    let m = matchlist(linea, '\c\<\%(funcion\|function\|procedimiento\)\>\s\+\(\h\w*\)')
    if !empty(m)
      let funcs[m[1]] = 1
    endif
  endfor
  call s:ResaltarPalabras('pseudoFunctionUse', keys(funcs))
endfunction

function! s:ResaltarVars() abort
  let vars = {}
  for lnum in range(1, line('$'))
    let linea = getline(lnum)
    let inicio = 0
    while 1
      let m = matchstrpos(linea, '\<\h\w*\ze\s*:=', inicio)
      if m[1] < 0 | break | endif
      " Solo si no es una palabra reservada ni está en un comentario/string
      let grupo = synIDattr(synID(lnum, m[1] + 1, 1), 'name')
      if grupo ==# 'pseudoVar' || grupo ==# 'pseudoVarUse'
        let vars[m[0]] = 1
      endif
      let inicio = m[2]
    endwhile
  endfor

  " Variables declaradas en el ambiente: uno o varios nombres separados por
  " comas antes de ":" (sin necesidad de ":=" para colorearlas)
  for lnum in range(1, line('$'))
    let linea = getline(lnum)
    let m = matchlist(linea, '^\s*\(\h\w*\%(\s*,\s*\h\w*\)*\)\s*:\(=\)\@!')
    if !empty(m)
      let col = stridx(linea, m[1]) + 1
      let grupo = synIDattr(synID(lnum, col, 1), 'name')
      " Excluir los campos declarados dentro de un registro
      if grupo !=# 'pseudoField'
        for nombre in split(m[1], '\s*,\s*')
          let vars[nombre] = 1
        endfor
      endif
    endif
  endfor

  call s:ResaltarPalabras('pseudoVarUse', keys(vars))
endfunction

augroup PseudoVars
  autocmd! * <buffer>
  autocmd BufEnter,InsertLeave,TextChanged <buffer> call s:ResaltarRegistros()
  autocmd BufEnter,InsertLeave,TextChanged <buffer> call s:ResaltarFunciones()
  autocmd BufEnter,InsertLeave,TextChanged <buffer> call s:ResaltarVars()
augroup END
call s:ResaltarRegistros()
call s:ResaltarFunciones()
call s:ResaltarVars()
