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
% Syntax   : Number of formulae    :   14 (   3 unt;   8 typ;   0 def)
%            Number of atoms       :    9 (   9 equ;   0 cnn)
%            Maximal formula atoms :    4 (   1 avg)
%            Number of connectives :  329 (   2   ~;   0   |;   0   &; 320   @)
%                                         (   0 <=>;   7  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   14 (   7 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    8 (   3 !>P;   3 !>D)
%            Number of type conns  :   10 (  10   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    8 (   7 usr;   1 con; 0-5 aty)
%            Number of variables   :   31 (   0   ^;  24   !;   0   ?;  31   :)
%                                         (   7  !>;   0  ?*;   0  @-;   0  @+)
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
    list: $tType > nat > $tType ).

thf(nil_type,type,
    nil:
    !>[A:$tType]: (list @ A @ zero) ).

thf(cons_type,type,
    cons: 
    !>[A:$tType, N:nat]: (A > (list @ A @ N) > (list @ A @ (suc @ N)))).

thf(app_type,type,
    app: 
    !>[A:$tType, N:nat, M:nat]: ((list @ A @ N) > (list @ A @ M) > (list @ A @ (plus @ N @ M)))).

thf(peano2,axiom,
    ! [N: nat,M: nat] :
      ( ( N != M )
     => ( ( suc @ N )
       != ( suc @ M ) ) ) ).

thf(list_induct,axiom,
    ! [A: $tType,
       P: !>[N: nat] : ( ( list @ A @ N ) > $o )] :
      ( ( P @ zero @ ( nil @ A ) )
     => ( ! [M: nat,X: A,Y: list @ A @ M] :
            ( ( P @ M @ Y )
           => ( P @ ( suc @ M ) @ ( cons @ A @ M @ X @ Y ) ) )
       => ! [N: nat,X: list @ A @ N] : ( P @ N @ X ) ) ) ).

thf(ax1,axiom,
    ! [N: nat] :
      ( ( plus @ zero @ N )
      = N ) ).

thf(ax2,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ ( suc @ N ) @ M )
      = ( suc @ ( plus @ N @ M ) ) ) ).

thf(plus_assoc,axiom,
    ! [M1: nat,M2: nat,M3: nat] :
      ( ( plus @ M1 @ ( plus @ M2 @ M3 ) )
      = ( plus @ ( plus @ M1 @ M2 ) @ M3 ) ) ).

thf(list_app_assoc_indinst,conjecture,
    ! [M2: nat,L2: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2,M3: nat,L3: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M3] :
      ( ( ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ zero @ ( plus @ M2 @ M3 ) @ (nil @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero))) @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2 @ M3 @ L2 @ L3 ) )
        = ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( plus @ zero @ M2 ) @ M3 @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ zero @ M2 @ (nil @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero))) @ L2 ) @ L3 ) )
    => ( ! [M: nat,X: (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)),L: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M] :
            ( ( ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2 @ M3 @ L2 @ L3 ) )
              = ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( plus @ M @ M2 ) @ M3 @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ M2 @ L @ L2 ) @ L3 ) )
           => ( ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ X @ L ) @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2 @ M3 @ L2 @ L3 ) )
              = ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( plus @ ( suc @ M ) @ M2 ) @ M3 @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( suc @ M ) @ M2 @ ( cons @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ X @ L ) @ L2 ) @ L3 ) ) )
       => ! [M: nat,L: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M] :
            ( ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2 @ M3 @ L2 @ L3 ) )
            = ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( plus @ M @ M2 ) @ M3 @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ M2 @ L @ L2 ) @ L3 ) ) ) ) ).
%------------------------------------------------------------------------------
