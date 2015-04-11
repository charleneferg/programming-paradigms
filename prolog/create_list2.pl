/* Create a list of integers */

create_list(0,[]).
create_list(N, M, K) :- X is N-1, create_list(X, K1), append(K1,[N],K).

printlist([]).
printlist([H|K]) :- tab(3), write(H), printlist(K).

output(Number) :- create_list(Number, List), printlist(List).  