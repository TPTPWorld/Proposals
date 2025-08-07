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
% Syntax   : Number of formulae    :   11 (   2 unt;   8 typ;   0 def)
%            Number of atoms       :    5 (   5 equ;   0 cnn)
%            Maximal formula atoms :    3 (   1 avg)
%            Number of connectives :  255 (   0   ~;   0   |;   0   &; 253   @)
%                                         (   0 <=>;   2  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   10 (   6 avg)
%            Number of types       :    1 (   1 usr)
%            Number of type decls  :    8 (   3 !>P;   2 !>D)
%            Number of type conns  :    9 (   9   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    8 (   7 usr;   1 con; 0-5 aty)
%            Number of variables   :   18 (   0   ^;  12   !;   0   ?;  18   :)
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

thf(plus_assoc,axiom,
    ! [M1: nat,M2: nat,M3: nat] :
      ( ( plus @ M1 @ ( plus @ M2 @ M3 ) )
      = ( plus @ ( plus @ M1 @ M2 ) @ M3 ) ) ).

thf(list_app_assoc_indstep3,conjecture,
    ! [M2: nat,L2: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2,M3: nat,L3: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M3,M: nat,X: (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)),L: list @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M] :
      ( ( ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2 @ M3 @ L2 @ L3 ) )
        = ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( plus @ M @ M2 ) @ M3 @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ M2 @ L @ L2 ) @ L3 ) )
     => ( ( ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ X @ L ) @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2 @ M3 @ L2 @ L3 ) )
          = ( cons @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( plus @ M @ ( plus @ M2 @ M3 ) ) @ X @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2 @ M3 @ L2 @ L3 ) ) ) )
       => ( ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( suc @ M ) @ ( plus @ M2 @ M3 ) @ ( cons @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ X @ L ) @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M2 @ M3 @ L2 @ L3 ) )
          = ( cons @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero))  @ ( plus @ ( plus @ M @ M2 ) @ M3 ) @ X @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ ( plus @ M @ M2 ) @ M3 @ ( app @ (list @ (list @ nat @ (suc @ zero)) @ (suc @ zero)) @ M @ M2 @ L @ L2 ) @ L3 ) ) ) ) ) ).

%------------------------------------------------------------------------------
