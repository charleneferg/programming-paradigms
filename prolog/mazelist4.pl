mazeSize(2,3).

collist([], []).
collist([Row, 0], []).
collist([Row, Col], [[Row, Col] | L ]) :- 
							Col > 0, 
							N2 is Col - 1, 
							collist([Row, N2], L).

rowlist([], []).
rowlist([0, Col], []).
rowlist([Row, Col], List) :- 
							Row > 0, 
							N2 is Row - 1, append(List,Collist,Result), sort(Result,List),
							rowlist([N2, Col], List).



mazelist(List) :- mazeSize(X,Y), 
				collist([X,Y], Collist),
 				rowlist([X,Y], Rowlist),
 				append(Rowlist,Collist,Result), sort(Result,List).

 				/* List = [[1, 3], [2, 1], [2, 2], [2, 3]]  */