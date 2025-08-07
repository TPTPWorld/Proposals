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
% Syntax   : Number of formulae    :   27 (  12 unt;  10 typ;   0 def)
%            Number of atoms       :   20 (  20 equ;   0 cnn)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :  170 (   3   ~;   0   |;   0   &; 160   @)
%                                         (   0 <=>;   7  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    8 (   4 avg)
%            Number of types       :    3 (   2 usr)
%            Number of type decls  :   10 (   0 !>P;   3 !>D)
%            Number of type conns  :   10 (  10   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    9 (   8 usr;   2 con; 0-4 aty)
%            Number of variables   :   38 (   0   ^;  34   !;   0   ?;  38   :)
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

thf(ax5,axiom,
    ( ( rev @ zero @ nil )
    = nil ) ).

thf(ax6,axiom,
    ! [N: nat,X: elem,Y: list @ N] :
      ( ( rev @ ( suc @ N ) @ ( cons @ N @ X @ Y ) )
      = ( app @ N @ ( suc @ zero ) @ ( rev @ N @ Y ) @ ( cons @ zero @ X @ nil ) ) ) ).

thf(plus_com,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ N @ M )
      = ( plus @ M @ N ) ) ).

thf(plus1r,axiom,
    ! [N: nat] :
      ( ( suc @ N )
      = ( plus @ N @ ( suc @ zero ) ) ) ).

thf(list_app_nil,axiom,
    ! [N: nat,L: list @ N] :
      ( ( app @ N @ zero @ L @ nil )
      = L ) ).

thf(list_rev_invol_step1,axiom,
    ! [N: nat,L: list @ N] :
      ( ( rev @ N @ ( rev @ N @ L ) )
      = ( rev @ ( plus @ N @ zero ) @ ( app @ N @ zero @ ( rev @ N @ L ) @ nil ) ) ) ).

thf(list_rev_invol_step2,axiom,
    ! [N: nat,L: list @ N] :
      ( ( ( rev @ N @ ( rev @ N @ L ) )
        = ( rev @ ( plus @ N @ zero ) @ ( app @ N @ zero @ ( rev @ N @ L ) @ nil ) ) )
     => ( ( rev @ N @ ( rev @ N @ L ) )
        = ( app @ zero @ N @ ( rev @ zero @ nil ) @ L ) ) ) ).

thf(list_rev_invol_step3,axiom,
    ! [N: nat,L: list @ N] :
      ( ( ( rev @ N @ ( rev @ N @ L ) )
        = ( app @ zero @ N @ ( rev @ zero @ nil ) @ L ) )
     => ( ( rev @ N @ ( rev @ N @ L ) )
        = ( app @ zero @ N @ nil @ L ) ) ) ).

thf(list_rev_invol_step4,axiom,
    ! [N: nat,L: list @ N] :
      ( ( ( rev @ N @ ( rev @ N @ L ) )
        = ( app @ zero @ N @ nil @ L ) )
     => ( ( rev @ N @ ( rev @ N @ L ) )
        = L ) ) ).

thf(list_rev_invol,conjecture,
    ! [N: nat,L: list @ N] :
      ( ( rev @ N @ ( rev @ N @ L ) )
      = L ) ).
%------------------------------------------------------------------------------
