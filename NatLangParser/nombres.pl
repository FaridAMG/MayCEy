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
radio(alfa).
radio(bravo).
radio(charlie).
radio(delta).
radio(echo).
radio(foxtrot).
radio(golf).
radio(hotel).
radio(juliett).
radio(kilo).
radio(lima).
radio(mike).
radio(november).
radio(oscar).
radio(papa).
radio(quebec).
radio(romeo).
radio(sierra).
radio(tango).
radio(uniform).
radio(victor).
radio(whiskey).
radio(xray).
radio(yankee).
radio(zulu).
%pistas
nombre([p3|S],S).
nombre([p2-2|S],S).
nombre([p2-1|S],S).
nombre([p1|S],S).


%NOMBRE DE AERONAVES (modelo, tamano, matricula)
aeronave(cessna,peq,delta).

aeronave(beechcraft,peq,charlie).
aeronave(phenom,peq,india).
aeronave('717',med,lima).
aeronave('190',med,romeo).
aeronave('a220',med,tango).%a220
aeronave('747',gran,yankee).
aeronave('a340',gran,echo).
aeronave('a380',gran,oscar).

%NOMBRE DE PISTAS(nombre, km, direccion, velocidad max p'aterrizar)
pista(p1,peq,'',200).
pista('p2-1',med,'oeste',300).
pista('p2-2',med,'este',300).
pista(p3,gran,'',400).

%NOMBRE DE LAS EMERGENCIAS
emergen(perdida,'aterrizar'). % emergen(TOKEN,PROTOCOLO)
emergen(parto,'aterrizar').
emergen(paro,'aterrizar').
emergen(secuestro,'disimulo').
emergen('7500','disimulo').




verificar_compatibilidad_de_involucrados(X,E,S):-   %Pregunta
                                            (aeronave(M,T,A),
                                            member(M,E),
                                            member(A,E) -> asignacion_de_pista(X,T,S);
                                        
                                            (aeronave(M,T,A),
                                            member(M,E), tower_control_comm('Cual es la matricula de su aeronave...',R),
                                            member(A,R) ->  asignacion_de_pista(X,T,S));
                                        
                                            (aeronave(M,T,A),
                                            member(A,E), tower_control_comm('Cual es el modelo de su aeronave...',R),
                                            member(M,R) -> asignacion_de_pista(X,T,S));

                                            (aeronave(M,T,A), tower_control_comm('Cual es el modelo y matricula de su aeronave...',R)
                                             ->  verificar_compatibilidad_de_involucrados(X,R,S) );

                                            S = 'Credenciales incorrectos...'
                                        
                                        ).

                                            
asignacion_de_pista(X,T,R):-

                     
                
                    (X == 'aterrizar', pista(A,T,C,D), C == '' -> 
                    
                    atom_concat('Permiso para aterrizar en la pista ',A, P),
                    atom_concat(P,' a velocidad max de ',Y),
                    atom_concat(Y,D,V),
                    atom_concat(V,' Km/h ',R)
                    
                    );

                    (X == 'aterrizar', pista(A,T,C,D) -> 
                    
                    atom_concat('Permiso para aterrizar en la pista ',A, P),
                    atom_concat(P,' a velocidad max de ',Y),
                    atom_concat(Y,D,V),
                    atom_concat(V,' Km/h ',K),
                    atom_concat(K,' con orientacion al ',W),
                    atom_concat(W,C,R)
                    
                    );

                    (X == 'despegar', pista(A,T,C,D), C == '' -> 
                    
                    atom_concat('Permiso para despegar desde la pista ',A, P),
                    atom_concat(P,' de una vez ',R)
                    
                    
                    );

                    (X == 'despegar', pista(A,T,C,D) -> 
                    
                  tower_control_comm('A que sentido desea despegar, hacia el Este, o el Oeste...',F),
                    member(C,F),
                    atom_concat('Permiso para despegar desde la pista ',A, P),
                    atom_concat(P,' con orientacion al ',W),
                    atom_concat(W,C,R)
                    
                    );

                    R = 'Perdon, no tenemos pistas disponibles con sus especificaciones, permiso denegado'.



verificar_compatibilidad_de_emergencia(X,E,S):-

                    (X == 'mayday', emergen(M,P),
                    member(M,E), P == 'aterrizar' ->verificar_compatibilidad_de_involucrados(P,E,R),
                    atom_concat('EMERGENCIA:', R, T), atom_concat(T,' Los rescatistas van en camino! ',S)
                    
                       );

                       ((X == 'mayday'; X == '7500'),emergen(M,P),  P == 'disimulo',
                    member(M,E), ! -> S = 'Por motivo de mal tiempo en la pista del aeropuerto los vamos a desviar en direccion N.O, a un aeropuerto privado. Disculpe los inconvenientes.'
                    
                       );

                       (
                          X =='mayday', tower_control_comm('Atencion de emergencias aeronauticas: cual es su emergencia!',R),
                          emergen(M,P),
                          member(M,R), P == 'aterrizar' ->verificar_compatibilidad_de_involucrados(P,E,F),
                          atom_concat('EMERGENCIA:', F, T), atom_concat(T,' Los rescatistas van en camino! ',S)

                          );

                          (
                              (X == 'mayday'; X == '7500'), tower_control_comm('Atencion de emergencias aeronauticas: cual es su emergencia!',R),
                              emergen(M,P), P == 'disimulo',
                              member(M,R), ! -> S = 'Por motivo de mal tiempo en la pista del aeropuerto los vamos a desviar en direccion N.O, a un aeropuerto privado. Disculpe los inconvenientes.'
    
                              );

                          S = 'La situacion no se ha determinado como una Emergencia, siga protocolos estandar...'.

            







                                                
                                            

                                             



                                    