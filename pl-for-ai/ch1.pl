% -*- mode: prolog -*-
parent(pam, bob).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).
parent(tom, bob).
parent(tom,liz).

% 1.2
parent(X, pat).
parent(liz, X).

% this still produces duplicates because (X, Y) and (Y, X) are considered distinct
parent(X, Y), parent(Y, pat), X \= pat, X \= Y, X \= Y, Y \= pat.

% 1.3
parent(mary, fred).
happy(X) :- parent(X, _).
happy(mary).

female(kate).
sister(Z, Y) :-
        parent(X, Y),
        parent(X, Z),
        female(Z),
        Y \= Z.

hastwochildren(X) :-
        parent(X, Y),
        sister(Z, Y).

% 1.4
grandchild(X, Y) :-
        parent(Z, Y),
        parent(X, Y).
% 1.5
parent(tom, pete).
sister(kate, tom).
aunt(X, Y) :-
        parent(Z, Y),
        sister(X, Z).
aunt(kate, pete).
