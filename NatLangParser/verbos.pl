% VERBES WILL BE STORED HERE
:- include('nombres.pl').
:- include('conocimiento.pl').





verificar_compatibilidad_de_preg(E,S):- %VERIFICA SI HAY ALGUN HACERES PERMITIDOS, SI HAY, ENVIA A REGLA DE ABAJO.
                (hacer(X), member(X,E)) -> verificar_compatibilidad_de_involucrados(X,E,S); S = S.
                               

