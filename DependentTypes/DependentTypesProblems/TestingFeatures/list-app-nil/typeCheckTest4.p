%------------------------------------------------------------------------------
% File     : TBA000^1 : TPTP v10.0.0. Released v10.0.0.
% Domain   : TBA
% Problem  : TBA
% Version  : Especial.
% English  :

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
% Source   : [TPTP]
% Names    :

% Status   : Theorem
% Rating   : ? v10.0.0
% Syntax   : Number of formulae    :   18 (   7 unt;   8 typ;   0 def)
%            Number of atoms       :    9 (   9 equ;   0 cnn)
%            Maximal formula atoms :    2 (   0 avg)
%            Number of connectives :   98 (   3   ~;   0   |;   0   &;  88   @)
%                                         (   0 <=>;   7  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   14 (   5 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    8 (   3 !>P;   3 !>D)
%            Number of type conns  :   11 (  11   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    8 (   7 usr;   1 con; 0-5 aty)
%            Number of variables   :   34 (   0   ^;  27   !;   0   ?;  34   :)
%                                         (   7  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : TH0_THM_NEQ_ARI

% Comments :
%------------------------------------------------------------------------------
thf(nat_type,type,
    nat: $tType).

thf(zero_type,type,
    zero: nat).

thf(suc_type,type,
    suc: nat > nat).

thf(plus_type,type,
    plus: nat > nat > nat).

thf(list_type,type,
    list:
    $tType > nat > $tType).

thf(nil_type,type,
    nil:
    !>[A:$tType]: (list @ A @ zero) ).

thf(cons_type,type,
    cons: 
    !>[A:$tType, N:nat]: (A > (list @ A @ N) > (list @ A @ (suc @ N)))).

thf(app_type,type,
    app: 
    !>[A:$tType, N:nat, M:nat]: ((list @ A @ N) > (list @ A @ M) > (list @ A @ (plus @ N @ M)))).

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

thf(list_induct,axiom,
    ![A: $tType]: (
    ![P: !>[N: nat]: ((list @ A @ N) > $o)]:
      ( ( P @ zero @ (nil @ A) )
    => ( ! [M: nat, X:A, Y:list @ A @ M] :
            ( ( P @ M @ Y )
           => ( P @ ( suc @ M ) @ ( cons @ A @ M @ X @ Y ) ) )
       => ( ! [N: nat,X: list @ A @ N] : ( P @ N @ X ) ) ) ) ) ).

thf(ax1,axiom,
    ! [N: nat] :
      ( ( plus @ zero @ N )
      = N ) ).

thf(ax2,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ ( suc @ N ) @ M )
      = ( suc @ ( plus @ N @ M ) ) ) ).

thf(ax3,axiom,
    ! [A:$tType, N:nat, X:list @ A @ N] :
      ( ( app @ A @ zero @ N @ (nil @ A) @ X )
      = X ) ).

thf(ax4,axiom,
    ! [A:$tType, N:nat, M:nat, X:A, Y:list @ A @ N, Z:list @ A @ M] :
      ( ( app @ A @ ( suc @ N ) @ M @ ( cons @ A @ N @ X @ Y ) @ Z )
      = ( cons @ A @ ( plus @ N @ M ) @ X @ ( app @ A @ N @ M @ Y @ Z ) ) ) ).

thf(plus_zero_r,axiom,
    ! [M: nat] :
      ( ( plus @ M @ zero )
      = M ) ).

thf(test,conjecture,
    ![A: $tType]: ( (nil @ A)
    = (nil @ A) ) ).

%------------------------------------------------------------------------------
