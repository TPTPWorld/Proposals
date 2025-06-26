%------------------------------------------------------------------------------
tff(simple_spec,logic,
    $alethic_modal == [
      $constants == $rigid,
      $quantification == $constant,
      $modalities == $modal_system_S4 ] ).

tff(sequence_type,type,  sequence: $tType ).
tff(null_decl,type,      null: sequence ).
tff(toss_decl,type,      toss: sequence > sequence ).
tff(all_heads_decl,type, all_heads: sequence > $o ).

tff(different_sequences,axiom,
    ! [S: sequence] : 
      ( ( toss(S) != null )
      & ( toss(S) != S ) ) ).

tff(injection,axiom,
    ! [S1: sequence,S2: sequence] :
      ( ( toss(S1) = toss(S2) )
     => ( S1 = S2 ) ) ).

tff(all_heads_possible,axiom,
    ! [S: sequence] :
      ( all_heads(S)
     => ( {$possible} @ (all_heads(toss(S)) ) ) ) ).

tff(no_heads,axiom,
    all_heads(null) ).
          
tff(two_heads_necessary,conjecture,
    ( {$necessary} 
    @ (? [S: sequence] : 
         ( all_heads(S) 
         & all_heads(toss(S)) ) ) ).
%------------------------------------------------------------------------------
