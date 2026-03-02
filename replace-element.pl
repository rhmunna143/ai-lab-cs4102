replace([], _, _, []).
replace([X|T], X, Y, [Y|R]) :-
replace(T, X, Y, R).
replace([H|T], X, Y, [H|R]) :-
H \= X,
replace(T, X, Y, R).

% ?- replace([1,2,3,2,4], 2, 9, R).