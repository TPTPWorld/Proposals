thf(color_type,type,
    color: $tType ).

thf(black_type,type,
    black: color ).

thf(red_type,type,
    red: color ).

thf(nat_type,type,
    nat: $tType ).

thf(zero_type,type,
    zero: nat ).

thf(suc_type,type,
    suc: nat > nat ).

thf(tree_type,type,
    tree: $tType > color > nat > $tType ).

thf(leaf_type,type,
    leaf: 
      !>[A: $tType] : ( tree @ A @ black @ zero ) ).

thf(redTree_type,type,
    rt: 
      !>[A: $tType,N: nat] : ( ( tree @ A @ black @ N ) > A > ( tree @ A @ black @ N ) > ( tree @ A @ red @ N ) ) ).

thf(blackTree_type,type,
    bt: 
      !>[A: $tType,N: nat,C1: color,C2: color] : ( ( tree @ A @ C1 @ N ) > A > ( tree @ A @ C2 @ N ) > ( tree @ A @ black @ ( suc @ N ) ) ) ).

thf(rbt_rev,type,
    rev: 
      !>[A: $tType,C: color,N: nat] : ( ( tree @ A @ C @ N ) > ( tree @ A @ C @ N ) ) ).

thf(rev_leaf,axiom,
    ! [A: $tType] :
      ( ( rev @ A @ black @ zero @ ( leaf @ A ) )
      = ( leaf @ A ) ) ).

thf(rev_bt,axiom,
    ! [A: $tType,X: A,N: nat,C1: color,C2: color,T1: tree @ A @ C1 @ N,T2: tree @ A @ C2 @ N] :
      ( ( rev @ A @ black @ ( suc @ N ) @ ( bt @ A @ N @ C1 @ C2 @ T1 @ X @ T2 ) )
      = ( bt @ A @ N @ C2 @ C1 @ ( rev @ A @ C2 @ N @ T2 ) @ X @ ( rev @ A @ C1 @ N @ T1 ) ) ) ).

thf(rev_rt,axiom,
    ! [A: $tType,X: A,N: nat,T1: tree @ A @ black @ N,T2: tree @ A @ black @ N] :
      ( ( rev @ A @ red @ N @ ( rt @ A @ N @ T1 @ X @ T2 ) )
      = ( rt @ A @ N @ ( rev @ A @ black @ N @ T2 ) @ X @ ( rev @ A @ black @ N @ T2 ) ) ) ).

thf(first_step,conjecture,
    ! [A: $tType,X: A,N: nat,C1: color,C2: color,T1: tree @ A @ C1 @ N,T2: tree @ A @ C2 @ N] :
      ( ( ( rev @ A @ C1 @ N @ ( rev @ A @ C1 @ N @ T1 ) )
        = T1 )
     => ( ( ( rev @ A @ C2 @ N @ ( rev @ A @ C2 @ N @ T2 ) )
          = T2 )
       => ( ( rev @ A @ black @ ( suc @ N ) @ ( rev @ A @ black @ ( suc @ N ) @ ( bt @ A @ N @ C1 @ C2 @ T1 @ X @ T2 ) ) )
          = ( rev @ A @ black @ ( suc @ N ) @ ( bt @ A @ N @ C2 @ C1 @ ( rev @ A @ C2 @ N @ T2 ) @ X @ ( rev @ A @ C1 @ N @ T1 ) ) ) ) ) ) ).
