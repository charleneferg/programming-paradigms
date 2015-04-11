engine(d1).
engine(d2).
engine(d3).
assign(T1,T2,T3,T4) :-
    engine(T1),
    engine(T2),
    engine(T3),
    engine(T4),
    T1 \= T2,
    T2 \= T3,
    T2 \= T4,
    T3 \= T4,
    T3 \= d3,
    T4 \= d2,
    T4 \= d3.