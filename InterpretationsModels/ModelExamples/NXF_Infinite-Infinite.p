%------------------------------------------------------------------------------
tff(simple_spec,logic,
    $alethic_modal == 
      [ $domains == $varying,
        $designation == $flexible,
        $terms == $local,
        $modalities == $modal_system_M ] ).

tff(person_type,type, person: $tType).
tff(geoff_decl,type,  geoff: person).
tff(like_decl,type,   like: person > $o).
tff(id_of_decl,type,  id_of: person > $int).

tff(like_exactly_one_person,axiom,
    ? [P: person] :
      ( like(P)
      & ! [OP: person] :
          ( like(OP)
         => ( OP = P ) ) ) ).

%----Infinite people here. The RHS of the conjunction limits it to an integer 
%----number of people.
tff(infinite_people,axiom-local,
    ! [I: $int] : 
      ( $greatereq(I,0)
     => ( ? [P: person] : id_of(P) = I
        & ! [P1: person,P2: person] : 
            ( ( id_of(P1) = id_of(P2) )
           => ( P1 = P2 ) ) ) ) ).

tff(like_geoff_here,axiom-local,
    like(geoff) ).

tff(like_all,axiom-local,
    ! [X: person] : ( {$possible} @ (like(X)) ) ).
%------------------------------------------------------------------------------
