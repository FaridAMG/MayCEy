% NAMES WILL BE STORED HERE
:- include('communication.pl').


nombre([hombre|S],S).
nombre([manzana|S],S).
nombre([plan1|S],S).
nombre([plan2|S],S).
nombre([plan3|S],S).
nombre([plan4|S],S).
nombre([plan5|S],S).
nombre([plan6|S],S).
nombre([plan7|S],S).



%pistas
nombre([plan1|S],S).
nombre([plan2|S],S).
nombre([plan3|S],S).
nombre([plan4|S],S).


%NOMBRE DE ejercicios (nombre, tiempo, intensidad)
ejercicio(futbol,'1 hora',aficionado).
ejercicio(ciclismo,'3 hora',semiprofesional).
ejercicio(karate,'2 hora',profesional).


%NOMBRE DE planes(nombre, intensidad, dias x semana, plan)
elplan(plan1,aficionado,'3 días por semana','correr, comer bien, ser saludable').
elplan(plan2,semiprofesional,'5 días por semana','correr, comer bien, ser saludable').
elplan(plan3,profesional,'7 días por semana','correr, comer bien, ser saludable').
elplan(plan4,profesional,'7 días por semana','correr, comer bien, ser saludable').








verificar_compatibilidad_de_involucrados(X,E,S):-   %Pregunta
                                            (ejercicio(M,T,A), % PARA ALGUN AERONAVE
                                            member(M,E),     % BUSCA SI HAY ALGUN TOKEN QUE LE PERTENEZCA
                                            member(A,E) -> asignacion_de_pista(X,T,S); % SI HAY, ASIGNA elplan
                                        
                                            (ejercicio(M,T,A), % En este caso si hay modelo y no matricula, busca matricula.
                                            member(M,E), the_trainer_comm('Quieres un plan profesional, semiprofesional, o aficionado?',R),
                                            member(A,R) ->  asignacion_de_pista(X,T,S));
                                        
                                            (ejercicio(M,T,A), %En este caso si hay matricula y no modelo, busca modelo. 
                                            member(A,E), the_trainer_comm('En qué disciplina le gustaría especializarse?',R),
                                            member(M,R) -> asignacion_de_pista(X,T,S));

                                            (ejercicio(M,T,A), the_trainer_comm('Que disciplina quiere practicar? y le gustaría un plan profesional, semiprofesional, o aficionado?',R)
                                             ->  verificar_compatibilidad_de_involucrados(X,R,S) ); % SI NO LE DAN NADA DE UNA VEZ 
                                                                                          %PREGUNTA AMBAS COSAS, Y CREA PROCESO RECURSIVO.
                                            S = 'Credenciales incorrectos...' %SI TODO LO DEMAS FALLA, MUESTRA ESTE ERROR
                                        
                                        ).

                                            
asignacion_de_pista(X,T,R):-

                     
                
                    (X == 'aterrizar', elplan(A,T,C,D), C == '' -> % depende de lo que ocupe. en este caso al aterrizar
                                                      % C == '' sgnifica que la elplan no tiene un sentido de partida
                    atom_concat('Permiso para aterrizar en la elplan ',A, P),
                    atom_concat(P,' a velocidad max de ',Y),
                    atom_concat(Y,D,V),
                    atom_concat(V,' Km/h ',R) % Estos comandos simplemente crean una respuesta para darle
                                             % al usuario.
                    );

                    (X == 'aterrizar', elplan(A,T,C,D) -> 
                                             % este algoritmo es igual al anterior, solo que para pistas con un sentido
                    atom_concat('Permiso para aterrizar en la elplan ',A, P), % de partida o entrada.
                    atom_concat(P,' a velocidad max de ',Y),
                    atom_concat(Y,D,V),
                    atom_concat(V,' Km/h ',K),
                    atom_concat(K,' con orientacion al ',W),
                    atom_concat(W,C,R)
                    
                    );

                    (X == 'despegar', elplan(A,T,C,D), C == '' -> 
                                             % ESte algoritma tambien es parecido al primero de estos.
                    atom_concat('Permiso para despegar desde la elplan ',A, P), % toma las variables equivalentes entre avion y elplan
                    atom_concat(P,' de una vez ',R)           % esto significa que si hay 
                    
                    
                    );

                    (X == 'despegar', elplan(A,T,C,D) -> 
                                              % La diferencia en este recide en que pide orientacion de salida
                  the_trainer_comm('A que sentido desea despegar, hacia el Este, o el Oeste...',F),% para cuando se ocupa despegar
                    member(C,F),
                    atom_concat('Permiso para despegar desde la elplan ',A, P),
                    atom_concat(P,' con orientacion al ',W), % Luego simplemente formula una respuesta
                    atom_concat(W,C,R)
                    
                    );
                           % En el caso de que nada funcione se envia un mensaje de advertencia. pues significa que no hay reglas 
                    R = 'Perdon, no tenemos pistas disponibles con sus especificaciones, permiso denegado'.
                           % que se puedan probar.









                                                
                                            

                                             



                                    