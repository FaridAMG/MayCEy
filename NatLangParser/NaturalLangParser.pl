% NATURAL LANGUAGE PARSER
% USING GLC (CONTEXT FREE GRAMMAR)


% LOS VERBON NOMBRES Y DETERMINANTES SE ALOJAN EN LA BASE DE CONOCIMIENTO
% PARA MANTENER ORDEN EN EL CODIGO

:- include('determinantes.pl').
:- include('verbos.pl').
:- include('nombres.pl').


%-------------------------------------------------------------------
%DECLARACION DEL SINTAGMA ORIGINAL
%-------------------------------------------------------------------
oracion(S0,S):- sintagma_nominal(S0,S1),      %oracion([el,hombre,come,la,manzana],[]). --> True
    sintagma_verbal(S1,S).                    %oración(S,[]). --> DEME TODAS LAS OPCIONES POSIBLES
%version nominal del sintagma
sintagma_nominal(S0,S):- determinante(S0,S1), nombre(S1,S).
%version verbal del sintagma
sintagma_verbal(S0,S):- verbo(S0,S).
sintagma_verbal(S0,S):- verbo(S0,S1), sintagma_nominal(S1,S).








%-------------------------------------------------------------------
%convierte entrada del usuario en una lista oracion(S0,S)...
%-------------------------------------------------------------------
text_to_list(T,F) :- atom_string(T, S),           % Text_to_list('entra de esta manera', B). B = [entra, de, esta, manera]
                     string_chars(S, C),    
                    chars_words(C, W),            % destruye una oración en sus particulas
                    %oracion(W,R),                 % W es el texto convertido en una lista
                    %length_1(X,R), L is X, X > 0, %checa si R no esta vacia 
                    identifing_key_words(W,F).                               
                            

text_to_list_comm(T,W) :- atom_string(T, S),           % Text_to_list('entra de esta manera', B). B = [entra, de, esta, manera]
                string_chars(S, C),    
               chars_words(C, W).           % destruye una oración en sus particulas
               %oracion(W,R),                 % W es el texto convertido en una lista
               %length_1(X,R), L is X, X > 0, %checa si R no esta vacia 
                                                         
                         

chars_words([], []).
       chars_words([C|Cs], Words) :-
            strip_non_alpha([C|Cs], Rest),
            chars_words_aux(Rest, Words).
            
            
chars_words_aux([], []).
        chars_words_aux([C|Cs], [W|Ws]) :-
                word_rest([C|Cs], W, Rest0),
                strip_non_alpha(Rest0, Rest),
                chars_words_aux(Rest, Ws).
                
% Toma un alista y la convierte en dos:  
        strip_non_alpha(List, Rest) :-
                partition_sorted(not_alpha, List, _, Rest).
            
            word_rest(List, Atom, Rest) :-
                partition_sorted(alpha, List, Word, Rest),
                atom_chars(Atom, Word).
                
            
            not_alpha(X) :- \+ char_type(X, alnum).  %datatype ALNUM = alphanumerico
            alpha(X) :- char_type(X, alnum). %datatype   ALNUM = alphanumerico




partition_sorted(Goal, List, True, False) :-
        partition_sorted_aux(List, Goal, True, False).
    
    partition_sorted_aux([], _, [], []).
    partition_sorted_aux([X|Xs], Goal, True, False) :-
            (       call(Goal, X)
            ->      True = [X|True0],
                    partition_sorted_aux(Xs, Goal, True0, False)
            ;       True = [], False = [X|Xs]
            ).



length_1(0,[]).
length_1(L+1, [H|T]) :- length_1(L,T).




%__________________________________________________________________
%-------------------------------------------------------------------
%MECANISMOS DE RAZONAMINETO (mecanismo hacia adelate)................
%-------------------------------------------------------------------
%___________________________________________________________________

     %%%     %%%
     %%%     %%%
     %%%     %%%
%         %        %
 %%              %%
   %%%        %%%
     %%%%%%%%%%
       %%%%%%



% IDENTIFING KEYS WORDS.....
identifing_key_words(E,S):-               %IDENTIFICACION DE TOKENS SE DA AQUI
                conv_emergencys(E,S);     %FUNCIONA POR MEDIO DE PRIORIDAD
                conv_questions(E,S);      % VA EN ORDEN: emergencia, pregunta, inicio de conversacion
                conv_starters(E,S);      % y termino de conversacion
                conv_enders(E,S);
                S = 'Perdon, no entendi. Repita...'.  % SI NO ENCUENTRA NINGUN TOKEN MUESTRA ESTE MENSAJE DE ERROR













