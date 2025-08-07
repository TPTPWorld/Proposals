%------------------------------------------------------------------------------
% File     : SYO999^1 : TPTP v9.2.0. Released v9.2.0.
% Domain   : Syntactic
% Problem  : Definition of choice for finite sets of anything size N
% Version  : Especial.
% English  : Given there is an element x of type (fin N) that is in the 
%            predicate p, the choice operator can find an element of fin N
%            that makes said predicate true.

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ChoiceBasic/dchoice_choice_def3.p [Rot25]

% Status   : Theorem
% Rating   : ? v9.2.0
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
% SPC      : DH0_THM_NEQ_NAR

% Comments :
%------------------------------------------------------------------------------
thf(a_type,type,
    a: $tType ).

thf(b_type,type,
    b: a > $tType ).

thf(p_type,type,
    p: 
      !>[A: a] : ( ( b @ A ) > $o ) ).

thf(pax,axiom,
    ! [A: a] :
    ? [B: b @ A] : ( p @ A @ B ) ).

thf(conj,conjecture,
    ! [A: a] :
      ( p @ A
      @ @+[X: b @ A] : ( p @ A @ X ) ) ).

%------------------------------------------------------------------------------
