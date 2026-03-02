union([], L, L).
union([H|T],L2,R):member(H,L2),
union(T,L2,R).
union([H|T],L2,[H|R]):-
\+member(H,L2),
union(T,L2,R).

% ?- union([1,2,3], [3,4,5], R).