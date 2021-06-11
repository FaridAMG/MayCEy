
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
        nl,write(""),read(Input),   %Espera por la entrada.
        string_lower(Input, L),              %Convierte todo en letra minuscula.
        atom_string(Atom, L),                %STRING_LOWER() le pasa a  ATOM_STRING() una entrada para  convertirla en "ATOM" DATA.
        text_to_list(Atom,Output),               %LOGICA (!!!! Programa empieza aqui !!!!)
        write("<MrTrainer>|: "),write(Output),   %Computadora escribe la salida.
        the_trainer.                %itera para un aconversación sin termino.



                  
                
