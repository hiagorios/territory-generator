% ======================= List manipulation =======================
% Delete: removes element from list
% delete(List, element, Result)

% Append: concats the two lists
% append(List, [element], Result)

% Print List: Base case
printList([]) :- !.

% Print List: Recursion
printList([Head | Tail]) :-
    format('\n~w',Head),
    printList(Tail)
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
printColors(Red, Blue, Yellow, Green) :- 
    writeln('red'),
    printList(Red),
    writeln('blue'),
    printList(Blue),
    writeln('yellow'),
    printList(Yellow),
    writeln('green'),
    printList(Green)
    .