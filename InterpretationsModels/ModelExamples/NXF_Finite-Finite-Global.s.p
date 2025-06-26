%------------------------------------------------------------------------------
tff(the_logic,logic,$$fomlModel).

tff(person_decl,type,    person: $tType ).
tff(product_decl,type,   product: $tType ).
tff(alex_decl,type,      alex: person ).
tff(chris_decl,type,     chris: person ).
tff(leo_decl,type,       leo: product ).
tff(work_hard_decl,type, work_hard: ( person * product ) > $o ).
tff(gets_rich_decl,type, gets_rich: person > $o ).

tff(d_alex_decl,type,    d_alex: person).
tff(d_chris_decl,type,   d_chris: person).
tff(d_leo_decl,type,     d_leo: product).

tff(w1_decl,type,w1:     $world).
tff(w2_decl,type,w2:     $world).

tff(leo_workers,interpretation,
    ( ( ! [W: $world] : ( W = w1 | W = w2 )
      & $distinct(w1,w2)
      & $local_world = w2
      & $accessible_world(w1,w1)     %----Logic is M
      & $accessible_world(w2,w2)
      & $accessible_world(w1,w2) 
      & $accessible_world(w2,w1) )
    & $in_world(w1,
        ( ! [DP: person] : ( DP = d_alex | DP = d_chris )
        & $distinct(d_alex,d_chris)
        & ? [DP: person] : ( DP = d_alex )
        & ? [DP: person] : ( DP = d_chris )
        & ! [DP: product] : DP = d_leo
        & ? [DP: product] : DP = d_leo )
      & ( alex = d_alex
        & chris = d_chris
        & leo = d_leo )
      & ( work_hard(d_alex,d_leo)
        & work_hard(d_chris,d_leo)
        & gets_rich(d_alex)
        & gets_rich(d_chris) ) )
    & $in_world(w2,
        ( ! [DP: person] : ( DP = d_alex | DP = d_chris )
        & $distinct(d_alex,d_chris)
        & ? [DP: person] : ( DP = d_alex )
        & ? [DP: person] : ( DP = d_chris )
        & ! [DP: product] : DP = d_leo
        & ? [DP: product] : DP = d_leo )
      & ( alex = d_alex
        & chris = d_chris
        & leo = d_leo )
      & ( work_hard(d_alex,d_leo)
        & work_hard(d_chris,d_leo)
        & ~ gets_rich(d_alex)
        & ~ gets_rich(d_chris) ) ) ) ).
%------------------------------------------------------------------------------

tff(work_hard_to_get_rich,conjecture-global,
    ! [P: person] :
      ( ? [R: product] : work_hard(P,R)
     => ( {$possible} @ (gets_rich(P)) ) ) ).

tff(not_all_get_rich,conjecture-global,
    ~ ? [P: person] : ( {$necessary} @ (gets_rich(P)) ) ).

tff(alex_works_on_leo,conjecture-global,
    work_hard(alex,leo) ).

tff(chris_works_on_leo,conjecture-global,
    work_hard(chris,leo) ).

tff(only_alex_gets_rich,conjecture-local,
    ~ ( {$possible}
      @ (( gets_rich(alex)
         & ~ gets_rich(chris) )) ) ).
%------------------------------------------------------------------------------
