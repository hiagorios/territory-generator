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
    writeln(']')
    .

subtract([], _, []).
subtract([Head|Tail], L2, L3) :-
        member(Head, L2),
        !,
        subtract(Tail, L2, L3).
subtract([Head|Tail1], L2, [Head|Tail3]) :-
        subtract(Tail1, L2, Tail3).
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
edge(X, Y) :- edgeDef(X, Y); edgeDef(Y, X).

adjacents(Elem, Adj) :- setof(Edges, edge(Elem, Edges), Adj).

% Prints all color lists
printConfiguration(Red, Blue, Yellow, Green) :- 
    writeln('\n======================'),
    writeln('Color Configuration'),
    writeln('red'),
    printList(Red);
    writeln('blue'),
    printList(Blue);
    writeln('yellow'),
    printList(Yellow);
    writeln('green'),
    printList(Green)
    .

% Base Case: Unify visited list with result
breadthSearch([], V, R) :- R = V, !.

% General Case: Returns all reachable pieces starting from list's Head
breadthSearch([Actual | Discovered], Visited, Result) :- 
    % Get Actual's adjacents
    adjacents(Actual, Adj),
    % Remove already visited from adjacents
    subtract(Adj, Visited, AdjWithoutVisited),
    % Remove discovered from the remaining adjacents
    subtract(AdjWithoutVisited, Discovered, AdjDistinct),
    % Append remaining adjacents to discovered
    append(Discovered, AdjDistinct, DiscoveredModified),
    % Append Actual to already visited
    append(Visited, [Actual], VisitedModified),
    breadthSearch(DiscoveredModified, VisitedModified, Result)
    .

% True if none of the Adjacents is in the ColorList
canTint([], _) :- !.
canTint([Head | Tail], ColorList) :- not(member(Head, ColorList)), canTint(Tail, ColorList).

% Base case: List is empty and the configuration is printed
generate([], Red, Blue, Yellow, Green) :- 
    printConfiguration(Red, Blue, Yellow, Green)
    .

% General case
generate([Actual | Rest], Red, Blue, Yellow, Green) :-     
    adjacents(Actual, Adj),
    (   
    % Painting Actual with Red   
    (canTint(Adj, Red),
    append(Red, [Actual], Modified),
    generate(Rest, Modified, Blue, Yellow, Green));
    
    % Painting Actual with Blue
    (canTint(Adj, Blue),
    append(Blue, [Actual], Modified),
    generate(Rest, Red, Modified, Yellow, Green));
    
    % Painting Actual with Yellow
    (canTint(Adj, Yellow),
    append(Yellow, [Actual], Modified),
    generate(Rest, Red, Blue, Modified, Green));
    
    % Painting Actual with Green
    (canTint(Adj, Green),
    append(Green, [Actual], Modified),
    generate(Rest, Red, Blue, Yellow, Modified))
    ).

% Generates the territory, given the list of pieces
genTerritory(Territory) :- 
    % Test territory length
    length(Territory, Length),
    Length > 0, Length < 21,
    % Check if there's isolated pieces
    [Head|_] = Territory,
    breadthSearch([Head], [], SearchResult),
    length(SearchResult, SearchLength),
    (SearchLength == Length,
    % Generate color configurations
    generate(Territory, [], [], [], []));
    write('Territory shouldn\'t have isolated pieces')
    .
