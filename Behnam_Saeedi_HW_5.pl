flat(L,F) :- flathelper(L,[],F).
flathelper([],F,F).
flathelper([X|L],Y,F) :- flathelper(X,Z,F),flathelper(L,Y,Z).
flathelper(X,F,[X|F]) :- not(is_list(X)).

flat([],[]).



flatten2([], []) :- !.
flatten2([L|Ls], FlatL) :-
!,
flatten2(L, NewL),
flatten2(Ls, NewLs),
append(NewL, NewLs, FlatL).
flatten2(L, [L]).
