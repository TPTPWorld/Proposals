%------------------------------------------------------------------------------
% File     : DAT405^1 : TPTP v9.2.0. Released v9.2.0.
% Domain   : Data Structures
% Problem  : List reversal involution polymorphic, step 1 
% Version  : Especial.
% English  : List reversal involution for polymorphic fixed-length lists. The
%            proof is split into smaller steps. To simplify proof search, the
%            axioms in each problem file have been preselected.

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ListReversalInvolution/list-rev-invol-step2.p [Rot25]

% Status   : Theorem
% Rating   : ? v9.2.0
% Syntax   : Number of formulae    :   18 (   6 unt;   9 typ;   0 def)
%            Number of atoms       :   10 (  10 equ;   0 cnn)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :  113 (   3   ~;   0   |;   0   &; 105   @)
%                                         (   0 <=>;   5  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    8 (   4 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    9 (   4 !>P;   3 !>D)
%            Number of type conns  :   11 (  11   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    9 (   8 usr;   1 con; 0-5 aty)
%            Number of variables   :   28 (   0   ^;  20   !;   0   ?;  28   :)
%                                         (   8  !>;   0  ?*;   0  @-;   0  @+)
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

thf(ax1,axiom,
    ! [N: nat] :
      ( ( plus @ zero @ N )
      = N ) ).

thf(ax2,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ ( suc @ N ) @ M )
      = ( suc @ ( plus @ N @ M ) ) ) ).

thf(plus_com,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ N @ M )
      = ( plus @ M @ N ) ) ).

thf(plus1r,axiom,
    ! [N: nat] :
      ( ( suc @ N )
      = ( plus @ N @ ( suc @ zero ) ) ) ).

thf(list_rev_invol_lem,axiom,
    ! [A: $tType,N: nat,L: list @ A @ N,M2: nat,L2: list @ A @ M2] :
      ( ( rev @ A @ ( plus @ N @ M2 ) @ ( app @ A @ N @ M2 @ ( rev @ A @ N @ L ) @ L2 ) )
      = ( app @ A @ M2 @ N @ ( rev @ A @ M2 @ L2 ) @ L ) ) ).

thf(list_rev_invol_step2,conjecture,
    ! [A: $tType,N: nat,L: list @ A @ N] :
      ( ( ( rev @ A @ N @ ( rev @ A @ N @ L ) )
        = ( rev @ A @ ( plus @ N @ zero ) @ ( app @ A @ N @ zero @ ( rev @ A @ N @ L ) @ ( nil @ A ) ) ) )
     => ( ( rev @ A @ N @ ( rev @ A @ N @ L ) )
        = ( app @ A @ zero @ N @ ( rev @ A @ zero @ ( nil @ A ) ) @ L ) ) ) ).

%------------------------------------------------------------------------------
