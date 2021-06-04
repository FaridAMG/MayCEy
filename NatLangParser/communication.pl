

the_trainer_comm(C,O):-   
    write("<MrTrainer>|: "),write(C),   %COMPUTER WRITES THE OUTPUT.
   nl,write("<User>  "),read(U),   %WAIT FOR MY INPUT.
    string_lower(U, L),              %LOWER CASE THE INITIAL INPUT (PROGRAM WORKS IN LOWER CASE).
     atom_string(A, L),                %STRING_LOWER() WILL GIVE A STRING, SO ATOM_STRING() CONVERTS TO "ATOM" DATA.
    text_to_list_comm(A,O).               %LOGIC (!!!! PROGRAM STARTS HERE !!!!) 



text_to_list_comm(T,W) :- atom_string(T, S),           % Text_to_list('enter like this', B). B = [enter, like, this]
string_chars(S, C),    
chars_words(C, W).           % Basically destroys a String into alpha elements (simple chars)
%oracion(W,R),                 % W is the text converted to list.
%length_1(X,R), L is X, X > 0, %this checks if R is not empty (which, if it is, oracion is 
                                         
         

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


not_alpha(X) :- \+ char_type(X, alnum). %datatype
alpha(X) :- char_type(X, alnum).   %datatype


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