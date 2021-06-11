

the_trainer_comm(C,O):-   
    write("<MrTrainer>|: "),write(C),   %COMPUTADORA ESCRIBE LA SALIDA
   nl,write("<User>  "),read(U),   %ESPERA POR LA ENTRADA DEL USUARIO
    string_lower(U, L),              %VUELVE LA ENTRADA EN MINUSCULA
     atom_string(A, L),                %STRING_LOWER() DA UN STRING, PARA QUE ATOM_STRING() LO CONVIERTE EN DATO PARTICULA.
    text_to_list_comm(A,O).               %LOGICA (!!!! PROGRAMA EMPIEZA AQUI !!!!) 



text_to_list_comm(T,W) :- atom_string(T, S),           % Text_to_list('enter ASI', B). B = [entra, asi]
string_chars(S, C),    
chars_words(C, W).           % destruye un aentrada en sus particulas iniciales
%oracion(W,R),                 % W es el texto convertido en la lista
%length_1(X,R), L is X, X > 0, %checa si R no esta vacio 
                                         
         

chars_words([], []).
chars_words([C|Cs], Words) :-
strip_non_alpha([C|Cs], Rest),
chars_words_aux(Rest, Words).


chars_words_aux([], []).
chars_words_aux([C|Cs], [W|Ws]) :-
word_rest([C|Cs], W, Rest0),
strip_non_alpha(Rest0, Rest),
chars_words_aux(Rest, Ws).

% toma un alista y la divide en dos: un frente para cuando un predicado  predicate triunfa, 
%y un resto 
strip_non_alpha(List, Rest) :-
partition_sorted(not_alpha, List, _, Rest).

word_rest(List, Atom, Rest) :-
partition_sorted(alpha, List, Word, Rest),
atom_chars(Atom, Word).


not_alpha(X) :- \+ char_type(X, alnum). %datatype
alpha(X) :- char_type(X, alnum).   %datatype




partition_sorted(Goal, List, True, False) :-
partition_sorted_aux(List, Goal, True, False).

partition_sorted_aux([], _, [], []).
partition_sorted_aux([X|Xs], Goal, True, False) :-
(       call(Goal, X)
->      True = [X|True0],
    partition_sorted_aux(Xs, Goal, True0, False)
;       True = [], False = [X|Xs]
).