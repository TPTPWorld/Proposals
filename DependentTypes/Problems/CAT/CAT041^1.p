%------------------------------------------------------------------------------
% File     : CAT041^1 : TPTP v9.2.0. Released v9.2.0.
% Domain   : Category Theory
% Problem  : Simple problem from category theory dhol_3
% Version  : Especial.
% English  :

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : CategoryTheory/category-theory-lemmas-dhol_3.p [Rot25]

% Status   : Theorem
% Rating   : ? v9.2.0
% Syntax   : Number of formulae    :    8 (   3 unt;   4 typ;   0 def)
%            Number of atoms       :    6 (   6 equ;   0 cnn)
%            Maximal formula atoms :    3 (   1 avg)
%            Number of connectives :   80 (   0   ~;   0   |;   1   &;  78   @)
%                                         (   0 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    8 (   6 avg)
%            Number of types       :    1 (   1 usr)
%            Number of type decls  :    4 (   0 !>P;   2 !>D)
%            Number of type conns  :    4 (   4   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    4 (   3 usr;   0 con; 1-5 aty)
%            Number of variables   :   23 (   0   ^;  19   !;   0   ?;  23   :)
%                                         (   4  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : DH0_THM_EQU_NAR

% Comments :
%------------------------------------------------------------------------------
thf(obj_type,type,
    obj: $tType ).

thf(mor_type,type,
    mor: obj > obj > $tType ).

thf(id_type,type,
    id: 
      !>[X: obj] : ( mor @ X @ X ) ).

thf(comp_type,type,
    comp: 
      !>[X: obj,Y: obj,Z: obj] : ( ( mor @ X @ Y ) > ( mor @ Y @ Z ) > ( mor @ X @ Z ) ) ).

thf(ax1,axiom,
    ! [X: obj,Y: obj,M: mor @ X @ Y] :
      ( ( comp @ X @ X @ Y @ ( id @ X ) @ M )
      = M ) ).

thf(ax2,axiom,
    ! [X: obj,Y: obj,M: mor @ X @ Y] :
      ( ( comp @ X @ Y @ Y @ M @ ( id @ Y ) )
      = M ) ).

thf(ax3,axiom,
    ! [X: obj,Y: obj,Z: obj,A: obj,F: mor @ X @ Y,G: mor @ Y @ Z,H: mor @ Z @ A] :
      ( ( comp @ X @ Y @ A @ F @ ( comp @ Y @ Z @ A @ G @ H ) )
      = ( comp @ X @ Z @ A @ ( comp @ X @ Y @ Z @ F @ G ) @ H ) ) ).

thf(conj,conjecture,
    ! [X: obj,Y: obj,Z: obj,F: mor @ X @ Y,G: mor @ Y @ X] :
      ( ( ( ( comp @ X @ Y @ X @ F @ G )
          = ( id @ X ) )
        & ( ( comp @ Y @ X @ Y @ G @ F )
          = ( id @ Y ) ) )
     => ! [H: mor @ X @ Z] :
          ( ( comp @ X @ Y @ Z @ F @ ( comp @ Y @ X @ Z @ G @ H ) )
          = H ) ) ).

%------------------------------------------------------------------------------
