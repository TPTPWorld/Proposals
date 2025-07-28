%------------------------------------------------------------------------------
% File     : TBA000^1 : TPTP v10.0.0. Released v10.0.0.
% Domain   : Data Structures
% Problem  : Nil is a right-neutral element of app polymorphic, step case
% Version  : Especial.
% English  : Nil is a right-neutral element of app for polymorphic fixed-length
%            lists. The proof is by induction with a separate problem file for
%            the base and step case as well as the correct instantiation of the
%            induction axiom for lists. The main file uses the conjectures of
%            the other files as lemmas in order to prove the final result. To
%            simplify proof search, the lemmas in the problem file for the
%            induction step have been preselected.

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ListAppNil/list-app-nil-indstep.p [Rot25]

% Status   : Theorem
% Rating   : ? v10.0.0
% Syntax   : Number of formulae    :   12 (   3 unt;   8 typ;   0 def)
%            Number of atoms       :    5 (   5 equ;   0 cnn)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :   72 (   0   ~;   0   |;   0   &;  71   @)
%                                         (   0 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   5 avg)
%            Number of types       :    1 (   1 usr)
%            Number of type decls  :    8 (   3 !>P;   2 !>D)
%            Number of type conns  :    9 (   9   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    8 (   7 usr;   1 con; 0-5 aty)
%            Number of variables   :   19 (   0   ^;  13   !;   0   ?;  19   :)
%                                         (   6  !>;   0  ?*;   0  @-;   0  @+)
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

thf(ax2,axiom,
    ! [N: nat,M: nat] :
      ( ( plus @ ( suc @ N ) @ M )
      = ( suc @ ( plus @ N @ M ) ) ) ).

thf(ax4,axiom,
    ! [A: $tType,N: nat,M: nat,X: A,Y: list @ A @ N,Z: list @ A @ M] :
      ( ( app @ A @ ( suc @ N ) @ M @ ( cons @ A @ N @ X @ Y ) @ Z )
      = ( cons @ A @ ( plus @ N @ M ) @ X @ ( app @ A @ N @ M @ Y @ Z ) ) ) ).

thf(plus_zero_r,axiom,
    ! [M: nat] :
      ( ( plus @ M @ zero )
      = M ) ).

thf(list_app_nil_indstep,conjecture,
    ! [A: $tType,N: nat,X: A,L: list @ A @ N] :
      ( ( ( app @ A @ N @ zero @ L @ ( nil @ A ) )
        = L )
     => ( ( app @ A @ ( suc @ N ) @ zero @ ( cons @ A @ N @ X @ L ) @ ( nil @ A ) )
        = ( cons @ A @ N @ X @ L ) ) ) ).

%------------------------------------------------------------------------------
