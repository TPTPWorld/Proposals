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
% Syntax   : Number of formulae    :   15 (   5 unt;   8 typ;   0 def)
%            Number of atoms       :   11 (  11 equ;   0 cnn)
%            Maximal formula atoms :    4 (   1 avg)
%            Number of connectives :  601 (   0   ~;   0   |;   0   &; 597   @)
%                                         (   0 <=>;   4  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   11 (   6 avg)
%            Number of types       :    1 (   1 usr)
%            Number of type decls  :    8 (   3 !>P;   2 !>D)
%            Number of type conns  :    9 (   9   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    8 (   7 usr;   1 con; 0-5 aty)
%            Number of variables   :   38 (   0   ^;  32   !;   0   ?;  38   :)
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

thf(lis_app_assoc_indinst,axiom,
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

thf(list_app_assoc_base,axiom,
    ! [M2: nat,L2: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2,M3: nat,L3: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M3] :
      ( ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ zero @ ( plus @ M2 @ M3 ) @ (nil @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero))) @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2 @ M3 @ L2 @ L3 ) )
      = ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( plus @ zero @ M2 ) @ M3 @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ zero @ M2 @ (nil @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero))) @ L2 ) @ L3 ) ) ).

thf(list_app_assoc_indstep,axiom,
    ! [M2: nat,L2: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2,M3: nat,L3: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M3,M: nat,X: (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)),L: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M] :
      ( ( ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2 @ M3 @ L2 @ L3 ) )
        = ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( plus @ M @ M2 ) @ M3 @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ M2 @ L @ L2 ) @ L3 ) )
     => ( ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ X @ L ) @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2 @ M3 @ L2 @ L3 ) )
        = ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( plus @ ( suc @ M ) @ M2 ) @ M3 @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( suc @ M ) @ M2 @ ( cons @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ X @ L ) @ L2 ) @ L3 ) ) ) ).

thf(list_app_assoc,conjecture,
    ! [M: nat,L: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M,M2: nat,L2: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2,M3: nat,L3: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M3] :
      ( ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2 @ M3 @ L2 @ L3 ) )
      = ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( plus @ M @ M2 ) @ M3 @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ M2 @ L @ L2 ) @ L3 ) ) ).
%------------------------------------------------------------------------------
