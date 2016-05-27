%- Homework 5
%- CS 381
%- Spring, 2016
%- Matthew Johnson, Natasha Anisimova, Behnam Saeedi

%- Exercise 1

when(275,10).
when(261,12).
when(381,11).
when(398,12).
when(399,12).

where(275,owen102).
where(261,dear118).
where(381,cov216).
where(398,dear118).
where(399,cov216). 

enroll(mary,275).
enroll(john,275).
enroll(mary,261).
enroll(john,381).
enroll(jim,399).

%- a

schedule(S,P,T) :- enroll(S,C), where(C,P), when(C,T).

%- b

usage(P,T) :- where(C,P), when(C,T).

%- c

conflict(X,Y) :- where(X,P), when(X,T), where(Y,P), when(Y,T), Y\=X.

%- d

meet(A,B) :- schedule(A,P,T), schedule(B,P,T), A\=B.
meet(A,B) :- schedule(A,P,T), schedule(B,P,U), A\=B, T+1=:=U.

%- Exercise 2

%- a

rdup(L,M) :- rduphelper(L,M,[]).
rduphelper([],[],_).
rduphelper([X|L],[X|M],T) :- not(member(X,T)),rduphelper(L,M,[X|T]).
rduphelper([X|L],[Y|M],T) :- member(X,T),rduphelper(L,[Y|M],T).
rduphelper([X|L],[   ],T) :- member(X,T),rduphelper(L,[],T).

%- c

project(L,M,N) :- projecthelper(L,M,N,1).
projecthelper([],_,[],_).
projecthelper(_,[],[],_).
projecthelper([X|L],[Y|M],[Y|N],P) :- X=:=P, projecthelper(L,M,N,P+1).
projecthelper(L,[_|M],N,P) :- projecthelper(L,M,N,P+1).
