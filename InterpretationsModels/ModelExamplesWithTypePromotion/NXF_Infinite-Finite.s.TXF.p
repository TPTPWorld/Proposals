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

tff(person_type,type, person: $tType).
tff(geoff_decl,type,geoff: person).
tff(alive_decl,type,alive: (person * $int) > $o).
tff(age_decl,type,age: (person * $int) > $int).

tff(int2world_decl,type,int2world: $int > '$world' ).
tff(d_person_type,type,d_person: $tType).
tff(d_geoff_decl,type,d_geoff: d_person).
tff(d2person_decl,type,d2person: d_person > person).

tff(long_live_geoff,axiom,
    ( ( ! [I: $int] : 
        ? [W: '$world'] : int2world(I) = W
      & ! [I1: $int,I2: $int] : 
          ( int2world(I1) = int2world(I2) => I1 = I2 )
      & ! [W: '$world'] : ? [I: $int] : int2world(I) = W
      & ! [P: $int,F: $int] : 
          ( $greatereq(F,P)
         => '$accessible_world'(int2world(P),int2world(F)) ) )
    & ! [IW: $int] :
        ( $less(IW,1961)
       => ( '$in_world'(int2world(IW),
              ( ( ! [P: person] : ? [DP: d_person] : P = d2person(DP)
                & ! [DP: d_person] : DP = d_geoff
                & ? [DP: d_person] : DP = d_geoff
                & ! [X: d_person,Y: d_person] :
                    ( d2person(X) = d2person(Y) => X = Y ) )
              & geoff = d2person(d_geoff)
              & ! [Y: $int] :
                  ( $less(Y,IW)
                 => ( ~ alive(d2person(d_geoff),Y)
                    & age(d2person(d_geoff),Y) = -1 ) )
              & alive(d2person(d_geoff),IW)
              & age(d2person(d_geoff),IW) = 0
              & ! [Y: $int] :
                  ( $greater(Y,IW)
                 => ( alive(d2person(d_geoff),Y)
                    & age(d2person(d_geoff),Y) = $difference(Y,IW) ) ) ) ) ) )
    & ! [IW: $int] :
        ( $greatereq(IW,1961)
       => ( '$in_world'(int2world(IW),
              ( ( ! [P: person] : ? [DP: d_person] : P = d2person(DP)
                & ! [DP: d_person] : DP = d_geoff
                & ? [DP: d_person] : DP = d_geoff
                & ! [X: d_person,Y: d_person] :
                    ( d2person(X) = d2person(Y) => X = Y ) )
              & geoff = d2person(d_geoff)
              & ! [Y: $int] :
                  ( ( $less(Y,1961)
                   => ( ~ alive(d2person(d_geoff),Y)
                      & age(d2person(d_geoff),Y) = -1 ) )
                  & ( ( $greatereq(Y,1961)
                      & $less(Y,IW) )
                   => ( alive(d2person(d_geoff),Y)
                      & age(d2person(d_geoff),Y) = $difference(Y,1961) ) ) )
              & alive(d2person(d_geoff),IW)
              & age(d2person(d_geoff),IW) = $difference(IW,1961)
              & ! [Y: $int] :
                  ( $greater(Y,IW)
                 => ( alive(d2person(d_geoff),Y)
                    & age(d2person(d_geoff),Y) = $difference(Y,1961) ) ) ) ) ) ) ) ).

tff(prove_formulae,conjecture,
    ! [IW: $int] :
    ? [I: $o] :
      ( '$in_world'(int2world(IW),(I))
%----This part can be proved if you tell it the year
      & ( (I)
       => ( ? [BirthYear: $int] :
              ( $lesseq(BirthYear,1961)
              & ! [PreBirthYear: $int] :
                  ( $less(PreBirthYear,BirthYear)
                 => ( ~ alive(geoff,PreBirthYear) 
                    & age(geoff,PreBirthYear) = -1 ) )
              & ! [FromBirthYear: $int] : 
                  ( $greatereq(FromBirthYear,BirthYear)
                 => ( alive(geoff,FromBirthYear)
                    & age(geoff,FromBirthYear) = $difference(FromBirthYear,BirthYear)) ) )
%----This part can't be proved.
          & ! [StartYear: $int,EndYear: $int] :
              ( ( $less(StartYear,EndYear)
                & alive(geoff,StartYear)
                & alive(geoff,EndYear) )
             => '$necessary'(int2world(IW),
                  ! [BetweenYear: $int] :
                    ( ( $greatereq(BetweenYear,StartYear)
                      & $lesseq(BetweenYear,EndYear) )
                   => alive(geoff,BetweenYear) ) ) )
%----These paarts can be provded
          & ! [DeathYear: $int] :
              ( ( alive(geoff,DeathYear)
                & ~ alive(geoff,$sum(DeathYear,1)) )
             => '$necessary'(int2world(IW),
                  ! [Year: $int] :
                    ( $greater(Year,DeathYear)
                   => ~ alive(geoff,Year) ) ) )
          & ! [Year: $int] :
              ( alive(geoff,Year)
             => '$possible'(int2world(IW),
                   alive(geoff,$sum(Year,1)) ) ) ) ) ) ).

%------------------------------------------------------------------------------
