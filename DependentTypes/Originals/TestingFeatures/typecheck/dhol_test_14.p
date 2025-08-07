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
% Syntax   : Number of formulae    :   12 (   3 unt;   9 typ;   0 def)
%            Number of atoms       :    3 (   3 equ;   0 cnn)
%            Maximal formula atoms :    1 (   1 avg)
%            Number of connectives :   16 (   0   ~;   0   |;   0   &;  16   @)
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    2 (   1 avg)
%            Number of types       :    1 (   1 usr)
%            Number of type decls  :    9 (   0 !>P;   5 !>D)
%            Number of type conns  :    0 (   0   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    9 (   8 usr;   3 con; 0-2 aty)
%            Number of variables   :    9 (   1   ^;   1   !;   0   ?;   9   :)
%                                         (   7  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : TH0_THM_NEQ_ARI

% Comments :
%------------------------------------------------------------------------------
thf(a_type,type,
    a: $tType ).

thf(m_type,type,
    m: 
      !>[X: a] : $tType ).

thf(n_type,type,
    n: 
      !>[X: a,Y: m @ X] : $tType ).

thf(elem1_type,type,
    elem1: a ).

thf(melem1_type,type,
    melem1: m @ elem1 ).

thf(nelem1_type,type,
    nelem1: n @ elem1 @ melem1 ).

thf(mfun_type,type,
    mfun: 
      !>[X: a] : ( m @ X ) ).

thf(fun1_type,type,
    fun1: 
      !>[X: a,Y: m @ X] : ( n @ X @ Y ) ).

thf(fun2_type,type,
    fun2: 
      !>[X: a] : ( n @ X @ ( mfun @ X ) ) ).

thf(ax1,axiom,
    ! [Y: m @ elem1] : ( melem1 = Y ) ).

thf(ax2,axiom,
    ( ( fun1 @ elem1 )
    = ( ^ [Y: m @ elem1] : nelem1 ) ) ).

thf(conj2,conjecture,
    ( ( fun1 @ elem1 @ melem1 )
    = nelem1 ) ).
%------------------------------------------------------------------------------
