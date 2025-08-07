%------------------------------------------------------------------------------
% File     : DAT340^1 : TPTP v9.2.0. Released v9.2.0.
% Domain   : Data Structures
% Problem  : Nil is a right-neutral element of app, step case
% Version  : Especial.
% English  : Nil is a right-neutral element of app. The proof is by induction
%            with a separate problem file for the base and step case as well as
%            the correct instantiation of the induction axiom for lists. The 
%            main file uses the conjectures of the other files as lemmas in
%            order to prove the final result. To simplify proof search, the
%            lemmas in the problem file for the induction step have been
%            preselected.

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ListAppNil/list-app-nil-indstep.p [Rot25]

% Status   : Theorem
% Rating   : ? v9.2.0
% Syntax   : Number of formulae    :   13 (   3 unt;   9 typ;   0 def)
%            Number of atoms       :    5 (   5 equ;   0 cnn)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :   53 (   0   ~;   0   |;   0   &;  52   @)
%                                         (   0 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    6 (   4 avg)
%            Number of types       :    2 (   2 usr)
%            Number of type decls  :    9 (   0 !>P;   2 !>D)
%            Number of type conns  :    8 (   8   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    8 (   7 usr;   2 con; 0-4 aty)
%            Number of variables   :   14 (   0   ^;  11   !;   0   ?;  14   :)
%                                         (   3  !>;   0  ?*;   0  @-;   0  @+)
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

thf(list_app_nil_indstep,conjecture,
    ! [N: nat,X: elem,L: list @ N] :
      ( ( ( app @ N @ zero @ L @ nil )
        = L )
     => ( ( app @ ( suc @ N ) @ zero @ ( cons @ N @ X @ L ) @ nil )
        = ( cons @ N @ X @ L ) ) ) ).

%------------------------------------------------------------------------------
