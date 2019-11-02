% NATURAL LANGUAGE PARSER
% USING GLC (CONTEXT FREE GRAMMAR)


% THE VERBES, NAMES AND DETERMINANTES ARE STORED IN
% DIFFERENT FILES TO MAINTAIN ORDER IN CODE
% YOU WILL FIND THESE FILES IN THE SAME FOLDER YOU FOUND
% THE CURRENT .pl FILE.
:- include('determinantes.pl').
:- include('verbos.pl').
:- include('nombres.pl').


%-------------------------------------------------------------------
%DECLARATION OF THE ORIGINAL SINTAGMA
%-------------------------------------------------------------------
oracion(S0,S):- sintagma_nominal(S0,S1),      %oracion([el,hombre,come,la,manzana],[]). --> True
    sintagma_verbal(S1,S).                    %oración(S,[]). --> Gives me all possible options
%Nominal version of the sintagma
sintagma_nominal(S0,S):- determinante(S0,S1), nombre(S1,S).
%Verbal version of the sintagma
sintagma_verbal(S0,S):- verbo(S0,S).
sintagma_verbal(S0,S):- verbo(S0,S1), sintagma_nominal(S1,S).








%-------------------------------------------------------------------
%CONVERTS NORMAL INPUT TEXT TO APPROPRIATE LIST FOR oracion(S0,S)...
%-------------------------------------------------------------------
text_to_list(T,F) :- atom_string(T, S),           % Text_to_list('enter like this', B). B = [enter, like, this]
                     string_chars(S, C),    
                    chars_words(C, W),            % Basically destroys a String into alpha elements (simple chars)
                    oracion(W,R),                 % W is the text converted to list.
                    %length_1(X,R), L is X, X > 0, %this checks if R is not empty (which, if it is, oracion is 
                    identifing_key_words(W,F).                              % not seeing good structure of sentence ) 
                            
                                           
                         

chars_words([], []).
       chars_words([C|Cs], Words) :-
            strip_non_alpha([C|Cs], Rest),
            chars_words_aux(Rest, Words).
            
            
chars_words_aux([], []).
        chars_words_aux([C|Cs], [W|Ws]) :-
                word_rest([C|Cs], W, Rest0),
                strip_non_alpha(Rest0, Rest),
                chars_words_aux(Rest, Ws).
                
%I have used a predicate called partition_sorted/4 to define both word_rest/3 and strip_non_alpha/2.
% It takes a list and splits it in two: a front for which a predicate succeeds, 
%and a rest (the first element of the rest is the first element in the original list for which the predicate fails).
        strip_non_alpha(List, Rest) :-
                partition_sorted(not_alpha, List, _, Rest).
            
            word_rest(List, Atom, Rest) :-
                partition_sorted(alpha, List, Word, Rest),
                atom_chars(Atom, Word).
                
            
            not_alpha(X) :- \+ char_type(X, alpha).
            alpha(X) :- char_type(X, alpha).


% Finally, a naive definition for partition_sorted/4 : This definition is naive because 
%it only works properly if Goal succeeds or fails once without leaving behind choice points,
% and the input list is ground.

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
%MECANISMOS DE RAZONAMINETO (mecanismo hacia atras)................
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
identifing_key_words(E,S):-
                conv_emergencys(E,S);
                conv_questions(E,S);
                conv_starters(E,S);
                conv_enders(E,S);
                S = 'Perdon, no entendi. Repita...'.













