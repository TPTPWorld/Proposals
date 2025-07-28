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
% Syntax   : Number of formulae    :    8 (   2 unt;   5 typ;   0 def)
%            Number of atoms       :    4 (   0 equ;   0 cnn)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :   11 (   1   ~;   0   |;   1   &;   9   @)
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    4 (   4 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    5 (   0 !>P;   1 !>D)
%            Number of type conns  :    2 (   2   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    4 (   4 usr;   1 con; 0-1 aty)
%            Number of variables   :    4 (   0   ^;   2   !;   1   ?;   4   :)
%                                         (   1  !>;   0  ?*;   0  @-;   0  @+)
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

thf(fun1_type,type,
    fun1: ( m @ elem1 ) > $o ).

thf(fun2_type,type,
    fun2: ( m @ elem1 ) > $o ).

thf(nfun1ex,axiom,
    ? [X: m @ elem1] :
      ~ ( fun1 @ X ) ).

thf(fun2all,axiom,
    ! [X: m @ elem1] : ( fun2 @ X ) ).

thf(fun1andfun2ex,conjecture,
    ! [X: m @ elem1] :
      ( ( fun1 @ X )
      & ( fun2 @ X ) ) ).
%------------------------------------------------------------------------------
