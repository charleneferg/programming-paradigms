createMaze(Row, Col, List) :- numlist(1, Row, Rowlist), numlist(1, Col, Colist).

createCol(_,N,_) :- N =< 0.
createCol(R,C,L1) :- N > 0, N is C - 1, createCol(R,N,K1), append(K1, [R,C], L1). 

createRow(R,C,_) :- R =< 0.  
createRow(R,C,L1) :- createCol(R,C,L1), N1 is R - 1, createRow(N1, C, L1).

createList(R,C,List) :- createRow(R,C,L1). 