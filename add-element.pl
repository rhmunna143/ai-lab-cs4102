add_last([], X, [X]).
add_last([H|T], X, [H|R]) :-
add_last(T, X, R).

% input: add_last([1,2,3], 4, L).