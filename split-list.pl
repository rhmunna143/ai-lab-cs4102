split_list(L, Left, Right):-
length(L,N),
Half is N//2,
length(Left, Half),
append(Left, Right, L).

% ?- split_list([1,2,3,4,5,6], L1, L2).