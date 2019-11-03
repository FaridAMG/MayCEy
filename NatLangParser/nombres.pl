% NAMES WILL BE STORED HERE
:- include('communication.pl').


nombre([hombre|S],S).
nombre([manzana|S],S).
nombre([cessna|S],S).
nombre([beechcraft|S],S).
nombre([phenom|S],S).
nombre([717|S],S).
nombre([a220|S],S).
nombre([747|S],S).
nombre([a340|S],S).
nombre([a380|S],S).
nombre([190|S],S).
%abecedario radiofonico
nombre([alfa|S],S).
nombre([bravo|S],S).
nombre([charlie|S],S).
nombre([delta|S],S).
nombre([echo|S],S).
nombre([foxtrot|S],S).
nombre([golf|S],S).
nombre([hotel|S],S).
nombre([juliett|S],S).
nombre([kilo|S],S).
nombre([lima|S],S).
nombre([mike|S],S).
nombre([november|S],S).
nombre([oscar|S],S).
nombre([papa|S],S).
nombre([quebec|S],S).
nombre([romeo|S],S).
nombre([sierra|S],S).
nombre([tango|S],S).
nombre([uniform|S],S).
nombre([victor|S],S).
nombre([whiskey|S],S).
nombre([xray|S],S).
nombre([yankee|S],S).
nombre([zulu|S],S).
%pistas
nombre([p3|S],S).
nombre([p2-2|S],S).
nombre([p2-1|S],S).
nombre([p1|S],S).


%NOMBRE DE AERONAVES (modelo, tamano, matricula)
aeronave(cessna,peq,delta).
aeronave(beechcraft,peq,charlie).
aeronave(phenom,peq,india).
aeronave(717,med,lima).
aeronave(190,med,romeo).
aeronave(a220,med,tango).
aeronave(747,gran,yankee).
aeronave(a340,gran,echo).
aeronave(a380,gran,oscar).

%NOMBRE DE PISTAS(nombre, km, direccion, velocidad max p'aterrizar)
pista(p1,1,'',200).
pista('p2-1',2,'este a oeste',300).
pista('p2-2',2,'oeste a este',300).
pista(p3,3,'',400).

%NOMBRE DE LAS EMERGENCIAS
emergen(perdida,motor,tren).
emergen(parto,'','').
emergen(paro,cardiaco,respiratorio).
emergen(secuestro,'','').





verificar_compatibilidad_de_involucrados(X,E,S):-   %Pregunta
                                            X = X,
                                            repeat,
                                            aeronave(M,_,_),
                                            ( member(M,E) -> S = 'Puede aterrizar'; 
                                            tower_control_comm('cual es su modelo',R),
                                             verificar_compatibilidad_de_involucrados(X,R,S) ).
                                                
                                            

                                             



                                    