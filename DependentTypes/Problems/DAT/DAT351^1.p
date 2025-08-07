%------------------------------------------------------------------------------
% File     : DAT351^1 : TPTP v9.2.0. Released v9.2.0.
% Domain   : Data Structures
% Problem  : Corollary of the associativity of append, step 3
% Version  : Especial.
% English  : Corollary of the associativity of append. The proof is split into
%            smaller steps. To simplify proof search, the axioms in each
%            problem file have been preselected.

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ListAppAssocM1/list-app-assoc-m1-step3.p [Rot25]

% Status   : Theorem
% Rating   : ? v9.2.0
% Syntax   : Number of formulae    :   22 (   9 unt;  10 typ;   0 def)
%            Number of atoms       :   13 (  13 equ;   0 cnn)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :  137 (   3   ~;   0   |;   0   &; 129   @)
%                                         (   0 <=>;   5  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    8 (   4 avg)
%            Number of types       :    3 (   2 usr)
%            Number of type decls  :   10 (   0 !>P;   3 !>D)
%            Number of type conns  :   10 (  10   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    9 (   8 usr;   2 con; 0-4 aty)
%            Number of variables   :   32 (   0   ^;  28   !;   0   ?;  32   :)
%                                         (   4  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : DH0_THM_EQU_NAR

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

thf(plus1ra,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ ( plus @ N @ ( suc @ zero ) ) @ M )
      = ( plus @ N @ ( suc @ M ) ) ) ).

thf(list_app_assoc_m1_step3,conjecture,
    ! [M: nat,L: list @ M,X: elem,M3: nat,L3: list @ M3] :
      ( ( ( app @ ( plus @ M @ ( suc @ zero ) ) @ M3 @ ( app @ M @ ( suc @ zero ) @ L @ ( cons @ zero @ X @ nil ) ) @ L3 )
        = ( app @ M @ ( suc @ M3 ) @ L @ ( app @ ( suc @ zero ) @ M3 @ ( cons @ zero @ X @ nil ) @ L3 ) ) )
     => ( ( app @ ( plus @ M @ ( suc @ zero ) ) @ M3 @ ( app @ M @ ( suc @ zero ) @ L @ ( cons @ zero @ X @ nil ) ) @ L3 )
        = ( app @ M @ ( suc @ M3 ) @ L @ ( cons @ M3 @ X @ ( app @ zero @ M3 @ nil @ L3 ) ) ) ) ) ).

%------------------------------------------------------------------------------
