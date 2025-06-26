%------------------------------------------------------------------------------
tff(p_decl,type,p: $int > $o).

tff(primary_obligation,axiom,
    $dyadic_obligation @ (~p(1),$true)).

tff(sequence_obligations,axiom,
    ! [I: $int] : 
      ( $greater(I,0)
     => $dyadic_obligation @ 
          ( ~p($sum(I,1)),
            ! [J: $int] : 
              ( $lesseq(J,I)
             => p(J) ) ) ) ).

%------------------------------------------------------------------------------
