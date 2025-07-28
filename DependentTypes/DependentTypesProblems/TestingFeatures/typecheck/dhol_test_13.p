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
% Syntax   : Number of formulae    :    9 (   1 unt;   8 typ;   0 def)
%            Number of atoms       :    2 (   1 equ;   0 cnn)
%            Maximal formula atoms :    1 (   2 avg)
%            Number of connectives :    7 (   0   ~;   0   |;   0   &;   7   @)
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    1 (   1 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    8 (   0 !>P;   3 !>D)
%            Number of type conns  :    1 (   1   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    8 (   7 usr;   4 con; 0-2 aty)
%            Number of variables   :    5 (   1   ^;   1   !;   0   ?;   5   :)
%                                         (   3  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : TH0_THM_NEQ_ARI

% Comments :
%------------------------------------------------------------------------------
thf(a_type,type,
    a: $tType ).

thf(m_type,type,
    m: 
      !>[X: a] : $tType ).

thf(elem1_type,type,
    elem1: a ).

thf(elem2_type,type,
    elem2: a ).

thf(fun1_type,type,
    fun1: 
      !>[X: m @ elem1] : $o ).

thf(fun2_type,type,
    fun2: 
      !>[X: m @ elem2] : $o ).

thf(b_type,type,
    b: m @ elem1 ).

thf(c_type,type,
    c: m @ elem1 ).

thf(fun1eqall,axiom,
    ( fun1
    = ( ^ [Y: m @ elem1] :
        ! [P: ( m @ elem1 ) > $o] : ( P @ Y ) ) ) ).

%------------------------------------------------------------------------------
