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

thf(bad_tree,conjecture,
    ! [A: $tType,N: nat,C1: color,C2: color,T: tree @ A @ red @ N] :
    ? [X: A,T1: tree @ A @ C1 @ N,T2: tree @ A @ C1 @ N] :
      ( T
      = ( rt @ A @ N @ T1 @ X @ T2 ) ) ).
