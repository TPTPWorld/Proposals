%------------------------------------------------------------------------------
tff(level_type,type,level: $tType).
tff(ground_decl,type,ground: level).
tff(middle_decl,type,middle: level).
tff(top_decl,type,top: level).
tff(space_decl,type,space: level).
tff(possible_position_decl,type,
    possible_position: ($int * $int * level) > $o ).

tff(d_level_type,type,d_level: $tType).
tff(d_ground_decl,type,d_ground: d_level).
tff(d_middle_decl,type,d_middle: d_level).
tff(d_top_decl,type,d_top: d_level).
tff(d_space_decl,type,d_space: d_level).
tff(d2level_decl,type,d2level: d_level > level).

tff(drone,axiom,
    ( ( ! [L: level] : ? [DL: d_level] : L = d2level(DL)
      & ! [Z: d_level] : ( Z = d_ground | Z = d_middle | Z = d_top | Z = d_space )
      & ( d_ground != d_middle
        & d_ground != d_top
        & d_ground != d_space
        & d_middle != d_top
        & d_middle != d_space
        & d_top != d_space )
%     & $distinct(ground,middle,top,space)
      & ! [DL1: d_level,DL2: d_level] : ( d2level(DL1) = d2level(DL2) => DL1 = DL2 ) )
    & ( ground = d2level(d_ground)
      & middle = d2level(d_middle)
      & top = d2level(d_top)
      & space = d2level(d_space) )
    & ! [X: $int,Y: $int] :
        ( possible_position(X,Y,d2level(d_ground))
        & possible_position(X,Y,d2level(d_middle))
        & possible_position(X,Y,d2level(d_top))
        & ~ possible_position(X,Y,d2level(d_space)) ) ) ).

tff(prove_formulae,conjecture,
    ( ! [Z: level] :
        ( Z = ground
        | Z = middle
        | Z = top 
        | Z = space ) 
    & ( ground != middle
      & ground != top
      & ground != space
      & middle != top
      & middle != space
      & top != space )
    & possible_position(0,0,ground)
    & ! [X: $int,Y: $int,Z: level] :
        ( possible_position(X,Y,Z)
       => ( possible_position($difference(X,1),Y,Z)
          & possible_position($sum(X,1),Y,Z) ) )
    & ! [X: $int,Y: $int,Z: level] :
        ( possible_position(X,Y,Z)
       => ( possible_position(X,$difference(Y,1),Z)
          & possible_position(X,$sum(Y,1),Z) ) )
    & ! [X: $int,Y: $int] :
        ( ( possible_position(X,Y,ground)
         => possible_position(X,Y,middle) )
        & ( possible_position(X,Y,middle)
         => ( possible_position(X,Y,ground)
            & possible_position(X,Y,top) ) )
        & ( possible_position(X,Y,top)
         => possible_position(X,Y,middle) ) )
    & ~ possible_position(3,-5,space) ) ).
%------------------------------------------------------------------------------
