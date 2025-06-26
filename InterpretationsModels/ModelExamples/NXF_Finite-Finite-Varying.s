%------------------------------------------------------------------------------
tff(semantics,logic,
    $alethic_modal ==
      [ $domains == $varying,
        $designation == $flexible,
        $terms == $local,
        $modalities == $modal_system_M ] ).

tff(person_decl,type,    person: $tType).
tff(product_decl,type,   product: $tType).
tff(alex_decl,type,      alex: person).
tff(chris_decl,type,     chris: person).
tff(leo_decl,type,       leo: product).
tff(work_hard_decl,type, work_hard: (person * product) > $o).
tff(gets_rich_decl,type, gets_rich: person > $o).

tff(d_person_type,type,  d_person: $tType).
tff(d2person_decl,type,  d2person: d_person > person ).
tff(d_alex_decl,type,    d_alex: d_person).   %----Alex in w1
tff(d_steen_decl,type,   d_steen: d_person).  %----Alex in w2
tff(d_chris_decl,type,   d_chris: d_person).  %----Chris in w1 and w2
tff(d_benzm_decl,type,   d_benzm: d_person).  %----Doesn't get used. Silly ATP system.
tff(d_product_type,type, d_product: $tType).
tff(d2product_decl,type, d2product: d_product > product ).
tff(d_leo_decl,type,     d_leo: d_product).

tff(w1_decl,type,w1:     $world).
tff(w2_decl,type,w2:     $world).

%----Separate out the worlds
tff(leo_workers_worlds,interpretation-world,
    ( ! [W: $world] : ( W = w1 | W = w2 )
    & $distinct(w1,w2)             %----Tools should know that terms of type $world are distinct
    & $local_world = w2
    & ! [W1: $world,W2: $world] : $accessible_world(W1,W2) ) ).   %----Logic is M

tff(leo_workers_domains,interpretation-domain,
%----All domain elements are distinct, even if they are in different worlds
    ( $distinct(d_alex,d_steen,d_chris,d_benzm)
%----Features of domains for all worlds
    & ! [W: $world] :
        $in_world(W,
          ( ! [P: person] : ? [DP: d_person] : P = d2person(DP)   %----Surjective
          & ! [DP1: d_person,DP2: d_person] : 
              ( d2person(DP1) = d2person(DP2) => DP1 = DP2 ) ))   %----Injective
%----Features of the domain for world w1.
    & $in_world(w1,
        ( ! [DP: d_person] : ( DP = d_alex | DP = d_chris )
        & ? [DP: d_person] : ( DP = d_alex )    %----Alex (in real life) is thinking about this.
        & ? [DP: d_person] : ( DP = d_chris ) ))
%----Features of the domain for world w2. Note the different elements in 
%----d_person, and the duplication that could have been moved out if wanted.
    & $in_world(w2,
        ( ! [DP: d_person] : ( DP = d_steen | DP = d_chris )
        & ? [DP: d_person] : ( DP = d_steen )
        & ? [DP: d_person] : ( DP = d_chris ) )) ) ).

%----Mappings with common features factored out, and unique features listed
%----separately.
tff(leo_workers_w1_mappings,interpretation-mapping,
    ( ! [W: $world] :
        $in_world(W,
          ( chris = d2person(d_chris)
          & leo = d2product(d_leo)
          & work_hard(d2person(d_chris),d2product(d_leo)) ))
    & $in_world(w1,
        ( alex = d2person(d_alex)
        & work_hard(d2person(d_alex),d2product(d_leo))
        & gets_rich(d2person(d_alex))
        & gets_rich(d2person(d_chris)) ))
    & $in_world(w2,
        ( alex = d2person(d_steen)
        & work_hard(d2person(d_steen),d2product(d_leo))
        & gets_rich(d2person(d_steen))
        & ~ gets_rich(d2person(d_chris)) )) ) ). 
%------------------------------------------------------------------------------
