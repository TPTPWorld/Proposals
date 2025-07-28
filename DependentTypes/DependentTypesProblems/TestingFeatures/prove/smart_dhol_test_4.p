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
% Syntax   : Number of formulae    :    7 (   2 unt;   5 typ;   0 def)
%            Number of atoms       :    2 (   0 equ;   0 cnn)
%            Maximal formula atoms :    1 (   1 avg)
%            Number of connectives :    8 (   1   ~;   0   |;   0   &;   7   @)
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    6 (   5 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    5 (   0 !>P;   1 !>D)
%            Number of type conns  :    2 (   2   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    4 (   4 usr;   2 con; 0-2 aty)
%            Number of variables   :    3 (   0   ^;   2   !;   0   ?;   3   :)
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
    ! [X: a, F: f @ X] : ( ~ (pred @ X @ F ) ) ).

thf(elem1_type,type,
    elem1: a ).

thf(g_type,type,
    g: (f @ elem1) ).

thf(conj,conjecture,
    ( pred @ elem1 @ g ) ).
%------------------------------------------------------------------------------
