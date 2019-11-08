% VERBES WILL BE STORED HERE
:- include('nombres.pl').


verbo([come|S],S).
verbo([aterrizar|S],S).
verbo([despegar|S],S).


%HACERES PERMITIDOS
hacer('aterrizar').
hacer('despegar').



verificar_compatibilidad_de_preg(E,S):-
                (hacer(X), member(X,E)) -> verificar_compatibilidad_de_involucrados(X,E,S); S = S.
                               

verificar_compatibilidad_de_eme(X,E,S):-
         verificar_compatibilidad_de_emergencia(X,E,S).