

position(farid,engeneer).
position(carlos,doctor).

find_position:-
        write('Whose position to know?'),nl,
        read(Input),nl,
        position(Input,Output),nl,
        write(Output).