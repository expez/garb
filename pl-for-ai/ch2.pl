% -*- mode: prolog -*-
%2.3
% a) yes, A = 1, B = 2
% b) no, the functor isn't the same
% c) no
% d) yes, D = E, E = 2
% e) yes, P2 = point(1, 0), P3 = point(0, Y) with P1 = (-1,0)
% the family of triangles described are the ones with points in (-1, 0), (1, 0)
% and with the final point anywhere on the y-axis.

%2.4
seg(point(5, 0), point(5, Y)).

%2.5
regular(point(X1, Y1), point(X2, Y1), point(X2, Y3), point(X1, Y3)).

%2.6
f(1, one).
f(s(1), two).
f(s(s(1)), three).
f(s(s(s(X))), N) :-
        f(X, N).

% a) A = two
% b) false
% c) C = one.
% d) D = s(s(1)) ; D = s(s(s(s(s(1))))) ;

% 2.7
relatives(X, Y) :-
        ancestor(X, Y)
        ;
        ancestor(Y, X).
        ;
        ancestor(Z, X),
        ancestor(Z, Y)
        ;
        ancestor(X, Z),
        anzestor(Y, Z).

% 2.8
% as facts!
translate(1, one).
translate(2, two).
translate(3, three).
