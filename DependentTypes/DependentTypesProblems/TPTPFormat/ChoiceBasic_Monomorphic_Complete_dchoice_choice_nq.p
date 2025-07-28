%------------------------------------------------------------------------------
% File     : TBA000^1 : TPTP v10.0.0. Released v10.0.0.
% Domain   : Syntactic
% Problem  : At least two distinct elements in (fin 2)
% Version  : Especial.
% English  : There are at least two distinct elements in (fin 2) and choice 
%            can indentify them.

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ChoiceBasic/dchoice_choice_nq.p [Rot25]

% Status   : Theorem
% Rating   : ? v10.0.0
% Syntax   : Number of formulae    :    8 (   1 unt;   6 typ;   0 def)
%            Number of atoms       :    5 (   5 equ;   0 cnn)
%            Maximal formula atoms :    2 (   2 avg)
%            Number of connectives :   33 (   5   ~;   0   |;   1   &;  27   @)
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    4 (   4 avg)
%            Number of types       :    1 (   1 usr)
%            Number of type decls  :    6 (   0 !>P;   2 !>D)
%            Number of type conns  :    3 (   3   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    6 (   5 usr;   1 con; 0-2 aty)
%            Number of variables   :    6 (   0   ^;   2   !;   0   ?;   6   :)
%                                         (   2  !>;   0  ?*;   0  @-;   2  @+)
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

thf(zerf_neq_sucf,axiom,
    ! [N: nat,X: fin @ N] :
      ( ( zerf @ N )
     != ( sucf @ N @ X ) ) ).

thf(dchoiceex5,conjecture,
    ( ( ( @+[X: fin @ ( suc @ ( suc @ zer ) )] :
            ( X
           != ( zerf @ ( suc @ zer ) ) ) )
     != ( zerf @ ( suc @ zer ) ) )
    & ( ( @+[X: fin @ ( suc @ ( suc @ zer ) )] :
            ( X
           != ( sucf @ ( suc @ zer ) @ ( zerf @ zer ) ) ) )
     != ( sucf @ ( suc @ zer ) @ ( zerf @ zer ) ) ) ) ).

%------------------------------------------------------------------------------
