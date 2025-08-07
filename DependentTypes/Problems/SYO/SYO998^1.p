%------------------------------------------------------------------------------
% File     : SYO998^1 : TPTP v9.2.0. Released v9.2.0.
% Domain   : Syntactic
% Problem  : Definition of choice for finite sets of size N
% Version  : Especial.
% English  : Given there is an element x of type (fin N) that is in the 
%            predicate p, the choice operator can find an element of fin N
%            that makes said predicate true.

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ChoiceBasic/dchoice_choice_def2.p [Rot25]

% Status   : Theorem
% Rating   : ? v9.2.0
% Syntax   : Number of formulae    :   10 (   2 unt;   7 typ;   0 def)
%            Number of atoms       :    4 (   1 equ;   0 cnn)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :   20 (   1   ~;   0   |;   0   &;  19   @)
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   5 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    7 (   0 !>P;   3 !>D)
%            Number of type conns  :    4 (   4   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    7 (   6 usr;   1 con; 0-2 aty)
%            Number of variables   :    7 (   0   ^;   3   !;   0   ?;   7   :)
%                                         (   3  !>;   0  ?*;   0  @-;   1  @+)
% SPC      : DH0_THM_EQU_NAR

% Comments :
%------------------------------------------------------------------------------
thf(nat_type,type,
    nat: $tType ).

thf(zer_type,type,
    zer: nat ).

thf(suc_type,type,
    suc: nat > nat ).

thf(fin_type,type,
    fin: nat > $tType ).

thf(zerf_type,type,
    zerf: 
      !>[N: nat] : ( fin @ ( suc @ N ) ) ).

thf(sucf_type,type,
    sucf: 
      !>[N: nat] : ( ( fin @ N ) > ( fin @ ( suc @ N ) ) ) ).

thf(zer_not_suc,axiom,
    ! [N: nat] :
      ( zer
     != ( suc @ N ) ) ).

thf(p_type,type,
    p: 
      !>[N: nat] : ( ( fin @ N ) > $o ) ).

thf(pax,axiom,
    ! [N: nat] : ( p @ ( suc @ N ) @ ( zerf @ N ) ) ).

thf(dchoiceex2,conjecture,
    ! [N: nat] :
      ( p @ ( suc @ N )
      @ @+[X: fin @ ( suc @ N )] : ( p @ ( suc @ N ) @ X ) ) ).

%------------------------------------------------------------------------------
