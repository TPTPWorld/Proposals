%------------------------------------------------------------------------------
tff(level_type,type,  level: $tType).
tff(ground_decl,type, ground: level).
tff(middle_decl,type, middle: level).
tff(top_decl,type,    top: level).
tff(space_decl,type,  space: level).

tff(possible_position_decl,type,
    possible_position: ( $int * $int * level ) > $o ).

tff(only_four_distinct_levels,axiom,
    ( ! [Z: level] :
        ( ( Z = ground )
        | ( Z = middle )
        | ( Z = top )
        | ( Z = space ) )
    & ( ground != middle )
    & ( ground != top )
    & ( ground != space )
    & ( middle != top )
    & ( middle != space )
    & ( top != space ) ) ).
%    & $distinct(ground,middle,top,space) ) ).

tff(start_at_origin,axiom,
    possible_position(0,0,ground) ).

tff(move_X,axiom,
    ! [X: $int,Y: $int,Z: level] :
      ( possible_position(X,Y,Z)
     => ( possible_position($difference(X,1),Y,Z)
        & possible_position($sum(X,1),Y,Z) ) ) ).

tff(move_Y,axiom,
    ! [X: $int,Y: $int,Z: level] :
      ( possible_position(X,Y,Z)
     => ( possible_position(X,$difference(Y,1),Z)
        & possible_position(X,$sum(Y,1),Z) ) ) ).

tff(move_Z,axiom,
    ! [X: $int,Y: $int] :
      ( ( possible_position(X,Y,ground)
       => possible_position(X,Y,middle) )
      & ( possible_position(X,Y,middle)
       => ( possible_position(X,Y,ground)
          & possible_position(X,Y,top) ) )
      & ( possible_position(X,Y,top)
       => possible_position(X,Y,middle) ) ) ).

tff(can_fly,conjecture,
    possible_position(3,-5,space) ).
%------------------------------------------------------------------------------
