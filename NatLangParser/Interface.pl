
% NATURAL LANGUAGE PARSER
% YOU WILL FIND THESE FILES IN THE SAME FOLDER YOU FOUND
% THE CURRENT .pl FILE.
:- include('NaturalLangParser.pl').


logic(farid,engeneer).
logic(carlos,doctor).


calling_tower_control:- % !!! INICIO DEL PROGRAMA !!!
        write("BIENVENIDOS A MayCEy, POR FAVOR LEA LAS SIGUIENTES INSTRUCCIONES :"),
        nl,write("1) TODAS LAS LINEAS DEBEN TERMINAR CON PUNTO (.)"),
        nl,nl,nl,tower_control.


tower_control:-   
        nl,write("<User>  "),read(Input),   %WAIT FOR MY INPUT.
        string_lower(Input, L),              %LOWER CASE THE INITIAL INPUT (PROGRAM WORKS IN LOWER CASE).
        atom_string(Atom, L),                %STRING_LOWER() WILL GIVE A STRING, SO ATOM_STRING() CONVERTS TO "ATOM" DATA.
        text_to_list(Atom,Output),               %LOGIC (!!!! PROGRAM STARTS HERE !!!!)
        write("<MayCEy>|: "),write(Output),   %COMPUTER WRITES THE OUTPUT.
        tower_control.                %LOOPS THROGH FOR NEVER ENDING CONVERSATION.



                  
                
