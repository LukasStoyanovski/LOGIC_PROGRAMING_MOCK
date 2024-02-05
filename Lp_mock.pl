person(danilo, gender(male), age(18), hobbies([photography, music])).
person(aris, gender(male), age(25), hobbies([])).
person(julia, gender(female), age(28), hobbies([music])).
person(klajd, gender(male), age(25), hobbies([basketball])).
person(michael, gender(male), age(23), hobbies([reading, photography])).
person(ylber, gender(male), age(35), hobbies([reading])).
person(katarina, gender(female), age(42), hobbies([travelling])).
person(tedi, gender(male), age(23), hobbies([])).
person(odysseas, gender(male),age(23),hobbies([travelling, basketball])).


/* Questoin 1 
In the provided Prolog query, you are using the findall/3 predicate to find all individuals (represented by P) whose age (A) is less than 25. 
PL = [danilo, aris, michael, tedi, odysseas].
*/

/* Questoin 2 
a) Who is included in the social network?

?- findall(P, person(P, _, _, _), Persons).

*/


/* Questoin 2 
b) Who is female?

?- findall(F, person(F, gender(female), _, _), Females).

*/


/* Questoin 2 
c) Is there at least one male?

?- person(_, gender(male), _, _).

*/



/* Questoin 2 
d) Are there persons who have exactly the same age?

?- person(P1, _, age(A), _), person(P2, _, age(A), _), P1 \= P2.

*/

/* Question 3 
Write all Prolog facts follows/2 that represent the links between people in the social network.
To represent links between people in the social network using follows/2 facts, you can define who follows whom.
 Here is an example with arbitrary follow relationships:

follows(danilo, aris).
follows(julia, danilo).
follows(klajd, aris).
follows(michael, danilo).
follows(ylber, klajd).
follows(katarina, julia).
follows(tedi, julia).
follows(odysseas, ylber).

*/

/* Question 4
Write a Prolog predicate one_common_hobby/2, which returns any two (different) persons in the
social network who share at least one common hobby. For example:
?- one_common_hobby(P1,P2).

*/

one_common_hobby(Person1, Person2) :-
    person(Person1, _, _, Hobbies1),
    person(Person2, _, _, Hobbies2),
    Person1 \= Person2,
    member(CommonHobby, Hobbies1),
    member(CommonHobby, Hobbies2).


/* Question 5 
Explain what the following Prolog predicate does. Give an example query and its answers.
n(P1,P2,G,Min,Max):-
not(follows(P1,P2)),
person(P1, gender(G), age(A1), _),
person(P2, gender(G), age(A2), _),
A1>=Min, A1=<Max,
A2>=Min, A2=<Max,
assert(follows(P1,P2)).

This query searches for pairs of the same gender, where the ages of both persons (P1 and P2) fall within the given range (inclusive),
and there is no existing "follows" relationship between them. And at the end it asserts a follows relationship between them.

?- n(P1, P2, male, 20, 30).
*/

/* Question 6 
In this social network, two persons belong to the same group if they are directly or indirectly linked.
Fill in the gaps of the following Prolog predicate same_group/2 which returns whether two
persons belong to the same group:

same_group(P1,P2):-
...( ..., P2),!.
same_group(P1,P2):-
...(P1, ...),
` ... (...,...).


Awnser:
same_group(P1, P2) :-
    dfs(P1, P2, [P1], _), !.

same_group(_, _) :- fail.

dfs(Current, Target, Visited, Path) :-
    follows(Current, Next),
    \+ member(Next, Visited),
    dfs(Next, Target, [Next|Visited], Path).

dfs(Target, Target, Path, Path).




*/

/*Question 7
The predicate in Q.6 above, when called, may fall into an infinite loop. Re-write the predicate,
possibly changing its arity too, so that it terminates correctly.


Awnser:
same_group(P1, P2) :-
    dfs(P1, P2, [P1], _), !.

same_group(_, _) :- fail.

dfs(Current, Target, Visited, Path) :-
    follows(Current, Next),
    \+ member(Next, Visited),
    dfs(Next, Target, [Next|Visited], Path).

dfs(Target, Target, Path, Path).
*/ 


