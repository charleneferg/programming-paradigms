mazeSize(5,9).
barrier(1,8).
barrier(2,1).
barrier(2,2).
barrier(2,4).
barrier(2,5).
barrier(3,4).
barrier(3,7).
barrier(3,9).
barrier(4,4).
barrier(4,7).
barrier(4,8).
barrier(4,9).
barrier(5,2).

reverse([],A,A).
reverse([H|T],Acc,Result):- reverse(T,[H|Acc],Result).

solve(From, To, Path) :- solve1(From, To, [], ActualPath), reverse(Path,[],ActualPath).
solve1(From, From, Route, Route).

solve1(From,To,Route,Path) :- door(From,Z), not(member(From,Route)), solve1(From,To,[From|Route],Path).

go1(X,Y,Route,Path) :- door(X,Z), not(member(Z,Route)), go1(Z,Y,[Z|Route],Path).

go1(X,Y,Route,Path):- door(Z,X), not(member(Z,Route)), go1(Z,Y,[Z|Route],Path).


barrier_list(List) :- findall([X,Y], (barrier(X,Y)), List).

