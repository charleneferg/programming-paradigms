:- consult('maze.pl').


/* Check that the values are within the range of the maze size*/
valid_range(X, Y) :- 
mazeSize(Row,Col),
numlist(1, Row, RowRange), 
numlist(1, Col, ColRange),
member(X, RowRange), member(Y, ColRange).


solve(From, To, Path) :- solve1(From,To,[],Path)

solve1(From, From, Route, Route).
solve1(From,To,Route,Path) :- door(X,Z), not(member(From,Route)), solve1(From,To,[From|Route],Path).
solve1(From,To,Route,Path) :- door(X,Z), not(member(To,Route)), solve1(From,To,[To|Route],Path).
solve1(From,To,Route,Path):- door(Z,X), not(member(To,Route)), solve1(Z,Y,[Z|Route],Path).


barrier_list(List) :- 
	findall([X,Y], 
	(barrier(X,Y)), List).



print_list([]).
print_list([H|Y]) :- tab(1), write(H),  print_list(Y).

column_number(X,L) :- numlist(1, X, L), tab(1), print_list(L).

width(0).
width(X) :- N is X - 1, write(--), width(N).

width2(0).
width2(X) :- N is X - 1, write(.), tab(1), width2(N).

divider(X) :- write(.+), width(X), write(+).  

row(Y,X,L2) :- numlist(1, Y, L2), print_row(X,L2).

print_row(_,[]). 
print_row(X,[H|T]) :- write(H), write('|'), width2(X), write('|'), nl, print_row(X,T).

output(X,Y) :- column_number(X,L), nl, divider(X), nl, row(Y, X, L2), divider(X).