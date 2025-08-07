%------------------------------------------------------------------------------
% File     : SYP003^1 : TPTP v9.2.0. Released v9.2.0.
% Domain   : Syntactic
% Problem  : Axiom of (higher-order) choice for arbitrary types.
% Version  : Especial.
% English  :

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ChoiceBasic/dskolem1.p [Rot25]

% Status   : Theorem
% Rating   : ? v9.2.0
% Syntax   : Number of formulae    :    4 (   0 unt;   3 typ;   0 def)
%            Number of atoms       :    2 (   0 equ;   0 cnn)
%            Maximal formula atoms :    2 (   2 avg)
%            Number of connectives :    9 (   0   ~;   0   |;   0   &;   8   @)
%                                         (   0 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    6 (   6 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    3 (   0 !>P;   2 !>D)
%            Number of type conns  :    2 (   2   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    2 (   2 usr;   0 con; 1-2 aty)
%            Number of variables   :    6 (   0   ^;   2   !;   2   ?;   6   :)
%                                         (   2  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : DH0_THM_NEQ_NAR

% Comments :
%------------------------------------------------------------------------------
thf(a_type,type,
    a: $tType ).

thf(b_type,type,
    b: a > $tType ).

thf(p_type,type,
    p: 
      !>[X: a] : ( ( b @ X ) > $o ) ).

thf(dskolem1,conjecture,
    ( ! [X: a] :
      ? [Y: b @ X] : ( p @ X @ Y )
   => ? [F: !>[N: a] : ( b @ N )] :
      ! [X: a] : ( p @ X @ ( F @ X ) ) ) ).

%------------------------------------------------------------------------------
