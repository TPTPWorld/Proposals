%------------------------------------------------------------------------------
tff(the_logic,logic,$$fomlModel).

tff(fruit_type,type,    fruit: $tType ).
tff(apple_decl,type,    apple: fruit ).
tff(banana_decl,type,   banana: fruit ).
tff(healthy_decl,type,  healthy: fruit > $o ).
tff(rotten_decl,type,   rotten: fruit > $o ).

tff(d_apple_decl,type,d_apple: fruit).
tff(d_banana_decl,type,d_banana: fruit).

tff(w1_decl,type,w1: $world).
tff(w2_decl,type,w2: $world).

tff(fruity_worlds,axiom,
    ( ( ! [W: $world] : ( W = w1 | W = w2 )
      & $local_world = w1
      & $accessible_world(w1,w1)     %----Logic is M
      & $accessible_world(w2,w2)
      & $accessible_world(w1,w2) )
    & $in_world(w1,
        ( ( ! [DF: fruit] : ( DF = d_apple | DF = d_banana )
          & $distinct(d_apple,d_banana)
          & ? [DP: fruit] : ( DP = d_apple )
          & ? [DP: fruit] : ( DP = d_banana ) )
        & ( apple = d_apple
          & banana = d_banana )
        & ( healthy(d_apple)
          & healthy(d_banana)
          & ~ rotten(d_apple)
          & rotten(d_banana) ) ) )
    & $in_world(w2,
        ( ( ! [DF: fruit] : ( DF = d_apple | DF = d_banana )
          & $distinct(d_apple,d_banana)
          & ? [DP: fruit] : ( DP = d_apple )
          & ? [DP: fruit] : ( DP = d_banana ) )
        & ( apple = d_apple
          & banana = d_banana )
        & ( healthy(d_apple)
          & healthy(d_banana)
          & ~ rotten(d_apple)
          & ~ rotten(d_banana) ) ) ) ) ).

tff(apple_not_banana,conjecture-global,
    apple != banana ).

tff(necessary_healthy_fruit_everywhere,conjecture-global,
    ! [F: fruit] : ( {$necessary} @ (healthy(F)) ) ).

tff(fruit_possibly_not_rotten,conjecture-global,
    ! [F: fruit] : ( {$possible} @ (~ rotten(F)) ) ).

tff(rotten_banana_here,conjecture-local,
    rotten(banana) ).

tff(not_true,conjecture-local,
    ~ ( {$necessary}
      @ (( healthy(apple)
         & ~ rotten(banana) )) ) ).
%------------------------------------------------------------------------------
