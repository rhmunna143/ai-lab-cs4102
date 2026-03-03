# Prolog Lab Experiments

## Experiment 01 – Merge Two Ordered Lists

Write a Prolog program to merge two ordered lists to generate a third ordered list.

```prolog
merge([], L, L).
merge(L, [], L).
merge([H1|T1], [H2|T2], [H1|T3]) :- H1 =< H2, merge(T1, [H2|T2], T3).
merge([H1|T1], [H2|T2], [H2|T3]) :- H1 > H2, merge([H1|T1], T2, T3).

?- merge([1,3,5], [2,4,6], X).
```

---

## Experiment 02 – Add Element at Last Position

Write a Prolog program to add an element in the last position of a given list.

```prolog
add_last([], X, [X]).
add_last([H|T], X, [H|R]) :- add_last(T, X, R).

?- add_last([1,2,3], 4, L).
```

---

## Experiment 03 – Leap Year

Write a Prolog program to check whether a year is a leap year or not.

```prolog
leap_year(Y) :- 0 is Y mod 400, !.
leap_year(Y) :- 0 is Y mod 4, 0 =\= Y mod 100.

?- leap_year(2000).
```

---

## Experiment 04 – Remove Duplicates

Write a Prolog program to remove duplicates from a list.

```prolog
remove_duplicates([], []).
remove_duplicates([H|T], R) :- member(H, T), remove_duplicates(T, R).
remove_duplicates([H|T], [H|R]) :- \+ member(H, T), remove_duplicates(T, R).

?- remove_duplicates([1,2,2,3,1,4], L).
```

---

## Experiment 05 – Split List

Write a Prolog program to split a list into two halves.

```prolog
split_list(L, Left, Right) :-
    length(L, N),
    Half is N // 2,
    length(Left, Half),
    append(Left, Right, L).

?- split_list([1,2,3,4,5,6], L1, L2).
```

---

## Experiment 06 – Union of Lists

Write a Prolog program to find the union of two lists.

```prolog
union([], L, L).
union([H|T], L2, R) :- member(H, L2), union(T, L2, R).
union([H|T], L2, [H|R]) :- \+ member(H, L2), union(T, L2, R).

?- union([1,2,3], [3,4,5], R).
```

---

## Experiment 07 – Replace Elements

Write a Prolog program to replace all occurrences of an element in a list with another element.

```prolog
replace([], _, _, []).
replace([X|T], X, Y, [Y|R]) :- replace(T, X, Y, R).
replace([H|T], X, Y, [H|R]) :- H \= X, replace(T, X, Y, R).

?- replace([1,2,3,2,4], 2, 9, R).
```

---

# Viva Questions & Answers

## Experiment 01 – Merging

**Q: Why must both input lists be sorted before merging? What happens if they are not?**

A: If not sorted, merge will not produce correct order.

**Q: Explain how backtracking behaves in your merge/3 predicate.**

A: Prolog explores all possibilities and backtracks if no match is found.

**Q: What is the time complexity and why is it O(n+m)?**

A: Each list is traversed once, so time complexity is O(n+m).

**Q: How does Prolog choose between the two recursive clauses when elements are equal?**

A: Prolog chooses the first matching clause.

**Q: Can your program handle duplicate elements correctly? Explain with an example.**

A: Yes, duplicates are kept; e.g., [1,2] + [2,3] → [1,2,2,3].

**Q: How would you modify merge to remove duplicates while merging?**

A: Use member/2 to add only new elements.

**Q: Compare merging vs sorting using append + sort. Which is more efficient and why?**

A: Merge is more efficient; append+sort sorts after appending, slower.

---

## Experiment 03 – Nth Element

**Q: Why does indexing start from 1 in your implementation?**

A: Prolog usually uses 1-based indexing.

**Q: What happens if N is larger than the list length?**

A: Returns failure.

**Q: What happens if N is 0 or negative?**

A: Invalid input, fails.

**Q: Explain the recursive stack behavior step-by-step.**

A: Each call skips head and decrements N until base case.

**Q: What is the time complexity of accessing the Nth element?**

A: O(N) due to sequential traversal.

**Q: How is this different from array indexing in procedural languages?**

A: Prolog uses sequential traversal; arrays use direct indexing.

**Q: Can you implement this without arithmetic (N1 is N-1)? How?**

A: Yes, using pattern matching or a counter argument.

---

## Experiment 04 – Leap Year

**Q: Why must the 400 rule be checked before the 100 rule?**

A: 400 divisible years are leap, 100 divisible non-leap; order matters.

**Q: What happens if clause order is changed?**

A: Wrong output may occur.

**Q: Explain the role of the mod operator in Prolog.**

A: To check divisibility.

**Q: How does Prolog treat logical failure in leap year rules?**

A: Failure triggers backtracking.

**Q: Can multiple rules succeed for one year? Why or why not?**

A: No, only first matching rule succeeds.

**Q: How would you implement this using if-then-else (->; )?**

A: Use `(Condition -> leap ; non-leap)`.

**Q: Why is Prolog more suitable for rule-based logic than procedural languages here?**

A: Easier to express and check rules.

---

## Experiment 06 – Duplicate Removal

**Q: Why is member/2 used in this implementation?**

A: To check if an element already exists.

**Q: What is the time complexity of this duplicate removal method?**

A: O(n²) because each element is checked.

**Q: Does the program preserve the original order? Why?**

A: Yes, because elements are added in sequence.

**Q: What happens if you remove the negation \+ member(...)?**

A: Duplicates will remain.

**Q: How does backtracking affect duplicate detection?**

A: All possibilities are checked; duplicates are skipped.

**Q: How would you optimize this using sorting?**

A: Sort list and compare neighbors to reduce complexity to O(n log n).

**Q: Compare this approach with set operations in Prolog (list_to_set/2).**

A: list_to_set is simpler and more efficient.

---

## Experiment 07 – Split List

**Q: Why do we calculate the length first before splitting?**

A: To determine the split point.

**Q: What happens if the list has odd length?**

A: One list will have one extra element.

**Q: Explain how split_at/4 works recursively.**

A: Removes head, decrements count, splits recursively.

**Q: What is the time complexity of splitting?**

A: O(n) because each element is processed once.

**Q: Can we split without computing length first?**

A: Yes, using recursion or counters.

**Q: Why do we need two output lists instead of modifying one?**

A: Lists are immutable; need to create new lists.

**Q: How does this relate to divide-and-conquer algorithms like Merge Sort?**

A: Splitting lists is the first step in divide-and-conquer.

---

## Experiment 09 – Union of Lists

**Q: Why must duplicates be checked using member/2?**

A: To ensure each element appears only once.

**Q: Does union preserve order of elements? Explain.**

A: Yes, elements from the first list appear first.

**Q: What happens if both lists contain duplicates internally?**

A: Duplicates are skipped; only unique elements remain.

**Q: Compare union with append + remove_duplicates.**

A: Union is simpler and more readable.

**Q: What is the time complexity of union?**

A: O(n*m) due to sequential member checks.

**Q: How does Prolog treat sets differently from lists?**

A: Sets contain unique elements; lists allow duplicates.

**Q: How would you implement intersection or difference using similar logic?**

A: Use member/2 to check presence and add/remove elements.

---

## Experiment 10 – Replace Elements

**Q: Why do we need two recursive clauses (match and non-match)?**

A: To replace matching elements and keep non-matching ones.

**Q: What happens if the target element does not exist?**

A: No change occurs; original list remains.

**Q: What is the time complexity of replacement?**

A: O(n) because each element is checked.

**Q: Can this predicate work bidirectionally?**

A: Yes, can work in both directions.

**Q: How does Prolog decide which clause to use first?**

A: Top-down; first matching clause is used.

**Q: How would you replace multiple different elements simultaneously?**

A: Use maplist or recursive replacement with lists.

**Q: Compare this approach with using maplist/3.**

A: maplist is more concise and readable.
