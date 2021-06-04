% DETERMINANTES WILL BE STORED HERE
:- include('verbos.pl').


%LOS ARTICULOS (DETERMINADOS)
determinante([el|S],S).
determinante([la|S],S).
determinante([lo|S],S).
determinante([los|S],S).
determinante([las|S],S).

%LOS ARTICULOS (INDETERMINADOS)
determinante([un|S],S).%singular
determinante([una|S],S).
determinante([unos|S],S).%plural
determinante([unas|S],S).


%LOS DEMOSTRATIVOS ()
determinante([este|S],S).
determinante([esta|S],S).
determinante([estos|S],S).
determinante([estas|S],S).
determinante([ese|S],S).
determinante([esa|S],S).
determinante([esos|S],S).
determinante([esas|S],S).
determinante([aquel|S],S).
determinante([aquella|S],S).
determinante([aquellos|S],S).
determinante([aquellas|S],S).

%LOS POSESIVOS ()
determinante([mi|S],S).
determinante([mio|S],S).
determinante([mia|S],S).
determinante([tu|S],S).
determinante([tuya|S],S).
determinante([tuyo|S],S).
determinante([su|S],S).
determinante([suyo|S],S).
determinante([suya|S],S).
determinante([nuestra|S],S).
determinante([nuestro|S],S).
determinante([mis|S],S).
determinante([mios|S],S).
determinante([mias|S],S).
determinante([tuyos|S],S).
determinante([tuyas|S],S).
determinante([tu|S],S).
determinante([su|S],S).
determinante([suyo|S],S).
determinante([suya|S],S).
determinante([nuestros|S],S).
determinante([nuestras|S],S).

%LOS NUMERALES 

% (cardinales)
determinante([uno|S],S).
determinante([un|S],S).
determinante([una|S],S).
determinante([dos|S],S).
determinante([tres|S],S).
determinante([cuatro|S],S).
determinante([cinco|S],S).
determinante([seis|S],S).
determinante([siete|S],S).
determinante([ocho|S],S).
determinante([nueve|S],S).
determinante([diez|S],S).

% (ordinales)
determinante([primero|S],S).
determinante([segundo|S],S).
determinante([tercero|S],S).
determinante([cuatro|S],S).
determinante([quinto|S],S).
determinante([sexto|S],S).
determinante([septimo|S],S).
determinante([octavo|S],S).
determinante([noveno|S],S).
determinante([decimo|S],S).






%LOS INDEFINIDOS
determinante([algun|S],S).
determinante([alguno|S],S).
determinante([alguna|S],S).
determinante([ningun|S],S).
determinante([ninguno|S],S).
determinante([ninguna|S],S).
determinante([poco|S],S).
determinante([poca|S],S).
determinante([mucho|S],S).
determinante([mucha|S],S).
determinante([todo|S],S).
determinante([toda|S],S).
determinante([demasiado|S],S).
determinante([demasiada|S],S).
determinante([algunos|S],S).
determinante([algunas|S],S).
determinante([ningunos|S],S).
determinante([ningunas|S],S).
determinante([pocos|S],S).
determinante([pocas|S],S).
determinante([muchos|S],S).
determinante([muchas|S],S).
determinante([todos|S],S).
determinante([todas|S],S).
determinante([demasiados|S],S).
determinante([demasiadas|S],S).





%LOS INTERROGATIVOS/EXCLAMATIVOS
determinante([que|S],S).
determinante([cuanto|S],S).
determinante([cuantos|S],S).
determinante([cual|S],S).
determinante([cuales|S],S).
determinante([porque|S],S).
determinante([puedo|S],S).
determinante([permiso|S],S).





%LOS DE FIN DE CONVERSACION
determinante([gracias|S],S).
determinante([adios|S],S).



%LOS DE INICIO DE CONVERSACION
determinante([buenas|S],S).
determinante([buenos|S],S).
determinante([hola|S],S).



%LOS DE EMERGENCIAS
determinante([mayday|S],S).
determinante([7500|S],S).



%inicio_conv 
inicio(buenas). % TOKENS DE INICIO DE CONVERSACION
inicio(buenos).
inicio(hola).


%fin_conv 
fin(gracias). % TOKENS DE FIN DE CONVERSACION
fin(adios).

%pregunta_conv 
pregunta(que).  % TOKENS DE PREGUNTA HECHA POR EL USUARIO
pregunta(cuanto).
pregunta(cuantos).
pregunta(cual).
pregunta(cuales).
pregunta(porque).
pregunta(puedo).
pregunta(permiso).
pregunta(necesito).
determinante([quiero|S],S).
determinante([deseo|S],S).

%emergencia_conv 
emergencia(mayday). % TOKENS DE EMERGENCIA 
emergencia('7500').



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









