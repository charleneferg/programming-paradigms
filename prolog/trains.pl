train(t1). 
train(t2).
train(t3).
train(t4).
engine(d1).
engine(d2).
engine(d3).

same_time(train(t1), train(t2)).
same_time(train(t2), train(t3)).
same_time(train(t2), train(t4)).
same_time(train(t3), train(t4)).

same_time(X,Y):- pull(A,X) , pull(B,Y), \+(A = B).  

pull(X,Y) :- engine(X), train(Y), Y = t3,  \+ (X = d3).
pull(X,Y) :- engine(X), train(Y), Y = t4,  \+ (X = d3), \+ (X = d2).
