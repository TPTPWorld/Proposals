%------------------------------------------------------------------------------
% File     : TBA000^1 : TPTP v10.0.0. Released v10.0.0.
% Domain   : Data Structures
% Problem  : List involution lemma, induction step 1
% Version  : Especial.
% English  : List involution lemma. The proof is by induction with a separate
%            problem file for the base and step case (with multiple subcases)
%            as well as the correct instantiation of the induction axiom for
%            lists. The main file uses the conjectures of the other files as
%            lemmas in order to prove the final result. To simplify proof
%            search, the axioms in each problem file have been preselected. 
%            For the actual induction proof, it is sufficient to consider the 
%            "step" problem files. 

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ListReversalInvolutionLemma/list-rev-invol-lem-indstep1.p [Rot25]

% Status   : Theorem
% Rating   : ? v10.0.0
% Syntax   : Number of formulae    :   25 (  12 unt;  10 typ;   0 def)
%            Number of atoms       :   16 (  16 equ;   0 cnn)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :  176 (   3   ~;   0   |;   0   &; 168   @)
%                                         (   0 <=>;   5  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    8 (   4 avg)
%            Number of types       :    3 (   2 usr)
%            Number of type decls  :   10 (   0 !>P;   3 !>D)
%            Number of type conns  :   10 (  10   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    9 (   8 usr;   2 con; 0-4 aty)
%            Number of variables   :   43 (   0   ^;  39   !;   0   ?;  43   :)
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

thf(list_app_assoc,axiom,
    ! [M: nat,L: list @ M,M2: nat,L2: list @ M2,M3: nat,L3: list @ M3] :
      ( ( app @ M @ ( plus @ M2 @ M3 ) @ L @ ( app @ M2 @ M3 @ L2 @ L3 ) )
      = ( app @ ( plus @ M @ M2 ) @ M3 @ ( app @ M @ M2 @ L @ L2 ) @ L3 ) ) ).

thf(list_rev_invol_lem_indstep1,conjecture,
    ! [N: nat,X: elem,L: list @ N] :
      ( ! [M2: nat,L2: list @ M2] :
          ( ( rev @ ( plus @ N @ M2 ) @ ( app @ N @ M2 @ ( rev @ N @ L ) @ L2 ) )
          = ( app @ M2 @ N @ ( rev @ M2 @ L2 ) @ L ) )
     => ! [M2: nat,L2: list @ M2] :
          ( ( rev @ ( plus @ ( suc @ N ) @ M2 ) @ ( app @ ( suc @ N ) @ M2 @ ( rev @ ( suc @ N ) @ ( cons @ N @ X @ L ) ) @ L2 ) )
          = ( rev @ ( plus @ ( suc @ N ) @ M2 ) @ ( app @ ( plus @ N @ ( suc @ zero ) ) @ M2 @ ( app @ N @ ( suc @ zero ) @ ( rev @ N @ L ) @ ( cons @ zero @ X @ nil ) ) @ L2 ) ) ) ) ).

%------------------------------------------------------------------------------
