remove_duplicates([],[]).
remove_duplicates([H|T],R):member(H,T),
remove_duplicates(T,R).
remove_duplicates([H|T],[H|R]):-
\+member(H,T),
remove_duplicates(T,R).

% ?- remove_duplicates([1,2,2,3,1,4], L).