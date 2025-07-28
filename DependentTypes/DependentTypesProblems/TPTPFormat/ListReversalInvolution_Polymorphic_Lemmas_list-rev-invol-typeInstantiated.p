%------------------------------------------------------------------------------
% File     : TBA000^1 : TPTP v10.0.0. Released v10.0.0.
% Domain   : Data Structures
% Problem  : List reversal involution polymorphic, type instantiated 
% Version  : Especial.
% English  : List reversal involution for polymorphic fixed-length lists. The
%            proof is split into smaller steps. To simplify proof search, the
%            axioms in each problem file have been preselected.

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ListReversalInvolution/list-rev-invol-typeInstantiated.p [Rot25]

% Status   : Theorem
% Rating   : ? v10.0.0
% Syntax   : Number of formulae    :   24 (  12 unt;   9 typ;   0 def)
%            Number of atoms       :   14 (  14 equ;   0 cnn)
%            Maximal formula atoms :    2 (   0 avg)
%            Number of connectives :  194 (   3   ~;   0   |;   0   &; 184   @)
%                                         (   0 <=>;   7  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   14 (   5 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    9 (   4 !>P;   4 !>D)
%            Number of type conns  :   12 (  12   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    9 (   8 usr;   1 con; 0-5 aty)
%            Number of variables   :   52 (   0   ^;  43   !;   0   ?;  52   :)
%                                         (   9  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : DH1_THM_EQU_NAR

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
      !>[A: $tType] : ( list @ A @ zero ) ).

thf(cons_type,type,
    cons: 
      !>[A: $tType,N: nat] : ( A > ( list @ A @ N ) > ( list @ A @ ( suc @ N ) ) ) ).

thf(app_type,type,
    app: 
      !>[A: $tType,N: nat,M: nat] : ( ( list @ A @ N ) > ( list @ A @ M ) > ( list @ A @ ( plus @ N @ M ) ) ) ).

thf(rev_type,type,
    rev: 
      !>[A: $tType,N: nat] : ( ( list @ A @ N ) > ( list @ A @ N ) ) ).

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

thf(ax3,axiom,
    ! [A: $tType,N: nat,X: list @ A @ N] :
      ( ( app @ A @ zero @ N @ ( nil @ A ) @ X )
      = X ) ).

thf(ax4,axiom,
    ! [A: $tType,N: nat,M: nat,X: A,Y: list @ A @ N,Z: list @ A @ M] :
      ( ( app @ A @ ( suc @ N ) @ M @ ( cons @ A @ N @ X @ Y ) @ Z )
      = ( cons @ A @ ( plus @ N @ M ) @ X @ ( app @ A @ N @ M @ Y @ Z ) ) ) ).

thf(ax5,axiom,
    ! [A: $tType] :
      ( ( rev @ A @ zero @ ( nil @ A ) )
      = ( nil @ A ) ) ).

thf(ax6,axiom,
    ! [A: $tType,N: nat,X: A,Y: list @ A @ N] :
      ( ( rev @ A @ ( suc @ N ) @ ( cons @ A @ N @ X @ Y ) )
      = ( app @ A @ N @ ( suc @ zero ) @ ( rev @ A @ N @ Y ) @ ( cons @ A @ zero @ X @ ( nil @ A ) ) ) ) ).

thf(plus_com,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ N @ M )
      = ( plus @ M @ N ) ) ).

thf(plus1r,axiom,
    ! [N: nat] :
      ( ( suc @ N )
      = ( plus @ N @ ( suc @ zero ) ) ) ).

thf(list_app_nil,axiom,
    ! [A: $tType,N: nat,L: list @ A @ N] :
      ( ( app @ A @ N @ zero @ L @ ( nil @ A ) )
      = L ) ).

thf(list_rev_invol_lem,axiom,
    ! [A: $tType,N: nat,L: list @ A @ N,M2: nat,L2: list @ A @ M2] :
      ( ( rev @ A @ ( plus @ N @ M2 ) @ ( app @ A @ N @ M2 @ ( rev @ A @ N @ L ) @ L2 ) )
      = ( app @ A @ M2 @ N @ ( rev @ A @ M2 @ L2 ) @ L ) ) ).

thf(list_rev_invol,conjecture,
    ! [N: nat,L: list @ ( list @ ( list @ nat @ ( suc @ zero ) ) @ ( suc @ zero ) ) @ N] :
      ( ( rev @ ( list @ ( list @ nat @ ( suc @ zero ) ) @ ( suc @ zero ) ) @ N @ ( rev @ ( list @ ( list @ nat @ ( suc @ zero ) ) @ ( suc @ zero ) ) @ N @ L ) )
      = L ) ).

%------------------------------------------------------------------------------
