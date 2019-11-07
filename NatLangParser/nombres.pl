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
aeronave(717,med,lima).
aeronave(190,med,romeo).
aeronave(medium,med,tango).%a220
aeronave(747,gran,yankee).
aeronave(a340,gran,echo).
aeronave(a380,gran,oscar).

%NOMBRE DE PISTAS(nombre, km, direccion, velocidad max p'aterrizar)
pista(p1,peq,'',200).
pista('p2-1',med,'este a oeste',300).
pista('p2-2',med,'oeste a este',300).
pista(p3,gran,'',400).

%NOMBRE DE LAS EMERGENCIAS
emergen(perdida,motor,tren).
emergen(parto,'','').
emergen(paro,cardiaco,respiratorio).
emergen(secuestro,'','').





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
                    atom_concat(K,' con orientacion ',W),
                    atom_concat(W,C,R)
                    
                    );

                    (X == 'despegar', pista(A,T,C,D), C == '' -> 
                    
                    atom_concat('Permiso para despegar desde la pista ',A, P),
                    atom_concat(P,' de una vez ',R)
                    
                    
                    );

                    (X == 'despegar', pista(A,T,C,D) -> 
                    
                    atom_concat('Permiso para despegar desde la pista ',A, P),
                    atom_concat(P,' con orientacion ',W),
                    atom_concat(W,C,R)
                    
                    );

                    R = 'Perdon, no entiendo'.




                                                
                                            

                                             



                                    