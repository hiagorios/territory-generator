% ======================= List manipulation =======================
% Delete: removes element from list
% delete(List, element, Result)

% Append: concats the two lists
% append(List, [element], Result)

% Print List: Base case
printListRecursive([]) :- !.

% Print List: Recursion
printListRecursive([Head | Tail]) :-
    format(', ~w',Head),
    printListRecursive(Tail)
    .

% Print List: Main
printList([Head | Tail]) :-
    format('[~w',Head),
    printListRecursive(Tail),
    write(']')
    .
% ======================= List manipulation =======================

% ====================== Territory definition =====================
edgeDef(a, b).
edgeDef(a, c).
edgeDef(b, c).
edgeDef(c, d).
edgeDef(c, e).
edgeDef(c, f).
edgeDef(d, e).
edgeDef(e, f).
edgeDef(f, g).
edgeDef(g, h).
edgeDef(g, j).
edgeDef(i, j).
edgeDef(i, k).
edgeDef(i, l).
edgeDef(j, l).
edgeDef(j, m).
edgeDef(k, l).
edgeDef(k, p).
edgeDef(l, m).
edgeDef(l, p).
edgeDef(m, n).
edgeDef(m, q).
edgeDef(n, o).
edgeDef(n, q).
edgeDef(p, r).
% ====================== Territory definition =====================

% Bidirectionally checking for edge
edge(X, Y) :- (edgeDef(X, Y), !; edgeDef(Y, X)), !.

% Prints all color lists
printConfiguration(Red, Blue, Yellow, Green) :- 
    writeln('\n======================'),
    writeln('Color Configuration'),
    writeln('red'),
    printList(Red),
    writeln('blue'),
    printList(Blue),
    writeln('yellow'),
    printList(Yellow),
    writeln('green'),
    printList(Green)
    .
