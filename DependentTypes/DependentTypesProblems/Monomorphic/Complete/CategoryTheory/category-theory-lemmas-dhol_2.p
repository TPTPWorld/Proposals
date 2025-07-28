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
% Syntax   : Number of formulae    :    8 (   3 unt;   4 typ;   0 def)
%            Number of atoms       :    8 (   8 equ;   0 cnn)
%            Maximal formula atoms :    5 (   2 avg)
%            Number of connectives :   66 (   0   ~;   0   |;   3   &;  62   @)
%                                         (   0 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   10 (   7 avg)
%            Number of types       :    1 (   1 usr)
%            Number of type decls  :    4 (   0 !>P;   2 !>D)
%            Number of type conns  :    4 (   4   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    4 (   3 usr;   0 con; 1-5 aty)
%            Number of variables   :   22 (   0   ^;  18   !;   0   ?;  22   :)
%                                         (   4  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : TH0_THM_NEQ_ARI

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
    ! [X: obj,Y: obj,Z: obj,F: mor @ X @ Y,G: mor @ Y @ Z] :
      ( ( ( X = Y )
        & ( Y = Z )
        & ( F
          = ( id @ X ) )
        & ( G
          = ( id @ Y ) ) )
     => ( ( comp @ X @ Y @ Z @ F @ G )
        = ( id @ Z ) ) ) ).

%------------------------------------------------------------------------------
