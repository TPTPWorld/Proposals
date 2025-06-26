%------------------------------------------------------------------------------
%----Definitions to make it non-modal
tff(dollar_world_type,type,'$world': $tType).
tff(dollar_accessible_world_decl,type,
    '$accessible_world': ('$world' * '$world') > $o).
tff(dollar_local_world_decl,type, '$local_world': '$world').
tff(dollar_in_world_decl,type, '$in_world': ('$world' * $o) > $o).
tff(dollar_necessary_decl,type, '$necessary': ('$world' * $o) > $o).
tff(dollar_possible_decl,type, '$possible': ('$world' * $o) > $o).

tff(necessary_defn,axiom,
    ! [CW: '$world',F: $o] :
      ( '$necessary'(CW,(F))
    <=> ! [AW: '$world'] :
          ( '$accessible_world'(CW,AW)
         => ! [AI: $o] :
              ( '$in_world'(AW,(AI))
             => ( (AI) => (F) ) ) ) ) ).

tff(possible_defn,axiom,
    ! [CW: '$world',F: $o] :
      ( '$possible'(CW,(F))
    <=> ? [AW: '$world'] :
          ( '$accessible_world'(CW,AW)
          & ? [AI: $o] :
              ( '$in_world'(AW,(AI))
              & ( (AI) => (F) ) ) ) ) ).

tff(duality,axiom,
    ! [W: '$world',F: $o] :
      ( ( ~ '$necessary'(W,(F))
      <=> '$possible'(W,~ (F)) )
      & ( ~ '$possible'(W,(F))
      <=> '$necessary'(W,~ (F)) ) ) ).

tff(person_type,type,person: $tType).
tff(geoff_decl,type,geoff: person).
tff(like_decl,type,like: person > $o).
tff(id_of_decl,type,id_of: person > $int).

tff(int2world_decl,type,int2world: $int > $world ).
tff(int2person_decl,type, int2person: $int > person ).

tff(like_geoff,axiom,
    ( ( ! [I: $int] : 
          ( $greatereq(I,0) 
         => ? [W: '$world'] : int2world(I) = W )
      & '$local_world' = int2world(0)
      & ! [I1: $int,I2: $int] : 
          ( int2world(I1) = int2world(I2) => I1 = I2 )
      & ! [W: '$world'] : ? [I: $int] : int2world(I) = W
      & '$accessible_world'(int2world(0),int2world(0))
      & ! [I: $int] : 
          ( $greater(I,0)
         => '$accessible_world'(int2world(0),int2world(I)) ) )
    & ( '$in_world'(int2world(0),
          ( ( ! [P: person] : ? [I: $int] : P = int2person(I)
            & ! [I1: $int,I2: $int] : 
                ( int2person(I1) = int2person(I2) => I1 = I2 ) )
          & ( geoff = int2person(0)
            & ! [I: $int] : id_of(int2person(I)) = I )
          & like(int2person(0) ) ) ) )
    & ! [IW: $int] :
        ( $greatereq(IW,0)
       => ( '$in_world'(int2world(IW),
              ( ( ! [P: person] : ? [I: $int] : P = int2person(I)
                & ! [I1: $int,I2: $int] : 
                    ( int2person(I1) = int2person(I2) => I1 = I2 )
              & ( geoff = int2person(IW)
                & id_of(int2person(IW)) = IW )
              & ( like(int2person(IW)) 
                & ! [ID: $int] :
                    ( like(int2person(ID))
                  <=> ID = IW ) ) ) ) ) ) ) ) ).

tff(prove_formulae,conjecture,
    ( ! [IW: $int] :
        ( $greatereq(IW,0)
       => ? [I: $o] :
            ( '$in_world'(int2world(IW),(I))
            & ( (I)
             => ? [P: person] :                         %----Global axioms
                  ( like(P)
                  & ! [OP: person] :
                      ( like(OP)
                     => OP = P ) ) ) ) )
    & ( ? [I: $o] :
          ( '$in_world'('$local_world',(I))     %----Local axioms
          & ( (I)
           => ( ! [I: $int] :
                  ( $greatereq(I,0)
                 => ( ? [P: person] : id_of(P) = I
                    & ! [P1: person,P2: person] :
                        ( ( id_of(P1) = id_of(P2) )
                       => ( P1 = P2 ) ) ) )
              & like(geoff)
              & ! [X: person] : '$possible'('$local_world',like(X) ) ) ) ) ) ) ).
%------------------------------------------------------------------------------
