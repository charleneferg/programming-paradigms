
direct_connect(X,Y,S,F) :- next(X,Y), not(member(Z,S)), direct_connect(Z,Y,[Z|S],F).
direct_connect(X,Y,S,[Y|S]) :- next(X,Y).

adjacent(X,Y) :- 

connect(X,Y) :- adjacent(X,Y).
connect(X,Y) :- adjacent(X,Z), connect(Z,Y).

add_connect(X,Y,S,F) :- connect(X,Z), not(member(Z,S)), add_connect(Z,Y,[Z|S],F).
add_connect(X,Y,S,[Y|S]) :- connect(X,Y).