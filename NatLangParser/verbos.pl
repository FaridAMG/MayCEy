% VERBES WILL BE STORED HERE
:- include('nombres.pl').


verbo([come|S],S).
verbo([aterrizar|S],S).
verbo([despegar|S],S).


%HACERES PERMITIDOS
hacer('aterrizar').  % UN AVION PUEDE ATERIZAR O DESPEGAR. NADA MAS.
hacer('despegar').




verificar_compatibilidad_de_preg(E,S):- %VERIFICA SI HAY ALGUN HACERES PERMITIDOS, SI HAY, ENVIA A REGLA DE ABAJO.
                (hacer(X), member(X,E)) -> verificar_compatibilidad_de_involucrados(X,E,S); S = S.
                               

verificar_compatibilidad_de_eme(X,E,S):- % PASA LLAMADA DE EMERGENCIA A LA REGLA DE ABAJO.
         verificar_compatibilidad_de_emergencia(X,E,S).