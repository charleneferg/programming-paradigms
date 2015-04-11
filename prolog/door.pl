

door([1,1],[1,2]).
door([1,2],[1,3]).
door([1,3],[1,4]).
door([1,1],[2,1]).
door([2,1],[3,1]).

reverse([],A,A).
reverse([H|T],Acc,Result):- reverse(T,[H|Acc],Result).

go(X,Y,ActualPath) :- go1(X,Y,[],Path), reverse(Path,[],ActualPath).

go1(X,X,Route,Route).
go1(X,Y,Route,Path) :- door(X,Z), not(member(X,Route)), go1(X,Y,[X|Route],Path).
go1(X,Y,Route,Path) :- door(X,Z), not(member(Z,Route)), go1(Z,Y,[Z|Route],Path).
go1(X,Y,Route,Path):- door(Z,X), not(member(Z,Route)), go1(Z,Y,[Z|Route],Path).
