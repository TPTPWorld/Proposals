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
% Syntax   : Number of formulae    :   23 (  10 unt;  10 typ;   0 def)
%            Number of atoms       :   14 (  14 equ;   0 cnn)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :  147 (   3   ~;   0   |;   0   &; 139   @)
%                                         (   0 <=>;   5  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    8 (   4 avg)
%            Number of types       :    3 (   2 usr)
%            Number of type decls  :   10 (   0 !>P;   3 !>D)
%            Number of type conns  :   10 (  10   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    9 (   8 usr;   2 con; 0-4 aty)
%            Number of variables   :   34 (   0   ^;  30   !;   0   ?;  34   :)
%                                         (   4  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : TH0_THM_NEQ_ARI

% Comments :
%------------------------------------------------------------------------------
thf(elem_type,type,
    elem: $tType ).

thf(nat_type,type,
    nat: $tType ).

thf(zero_type,type,
    zero: nat ).

thf(suc_type,type,
    suc: nat > nat ).

thf(plus_type,type,
    plus: nat > nat > nat ).

thf(list_type,type,
    list: nat > $tType ).

thf(nil_type,type,
    nil: list @ zero ).

thf(cons_type,type,
    cons: 
      !>[N: nat] : ( elem > ( list @ N ) > ( list @ ( suc @ N ) ) ) ).

thf(app_type,type,
    app: 
      !>[N: nat,M: nat] : ( ( list @ N ) > ( list @ M ) > ( list @ ( plus @ N @ M ) ) ) ).

thf(rev_type,type,
    rev: 
      !>[N: nat] : ( ( list @ N ) > ( list @ N ) ) ).

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

thf(ax3,axiom,
    ! [N: nat,X: list @ N] :
      ( ( app @ zero @ N @ nil @ X )
      = X ) ).

thf(ax4,axiom,
    ! [N: nat,M: nat,X: elem,Y: list @ N,Z: list @ M] :
      ( ( app @ ( suc @ N ) @ M @ ( cons @ N @ X @ Y ) @ Z )
      = ( cons @ ( plus @ N @ M ) @ X @ ( app @ N @ M @ Y @ Z ) ) ) ).

thf(plus_zero_r,axiom,
    ! [M: nat] :
      ( ( plus @ M @ zero )
      = M ) ).

thf(plus_com,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ N @ M )
      = ( plus @ M @ N ) ) ).

thf(plus_assoc,axiom,
    ! [M1: nat,M2: nat,M3: nat] :
      ( ( plus @ M1 @ ( plus @ M2 @ M3 ) )
      = ( plus @ ( plus @ M1 @ M2 ) @ M3 ) ) ).

thf(plus1r,axiom,
    ! [N: nat] :
      ( ( suc @ N )
      = ( plus @ N @ ( suc @ zero ) ) ) ).

thf(plus_s_l_r,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ ( suc @ N ) @ M )
      = ( plus @ N @ ( suc @ M ) ) ) ).

thf(list_rev_invol_lem_indstep3,conjecture,
    ! [N: nat,X: elem,L: list @ N,M2: nat,L2: list @ M2] :
      ( ( ( rev @ ( plus @ ( suc @ N ) @ M2 ) @ ( app @ ( suc @ N ) @ M2 @ ( rev @ ( suc @ N ) @ ( cons @ N @ X @ L ) ) @ L2 ) )
        = ( rev @ ( plus @ ( suc @ N ) @ M2 ) @ ( app @ N @ ( suc @ M2 ) @ ( rev @ N @ L ) @ ( cons @ M2 @ X @ L2 ) ) ) )
     => ( ( rev @ ( plus @ ( suc @ N ) @ M2 ) @ ( app @ ( suc @ N ) @ M2 @ ( rev @ ( suc @ N ) @ ( cons @ N @ X @ L ) ) @ L2 ) )
        = ( rev @ ( plus @ N @ ( suc @ M2 ) ) @ ( app @ N @ ( suc @ M2 ) @ ( rev @ N @ L ) @ ( cons @ M2 @ X @ L2 ) ) ) ) ) ).
%------------------------------------------------------------------------------
