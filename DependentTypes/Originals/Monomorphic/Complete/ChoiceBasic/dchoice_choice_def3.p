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
% Syntax   : Number of formulae    :    5 (   1 unt;   3 typ;   0 def)
%            Number of atoms       :    3 (   0 equ;   0 cnn)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :    9 (   0   ~;   0   |;   0   &;   9   @)
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    6 (   6 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    3 (   0 !>P;   1 !>D)
%            Number of type conns  :    2 (   2   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    2 (   2 usr;   0 con; 1-2 aty)
%            Number of variables   :    5 (   0   ^;   2   !;   1   ?;   5   :)
%                                         (   1  !>;   0  ?*;   0  @-;   1  @+)
% SPC      : TH0_THM_NEQ_ARI

% Comments :
%------------------------------------------------------------------------------
thf(a_type, type, (a : $tType)).
thf(b_type, type, (b : (a > $tType))).

thf(p_type, type, (p : (!> [A:a] : ((b @ A) > $o)))).

thf(pax, axiom, (! [A:a] : (? [B:(b @ A)] : ((p @ A @ B))))). 

thf(conj, conjecture, (! [A:a] : (p @ A @ (@+ [X: (b @ A)] : (p @ A @ X) )))).
%------------------------------------------------------------------------------
