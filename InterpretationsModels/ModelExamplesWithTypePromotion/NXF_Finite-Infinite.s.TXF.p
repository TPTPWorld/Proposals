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

tff(sequence_type,type, sequence: $tType ).
tff(null_decl,type, null: sequence ).
tff(toss_decl,type, toss: sequence > sequence ).
tff(all_heads_decl,type, all_heads: sequence > $o ).

tff(w1_decl,type, w1: '$world').
tff(w2_decl,type, w2: '$world').
tff(int2sequence_decl,type,int2sequence: $int > sequence).

tff(tossed_worlds,axiom,
    ( ( ! [W: '$world'] : ( W = w1 | W = w2 )
      & w1 != w2                     %    $distinct(w1,w2)
      & '$local_world' = w1
      & '$accessible_world'(w1,w1)     %----Logic is S4
      & '$accessible_world'(w2,w2)
      & '$accessible_world'(w1,w2) )
    & ( '$in_world'(w1,
          ( ( ! [S: sequence] : ? [I: $int] : S = int2sequence(I)
            & ! [X: $int,Y: $int] : 
                ( int2sequence(X) = int2sequence(Y) => X = Y ) )
          & ( null = int2sequence(1)
            & toss(int2sequence(1)) = int2sequence(2)
            & ! [I: $int] : 
                toss(int2sequence(I)) = int2sequence($product(I,2)) )
          & ( ( all_heads(int2sequence(1))
              & ! [I: $int] :
                ( all_heads(int2sequence(I)) 
              <=> ( $greatereq(I,2)
                  & ( $remainder_e(I,2) = 0 )
                  & all_heads(int2sequence($quotient_e(I,2))) ) ) ) ) ) ) )
    & ( '$in_world'(w2,
          ( ( ! [S: sequence] : ? [I: $int] : S = int2sequence(I)
            & ! [X: $int,Y: $int] : 
                ( int2sequence(X) = int2sequence(Y) => X = Y ) )
          & ( null = int2sequence(1)
            & toss(int2sequence(1)) = int2sequence(3)
            & ! [I: $int] : 
                ( I != 1
               => toss(int2sequence(I)) = int2sequence($product(I,2)) ) )
          & ( all_heads(int2sequence(1))
            & ! [I: $int] :
              ( all_heads(int2sequence(I)) 
            <=> ( $greatereq(I,2)
                & ( $remainder_e(I,2) = 0 )
                & all_heads(int2sequence($quotient_e(I,2))) ) ) ) ) ) ) ) ).

tff(prove_formulae,conjecture,
    ( ! [W: '$world'] :     %----Global axioms
      ? [I: $o] :
        ( '$in_world'(W,(I))
        & ( (I)
         => ( ! [S: sequence] : 
                ( ( toss(S) != null )
                & ( toss(S) != S ) )
            & ! [S1: sequence,S2: sequence] :
                ( ( toss(S1) = toss(S2) )
               => ( S1 = S2 ) )
            & ! [S: sequence] :
                ( all_heads(S)
               => '$possible'(W,all_heads(toss(S))) )
            & all_heads(null) ) ) )
    & ? [I: $o] :
        ( '$in_world'('$local_world',(I))     %----Local axioms and negated conjecture
        & ( (I)
         => ~ '$necessary'('$local_world',
                ? [S: sequence] : 
                  ( all_heads(S) 
                  & all_heads(toss(S)) ) ) ) ) ) ).

%------------------------------------------------------------------------------
