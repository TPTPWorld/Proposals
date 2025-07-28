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
% Syntax   : Number of formulae    :   12 (   4 unt;   8 typ;   0 def)
%            Number of atoms       :    4 (   4 equ;   0 cnn)
%            Maximal formula atoms :    1 (   1 avg)
%            Number of connectives :   97 (   0   ~;   0   |;   0   &;  97   @)
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    9 (   6 avg)
%            Number of types       :    1 (   1 usr)
%            Number of type decls  :    8 (   3 !>P;   2 !>D)
%            Number of type conns  :    9 (   9   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    8 (   7 usr;   1 con; 0-5 aty)
%            Number of variables   :   25 (   0   ^;  19   !;   0   ?;  25   :)
%                                         (   6  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : TH0_THM_NEQ_ARI

% Comments :
%------------------------------------------------------------------------------
thf(nat_type,type,
    nat: $tType ).

thf(zero_type,type,
    zero: nat ).

thf(suc_type,type,
    suc: nat > nat ).

thf(plus_type,type,
    plus: nat > nat > nat ).

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

thf(ax2,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ ( suc @ N ) @ M )
      = ( suc @ ( plus @ N @ M ) ) ) ).

thf(ax4,axiom,
    ! [A: $tType,N: nat,M: nat,X: A,Y: list @ A @ N,Z: list @ A @ M] :
      ( ( app @ A @ ( suc @ N ) @ M @ ( cons @ A @ N @ X @ Y ) @ Z )
      = ( cons @ A @ ( plus @ N @ M ) @ X @ ( app @ A @ N @ M @ Y @ Z ) ) ) ).

thf(plus_assoc,axiom,
    ! [M1: nat,M2: nat,M3: nat] :
      ( ( plus @ M1 @ ( plus @ M2 @ M3 ) )
      = ( plus @ ( plus @ M1 @ M2 ) @ M3 ) ) ).

thf(list_app_assoc_indstep4,conjecture,
    ! [A: $tType,M2: nat,L2: list @ A @ M2,M3: nat,L3: list @ A @ M3,M: nat,X: A,L: list @ A @ M] :
      ( ( app @ A @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ A @ M @ X @ L ) @ ( app @ A @ M2 @ M3 @ L2 @ L3 ) )
      = ( cons @ A @ ( plus @ M @ ( plus @ M2 @ M3 ) ) @ X @ ( app @ A @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ A @ M2 @ M3 @ L2 @ L3 ) ) ) ) ).
%------------------------------------------------------------------------------
