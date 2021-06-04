
% NATURAL LANGUAGE PARSER
% YOU WILL FIND THESE FILES IN THE SAME FOLDER YOU FOUND
% THE CURRENT .pl FILE.
:- include('NaturalLangParser.pl').


logic(farid,engeneer).
logic(carlos,doctor).


calling_the_trainer:- % !!! INICIO DEL PROGRAMA !!!
        write("BIENVENIDOS A MrTrainer, POR FAVOR LEA LAS SIGUIENTES INSTRUCCIONES :"),
        nl,write("1) TODAS LAS LINEAS DEBEN TERMINAR CON PUNTO (.)"), 
        nl,write("2) TEXTO DEBE ESTAR CONTENIDO ENTRE COMILLAS SIMPLES"),
        nl,nl,nl,the_trainer. % MUESTRA LAS REGLAS DEOL PROGRAMA


the_trainer:-   
        nl,write("<User>  "),read(Input),   %WAIT FOR MY INPUT.
        string_lower(Input, L),              %LOWER CASE THE INITIAL INPUT (PROGRAM WORKS IN LOWER CASE).
        atom_string(Atom, L),                %STRING_LOWER() WILL GIVE A STRING, SO ATOM_STRING() CONVERTS TO "ATOM" DATA.
        text_to_list(Atom,Output),               %LOGIC (!!!! PROGRAM STARTS HERE !!!!)
        write("<MrTrainer>|: "),write(Output),   %COMPUTER WRITES THE OUTPUT.
        the_trainer.                %LOOPS THROGH FOR NEVER ENDING CONVERSATION.



                  
                
