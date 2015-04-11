something([H|T]) :- somethingelse(H, T).
somethingelse(X, [X]).
somethingelse(X, [_|T]) :- somethingelse(X, T).