move(X,Y):- move(X,Y).
move(X,Y) :- move([A,B],[C,D]).
move([A,B],[C,D]):- A == C, B == D .
move([A,B],[C,D]):- D > B, Next is B + 1. 

add_move(X,Y,S,F) :- move(X,Z), not(member(X,S)), add_move(X,Y,[X|S],F).


