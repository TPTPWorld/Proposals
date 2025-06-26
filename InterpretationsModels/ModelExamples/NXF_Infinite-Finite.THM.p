%------------------------------------------------------------------------------
tff(simple_spec,logic,
    $alethic_modal == 
      [ $domains == $constant,
        $designation == $rigid,
        $terms == $local,
        $modalities == $modal_system_S5 ] ).

tff(person_type,type, person: $tType).
tff(geoff_decl,type,geoff: person).
tff(alive_decl,type,alive: (person * $int) > $o).
tff(age_decl,type,age: (person * $int) > $int).

tff(born_by_1961,axiom,
    ? [BirthYear: $int] :
      ( $lesseq(BirthYear,1961)
      & ! [PreBirthYear: $int] :
          ( $less(PreBirthYear,BirthYear)
         => ( ~ alive(geoff,PreBirthYear)
            & age(geoff,PreBirthYear) = -1 ) )
      & ! [FromBirthYear: $int] :
          ( $greatereq(FromBirthYear,BirthYear)
         => ( alive(geoff,FromBirthYear)
            & age(geoff,FromBirthYear) = $difference(FromBirthYear,BirthYear)) ) ) ).

tff(necessarily_alive_between,axiom,
    ! [StartYear: $int,EndYear: $int] :
      ( ( $less(StartYear,EndYear)
        & alive(geoff,StartYear)
        & alive(geoff,EndYear) )
     => {$necessary} @
          ( ! [BetweenYear: $int] :
              ( ( $greatereq(BetweenYear,StartYear)
                & $lesseq(BetweenYear,EndYear) )
             => alive(geoff,BetweenYear) ) ) ) ).

tff(necessarily_dead_after,axiom,
    ! [DeathYear: $int] :
      ( ( alive(geoff,DeathYear)
        & ~ alive(geoff,$sum(DeathYear,1)) )
     => {$necessary} @
          ( ! [Year: $int] :
              ( $greater(Year,DeathYear)
             => ~ alive(geoff,Year) ) ) ) ).

tff(might_live_another_year,axiom,
    ! [Year: $int] :
      ( alive(geoff,Year)
     => {$possible} @ ( alive(geoff,$sum(Year,1)) ) ) ).

%----Adding this should make the axioms contradictory
% tff(must_die,axiom,
%     {$necessary} @
%       ( ? [Year: $int] :
%           ( $greater(Year,1961)
%           & ~ alive(geoff,Year ) ) ).

%----This should be provable
tff(might_live_long,conjecture,
    {$possible} @
      ( ? [Year: $int] :
          ( age(geoff,Year) = 120
          & alive(geoff,Year) ) ) ).

%------------------------------------------------------------------------------
