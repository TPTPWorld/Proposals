%------------------------------------------------------------------------------
tff(simple_spec,logic,
    $alethic_modal ==
      [ $domains == $constant,
        $designation == $rigid,
        $terms == $local,
        $modalities == $modal_system_M ] ).

%----Declarations to fool Vampire when processing this file directly
% tff('$world_type',type,$world: $tType).
% tff('$local_world_decl',type,$local_world: $world).
% tff('$accessible_world_decl',type,$accessible_world: ($world * $world) > $o).
% tff('$in_world_decl',type,$in_world: ($world * $o) > $o).

tff(person_type,type, person: $tType).
tff(geoff_decl,type,geoff: person).
tff(alive_decl,type,alive: (person * $int) > $o).
tff(age_decl,type,age: (person * $int) > $int).

tff(d_person_type,type,d_person: $tType).
tff(d_geoff_decl,type,d_geoff: d_person).
tff(d2person_decl,type,d2person: d_person > person).

tff(int2world_decl,type,int2world: $int > $world ).

tff(long_live_geoff,interpretation,
%----An infinite number of worlds, numbered by naturals
    ( ( ! [I: $int] : ? [W: $world] : int2world(I) = W
%----The type promoter is a bijection (injective and surjective)
      & ! [I1: $int,I2: $int] : 
          ( int2world(I1) = int2world(I2) => I1 = I2 )
      & ! [W: $world] : ? [I: $int] : int2world(I) = W
%----Worlds can access themselves and greater indexed worlds (worlds in the future)
      & ! [P: $int,F: $int] : 
          ( $greatereq(F,P)
         => $accessible_world(int2world(P),int2world(F)) ) )

%----Worlds before 1961 all think geoff was born that year
    & ! [IW: $int] :
        ( $less(IW,1961)
       => $in_world(int2world(IW),
%----Only one domain element for person
            ( ! [P: person] : ? [DP: d_person] : P = d2person(DP)
            & ! [DP: d_person] : DP = d_geoff
            & ? [DP: d_person] : DP = d_geoff
%----The type promoter is a bijection (injective and surjective)
            & ! [X: d_person,Y: d_person] :
                ( d2person(X) = d2person(Y) => X = Y )
            & geoff = d2person(d_geoff)
%----Alive and age interpretation
            & ! [Y: $int] :
                ( $less(Y,IW)
               => ( ~ alive(d2person(d_geoff),Y)
                  & age(d2person(d_geoff),Y) = -1 ) )
            & alive(d2person(d_geoff),IW)
            & age(d2person(d_geoff),IW) = 0
            & ! [Y: $int] :
                ( $greater(Y,IW)
               => ( alive(d2person(d_geoff),Y)
                  & age(d2person(d_geoff),Y) = $difference(Y,IW) ) ) ) )

%----Worlds from 1961 know geoff was born in 1961. geoff lives forever!
    & ! [IW: $int] :
        ( $greatereq(IW,1961)
       => $in_world(int2world(IW),
            ( ! [P: person] : ? [DP: d_person] : P = d2person(DP)
            & ! [DP: d_person] : DP = d_geoff
            & ? [DP: d_person] : DP = d_geoff
            & ! [X: d_person,Y: d_person] :
                ( d2person(X) = d2person(Y) => X = Y )
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

%------------------------------------------------------------------------------
