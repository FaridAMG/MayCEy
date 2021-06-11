% NAMES WILL BE STORED HERE
:- include('communication.pl').
:- include('conocimiento.pl').




verificar_compatibilidad_de_involucrados(X,E,S):-   %Pregunta por dias de entrenamiento a la semana y la disciplina que le gusta.
                                            (ejercicio(M,T), % PARA ALGUNA DISCIPLINA
                                            member(M,E),     % Usuario provee todos los tokens
                                            member(T,E) -> verificar_alguna_enfermedad(E,T,S); % SI HAY, ASIGNA elplan
                                        
                                        
                                            (ejercicio(M,T), %Busca tipo de disciplina solamente 
                                            member(T,E), the_trainer_comm('En qué disciplina le gustaría especializarse?',R),
                                            member(M,R)  -> prof(Y,F), member(T, F),  verificar_alguna_enfermedad(E,Y,S)); %Verifica si la disciplina esta dentro de la base de conocimiento y 
                                                                                                        %cual profesionalizmo tiene el usuario con la disciplina.
                                            (ejercicio(M,T), the_trainer_comm('Actualmente, cuantas días por semana haces ejercicio?',R)
                                             ->  verificar_compatibilidad_de_involucrados(X,R,S) ); % Pregunta cuantos dias a la semana estaba entrenando anteriormente 
                                                                                          
                                            S = 'Mejor, volvamos a intentar...' %SI TODO LO DEMAS FALLA, MUESTRA ESTE ERROR
                                        
                                        ).


verificar_alguna_enfermedad(E,T,S):-   %Pregunta por enfermedad



                                            
                                        
                                           ((the_trainer_comm('Tienes algún padecimiento del que debería saber?',R), %Pregunta si elusasario tiene algun padecimiento
                                            padec(C,M), %revisa si la respuesta del usuario contiene un padecimiento que reconoce
                                            member(C,R)  ->   asignacion_de_plan(M,T,S)); %envia la informacion para asignar un plan

                                            
                                            S = 'Mejor, volvamos a intentar...' %SI TODO LO DEMAS FALLA, MUESTRA ESTE ERROR
                                        
                                        ).

                                            
asignacion_de_plan(M,T,R):- %Con la informacion anterior asigna un plan viable

                     






                    ( elplan(A,M,C) -> %filtra el plan adecuado
                                             
                    atom_concat('Ok, basado en lo anterior le voy a asignar el',A, P), %crea la respuesta para enviarle al usuario 
                    atom_concat(P,' el cual es de tipo ',Y),
                    atom_concat(Y,T,V),
                    atom_concat(V,' y consiste de ',K),
                    atom_concat(K,C,W),
                    atom_concat(W, 'Le parece?', R)
                    
                    );

                    




                           % En el caso de que nada funcione se envia un mensaje de advertencia. pues significa que no hay reglas 
                    R = 'Perdon, honestamente no se que plan proponerle.'.
                           % que se puedan probar.









                                                
                                            

                                             



                                    