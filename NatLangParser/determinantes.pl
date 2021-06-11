% DETERMINANTES WILL BE STORED HERE
:- include('verbos.pl').
:- include('conocimiento.pl').






%------------------------------------------------------------------------
%REGLAS DE LOS DETERMINANTES
%------------------------------------------------------------------------


% INICIO DE CONVERSACION
conv_starters(E,S) :-   % E es la entrada y S es la salida....
            inicio(X),
            member(X,E) -> S = 'Hola, en que te puedo ayudar'.


%FIN DE CONVERSACION
conv_enders(E,S) :- % E es la entrada y S es la salida....
            fin(X),
            member(X,E) -> S = 'Pura vida! Tenga un buen día'. 


%PREGUNTAS
conv_questions(E,S) :-     % E es la entrada y S es la salida....
            pregunta(X),
            member(X,E) -> verificar_compatibilidad_de_preg(E,S). % Regla esta en verbos.pl



%EMERGENCIAS
conv_emergencys(E,S) :-  % E es la entrada y S es la salida....
            emergencia(X),
            member(X,E) -> verificar_compatibilidad_de_eme(X,E,S). % Regla esta en verbos.pl









