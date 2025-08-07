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
% Syntax   : Number of formulae    :    6 (   2 unt;   4 typ;   0 def)
%            Number of atoms       :    2 (   0 equ;   0 cnn)
%            Maximal formula atoms :    1 (   1 avg)
%            Number of connectives :    7 (   0   ~;   0   |;   0   &;   7   @)
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    5 (   5 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    4 (   0 !>P;   1 !>D)
%            Number of type conns  :    2 (   2   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    3 (   3 usr;   1 con; 0-2 aty)
%            Number of variables   :    4 (   0   ^;   1   !;   2   ?;   4   :)
%                                         (   1  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : TH0_THM_NEQ_ARI

% Comments :
%------------------------------------------------------------------------------
thf(a_type,type,
    a: $tType ).

thf(f_type,type,
    f: a > $tType ).

thf(pred_type,type,
    pred:
    !>[X: a] : ( (f @ X) > $o ) ).

thf(predEmpty,axiom,
    ? [X: a, F: f @ X] : (pred @ X @ F ) ).

thf(elem1_type,type,
    elem1: a ).

thf(conj,conjecture,
    ! [F: f @ elem1] : ( pred @ elem1 @ F ) ).
%------------------------------------------------------------------------------
