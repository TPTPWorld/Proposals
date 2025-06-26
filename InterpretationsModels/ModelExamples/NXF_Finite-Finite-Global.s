%------------------------------------------------------------------------------
tff(semantics,logic,
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

tff(person_decl,type,    person: $tType).
tff(product_decl,type,   product: $tType).
tff(alex_decl,type,      alex: person).
tff(chris_decl,type,     chris: person).
tff(leo_decl,type,       leo: product).
tff(work_hard_decl,type, work_hard: (person * product) > $o).
tff(gets_rich_decl,type, gets_rich: person > $o).

tff(d_alex_decl,type,    d_alex: person).
tff(d_chris_decl,type,   d_chris: person).
tff(d_leo_decl,type,     d_leo: product).

tff(w1_decl,type,w1:     $world).
tff(w2_decl,type,w2:     $world).

tff(leo_workers_worlds,interpretation,
    ( ( ! [W: $world] : ( W = w1 | W = w2 )
      & $distinct(w1,w2)             %----Not needed in principle, should be built in
      & $local_world = w2
      & $accessible_world(w1,w1)     %----Logic is M
      & $accessible_world(w2,w2)
      & $accessible_world(w1,w2) 
      & $accessible_world(w2,w1) )
    & $distinct(d_alex,d_chris,d_steen)
    & $in_world(w1,
        ( ! [DP: person] : ( DP = d_alex | DP = d_chris )
        & ? [DP: person] : DP = d_alex
        & ? [DP: person] : DP = d_chris
        & ! [DP: product] : DP = d_leo
        & ? [DP: product] : DP = d_leo
        & alex = d_alex
        & chris = d_chris
        & leo = d_leo
        & work_hard(d_alex,d_leo)
        & work_hard(d_chris,d_leo)
        & gets_rich(d_chris)
        & gets_rich(d_alex) ))
    & $in_world(w2,
        ( ! [DP: person] : ( DP = d_alex | DP = d_chris )
        & ? [DP: person] : DP = d_alex
        & ? [DP: person] : DP = d_chris
        & ! [DP: product] : DP = d_leo
        & ? [DP: product] : DP = d_leo
        & alex = d_alex
        & chris = d_chris
        & leo = d_leo
        & work_hard(d_alex,d_leo)
        & work_hard(d_chris,d_leo)
        & gets_rich(d_chris)
        & gets_rich(d_alex) )) ) ).
%------------------------------------------------------------------------------
