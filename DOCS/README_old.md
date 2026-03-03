**prolog**

Write a Prolog program to merge two ordered list to generate a third ordered list. 

merge\(\[\],L,L\). 

merge\(L,\[\],L\). 

merge\(\[H1|T1\], H2|T2 , H1|T3

H1

H2, 

merge\(T1, H2|T2 ,T3 . 

merge\(\[H1|T1\], H2|T2 , H2|T3

H1 H2, 

merge\(\[H1|T1\],T2,T3 . 

?- merge\(\[1,3,5\], 2,4,6 , X . 

Write a Prolog program to add an element in a last position in a given list. 

add\_last\(\[\], X, X . 

add\_last\(\[H|T\], X, H|R :-

add\_last\(T, X, R . 

?- add\_last\(\[1,2,3\], 4, L . 

Write a Prolog program to check whether a year is a leap year or not. 

leap\_year\(Y

0 is Y mod 400,\!. 

leap\_year\(Y

0 is Y mod 4, 

0 =\\= Y mod 100. 

?- leap\_year\(2000\). 

Write a Prolog program to remove duplicates from a list. 

remove\_duplicates\(\[\],\[\]\). 

remove\_duplicates\(\[H|T\],R

member\(H,T\), 

remove\_duplicates\(T,R\). 

remove\_duplicates\(\[H|T\], H|R

\\\+member\(H,T\), 

prolog

1

remove\_duplicates\(T,R\). 

?- remove\_duplicates\(\[1,2,2,3,1,4 , L . 

Write a Prolog program to split a list into two halves. 

split\_list\(L, Left, Right\):-

length\(L,N\), 

Half is N//2, 

length\(Left, Half\), 

append\(Left, Right, L . 

?- split\_list\(\[1,2,3,4,5,6 , L1, L2 . 

8. Write a Prolog program to rotate a list N places to the left. 

Write a Prolog program to find the union of two lists. 

union\(\[\], L, L . 

union\(\[H|T\],L2,R

member\(H,L2\), 

union\(T,L2,R\). 

union\(\[H|T\],L2, H|R

\\\+member\(H,L2\), 

union\(T,L2,R\). 

?- union\(\[1,2,3\], 3,4,5 , R . 

Write a Prolog program to replace al occurrences of an element in a list with another element. 

replace\(\[\], \_, \_, \[\]\). 

replace\(\[X|T\], X, Y, Y|R :-

replace\(T, X, Y, R . 

replace\(\[H|T\], X, Y, H|R :-

H \\= X, 

replace\(T, X, Y, R . 

?- replace\(\[1,2,3,2,4 , 2, 9, R . 

prolog

2

Experiment 01 – Merging **Q ** দুইিট িল কন আেগ সাজােত হেব? না হেল কী হেব? 

**Why must both input lists be sorted before merging? What happens if** **they are not? **

**A ** সাজােনা না থাকেল সিঠক েম িমশােনা যােব না।

**If not sorted, merge will not produce correct order. **

**Q ** merge/3 ত backtracking কীভােব কাজ কের? 

**Explain how backtracking behaves in your merge/3 predicate. **

**A ** লগ সব স াব িমল খাঁেজ, ব থ হেল িফের আেস।

**Prolog explores all possibilities and backtracks if no match is found. **

**Q ** সময় জিটলতা কন O\(n\+m\)? 

**What is the time complexity and why is it O\(n\+m\)\)? **

**A ** দুইিট িল একবার কের পড়া হয়, তাই n\+m ধাপ লােগ।

**Each list is traversed once, so time complexity is O\(n\+m\). **

**Q ** যিদ দুইিট উপাদান সমান হয়, কান জিট লগ ব বহার কের? 

**How does Prolog choose between the two recursive clauses when** **elements are equal? **

**A ** সাধারণত থম জিট আেগ।

**Prolog chooses the first matching clause. **

**Q ** া াম ডুি েকট হ াে ল করেত পাের? উদাহরণ? 

**Can your program handle duplicate elements correctly? Explain with an** **example. **

**A ** হ াঁ, উদা: 1,2 \+ 2,3 → 1,2,2,3 ।

**Yes, duplicates are kept; e.g., 1,2 \+ 2,3 → 1,2,2,3 . **

**Q ** merge ডুি েকট ছাড়া করেত চাইেল কী করা যায়? 

**How would you modify merge to remove duplicates while merging? **

**A ** member/2 িদেয় চক কের যাগ করেত হেব।

**Use member/2 to add only new elements. **

**Q ** merge vs append \+ sort, কানটা efficient? 

prolog

3

**Compare merging vs sorting using append \+ sort. Which is more efficient** **and why? **

**A ** merge বিশ efficient কারণ একবাের িমশােনা হয়।

**Merge is more efficient; append\+sort sorts after appending, slower. **

Experiment 03 – Nth Element

**Q ** indexing কন 1 থেক 

? 

**Why does indexing start from 1 in your implementation? **

**A ** লগ সাধারণত 1 based indexing ব বহার কের।

**Prolog usually uses 1-based indexing. **

**Q ** যিদ N িলে র দেঘ র বিশ হয় কী হেব? 

**What happens if N is larger than the list length? **

**A ** ফলাফল fail হেব।

**Returns failure. **

**Q ** যিদ N 0 বা negative হয় কী হেব? 

**What happens if N 0 or negative? **

**A ** ভুল ইনপুট, fail হয়।

**Invalid input, fails. **

**Q ** recursive stack কীভােব কাজ কের? 

**Explain the recursive stack behavior step-by-step. **

**A ** হড skip কের N 1 করা হয়, শেষ base case এ যায়।

**Each call skips head and decrements N until base case. **

**Q ** accessing Nth element সময় জিটলতা? 

**What is the time complexity of accessing the Nth element? **

**A ** O N কারণ sequential traversal।

**O N\) due to sequential traversal. **

**Q ** procedural language indexing থেক কীভােব আলাদা? 

**How is this different from array indexing in procedural languages? **

prolog

4

**A ** লগ sequential, array direct access কের।

**Prolog uses sequential traversal; arrays use direct indexing. **

**Q ** arithmetic ছাড়া implement করা যােব? 

**Can you implement this without arithmetic N1 is N 1 ? How? **

**A ** হ াঁ, pattern matching বা counter variable িদেয়।

**Yes, using pattern matching or a counter argument. **

Experiment 04 – Leap Year

**Q ** কন 400 rule আেগ check করা হয়? 

**Why must the 400 rule be checked before the 100 rule? **

**A ** 400 divisible year leap, 100 non-leap, সিঠক result এর জন ।

**400 divisible years are leap, 100 divisible non-leap; order matters. **

**Q ** clause order change করেল কী হয়? 

**What happens if clause order is changed? **

**A ** ভুল output আসেত পাের।

**Wrong output may occur. **

**Q ** mod operator এর কাজ কী? 

**Explain the role of the mod operator in Prolog. **

**A ** divisibility চক করেত।

**To check divisibility. **

**Q ** logical failure কীভােব treat কের Prolog? 

**How does Prolog treat logical failure in leap year rules? **

**A ** fail করেল backtrack হয়।

**Failure triggers backtracking. **

**Q ** এক বছেরর জন multiple rules succeed করেত পাের? 

**Can multiple rules succeed for one year? Why or why not? **

**A ** না, first matching rule ধরা হয়।

**No, only first matching rule succeeds. **

prolog

5

**Q ** if–then–else িদেয় implement করা যায় কীভােব? 

**How would you implement this using if–then–else \( ;\)? **

**A ** Condition leap ; non-leap\)।

**Use Condition leap ; non-leap\). **

**Q ** Prolog procedural language থেক কন বিশ suitable? 

**Why is Prolog more suitable for rule-based logic than procedural** **languages here? **

**A ** সহেজ rule িলখেত ও check করেত পাের।

**Easier to express and check rules. **

Experiment 06 – Duplicate Removal

**Q ** কন member/2 ব বহার করা হয়? 

**Why is member/2 used in this implementation? **

**A ** চক করেত য element আেগই আেছ িক না।

**To check if an element already exists. **

**Q ** duplicate removal এর time complexity কী? 

**What is the time complexity of this duplicate removal method? **

**A ** O\(n²\) কারণ িতিট element check হয়।

**O\(n²\) because each element is checked. **

**Q ** original order িক preserve হয়? কন? 

**Does the program preserve the original order? Why? **

**A ** হ াঁ, কারণ আমরা sequential y append কির।

**Yes, because elements are added in sequence. **

**Q ** \+ member\(...\) না িদেল কী হেব? 

**What happens if you remove the negation \+ member\(...\)? **

**A ** ডুি েকট থাকেব।

**Duplicates will remain. **

**Q ** backtracking duplicate detection এ কীভােব ভাব ফেল? 

**How does backtracking affect duplicate detection? **

prolog

6

**A ** সব স াবনা পরী া হয়, duplicate skip হয়।

**All possibilities are checked; duplicates are skipped. **

**Q ** sorting িদেয় optimize করা যায় কীভােব? 

**How would you optimize this using sorting? **

**A ** িল sort কের neighbor elements compare করেল O\(n log n\)।

**Sort list and compare neighbors to reduce complexity. **

**Q ** list\_to\_set/2 এর সােথ compare কেরা।

**Compare this approach with set operations in Prolog \(list\_to\_set/2 . **

**A ** list\_to\_set সহজ এবং efficient।

**list\_to\_set is simpler and more efficient. **

Experiment 07 – Split List

**Q ** কন length আেগ calculate করা হয়? 

**Why do we calculate the length first before splitting? **

**A ** split point িনধারণ করার জন ।

**To determine the split point. **

**Q ** odd length list হেল কী হয়? 

**What happens if the list has odd length? **

**A ** এক list বড় হেব।

**One list will have one extra element. **

**Q ** split\_at/4 িকভােব recursive কাজ কের? 

**Explain how split\_at/4 works recursively. **

**A ** head remove কের count reduce কের দুই ভােগ ভাগ কের।

**Removes head, decrements count, splits recursively. **

**Q ** splitting এর time complexity কত? 

**What is the time complexity of splitting? **

**A ** O\(n\) কারণ সব element একবার process হয়।

**O\(n\) because each element is processed once. **

prolog

7

**Q ** length compute না কের split করা যায় িক? 

**Can we split without computing length first? **

**A ** হ াঁ, counters বা recursion িদেয়।

**Yes, using recursion or counters. **

**Q ** কন দুই output list লােগ? 

**Why do we need two output lists instead of modifying one? **

**A ** Prolog immutable lists, নতুন lists তির করেত হয়।

**Lists are immutable; need to create new lists. **

**Q ** divide-and-conquer এর সােথ কী স ক? 

**How does this relate to divide-and-conquer algorithms like Merge Sort? **

**A ** list split কের recursive solve করা হয়।

**Splitting lists is the first step in divide-and-conquer. **

Experiment 09 – Union of Lists

**Q ** কন member/2 িদেয় duplicate check করেত হয়? 

**Why must duplicates be checked using member/2? **

**A ** এক element একবারই রাখেত।

**To ensure each element appears only once. **

**Q ** union িক order preserve কের? 

**Does union preserve order of elements? Explain. **

**A ** হ াঁ, থম list elements থেম থােক।

**Yes, elements from the first list appear first. **

**Q ** যিদ উভয় list এর িভতেরই duplicate থােক কী হয়? 

**What happens if both lists contain duplicates internally? **

**A ** duplicates skip হয়, unique element থােক।

**Duplicates are skipped; only unique elements remain. **

**Q ** union vs append \+ remove\_duplicates compare কেরা।

**Compare union with append \+ remove\_duplicates. **

prolog

8

**A ** union সহজ ও readable।

**Union is simpler and more readable. **

**Q ** union এর time complexity কত? 

**What is the time complexity of union? **

**A ** O\(nm\) sequential member check।

\*\*O\(nm\) due to sequential member checks.\*\*

**Q ** Prolog sets vs lists িকভােব treat কের? 

**How does Prolog treat sets differently from lists? **

**A ** sets unique elements রােখ, lists al ow duplicates।

**Sets contain unique elements; lists allow duplicates. **

**Q ** intersection বা difference implement িকভােব? 

**How would you implement intersection or difference using similar logic? **

**A ** member/2 িদেয় check কের add/remove করেত হেব।

**Use member/2 to check presence and add/remove elements. **

Experiment 10 – Replace Elements

**Q ** কন দুই recursive clause লােগ \(match ও non-match ? 

**Why do we need two recursive clauses \(match and non-match\)? **

**A ** match হেল replace, না হেল original keep করা।

**To replace matching elements and keep non-matching ones. **

**Q ** target element না থাকেল কী হয়? 

**What happens if the target element does not exist? **

**A ** কােনা change হয় না, original list থােক।

**No change occurs; original list remains. **

**Q ** replacement এর time complexity কত? 

**What is the time complexity of replacement? **

**A ** O\(n\) কারণ সব element check হয়।

**O\(n\) because each element is checked. **

prolog

9

**Q ** predicate িক bidirectional কাজ কের? 

**Can this predicate work bidirectionally? **

**A ** হ াঁ, input/output swap করা যায়।

**Yes, can work in both directions. **

**Q ** কান clause আেগ ব বহার হেব িকভােব decide হয়? 

**How does Prolog decide which clause to use first? **

**A ** top-down, first matching clause িনবাচন হয়।

**Top-down; first matching clause is used. **

**Q ** একসােথ multiple elements replace করেত চাইেল? 

**How would you replace multiple different elements simultaneously? **

**A ** maplist বা recursive replace list িদেয়।

**Use maplist or recursive replacement with lists. **

**Q ** maplist/3 এর সােথ compare কেরা।

**Compare this approach with using maplist/3. **

**A ** maplist আরও concise ও readable।

**maplist is more concise and readable. **

prolog

10



