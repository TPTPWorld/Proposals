thf(nat_type,type,
    nat: $tType ).

thf(zero_type,type,
    zero: nat ).

thf(suc_type,type,
    suc: nat > nat ).

thf(plus_type,type,
    plus: nat > nat > nat ).

thf(plus_zero_def,axiom,
    ![N: nat]: ((plus @ N @ zero) = N)).

thf(plus_suc_def,axiom,
    ![N: nat, M: nat]: ((plus @  N @ (suc @ M)) = (plus @ (suc @ N) @ M))).

thf(list_type,type,
    list: nat > $tType ).

thf(nil_type,type,
    nil: (list @ zero) ).

thf(cons_type,type,
    cons: 
      !>[N: nat] : ( nat > ( list @ N ) > ( list @ ( suc @ N ) ) ) ).

thf(app_type,type,
    app: 
      !>[N: nat,M: nat] : ( ( list @ N ) > ( list @ M ) > ( list @ ( plus @ N @ M ) ) ) ).

thf(app_nil,axiom,
    ![N: nat, L: (list @ N)] : ( ( app @ N @ zero @ L @ nil ) = L)).

thf(matrix_type,type,
    matrix: 
      !>[N: nat] : ( ( list @ N ) > $tType ) ).

thf(mempty_type,type,
    mempty: ( matrix @ zero @ nil ) ).

thf(mcons_type,type,
    mcons: 
      !>[M: nat,N: nat,D: ( list @ N ) ] : ( ( list @ M ) > ( matrix @ N @ D ) > ( matrix @ ( suc @ N ) @ ( cons @ N @ M @ D ) ) ) ).

thf(sum_type,type,
    sum: ( !>[N: nat] : ( ( list @ N ) > nat ) ) ).

thf(sum_base,axiom,
    ( ( sum @ zero @ nil )
    = zero ) ).

thf(sum_step,axiom,
    ! [M: nat,N: nat,L: ( list @ N ) ] :
      ( ( sum @ ( suc @ N ) @ ( cons @ N @ M @ L ) )
      = ( plus @ M @ ( sum @ N @ L ) ) ) ).

thf(flatten,type,
    flatten: 
      !>[N: nat,D: ( list @ N ) ] : ( ( matrix @ N @ D ) > ( list @ ( sum @ N @ D ) ) ) ).

thf(flatten_base,axiom,
    ( ( flatten @ zero @ nil @ mempty )
    = nil ) ).

thf(flatten_step,axiom,
    ! [X: nat,Y: nat,A: ( list @ X ) ,B: ( list @ Y ),M: (matrix @ Y @ B)] :
      ( ( flatten @ ( suc @ Y ) @ ( cons @ Y @ X @ B ) @ ( mcons @ X @ Y @ B @ A @ M ) )
      = ( app @ X @ ( sum @ Y @ B ) @ A @ ( flatten @ Y @ B @ M ) ) ) ).

thf(peano1,axiom,
    ! [N: nat] :
      ( ( suc @ N )
     != zero ) ).

thf(peano2,axiom,
    ! [N: nat,M: nat] :
      ( ( N != M )
     => ( ( suc @ N )
       != ( suc @ M ) ) ) ).

thf(peano3,axiom,
    ! [P: nat > $o] :
      ( ( P @ zero )
     => ( ! [M: nat] :
            ( ( P @ M )
           => ( P @ ( suc @ M ) ) )
       => ! [N: nat] : ( P @ N ) ) ) ).

%proofs with dhol_mode_6 and typechecks with default (cade22grackle2x798d)
thf(flatten_one_column_id,conjecture,
    ! [M: nat,L: ( list @ M ) ] :
    ( ( flatten @ ( suc @ zero ) @ (cons @ zero @ M @ nil) @ ( mcons @ M @ zero @ nil @ L @ mempty ) )
    = L ) ).
 
