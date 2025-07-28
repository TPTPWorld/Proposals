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
% Syntax   : Number of formulae    :    7 (   0 unt;   6 typ;   0 def)
%            Number of atoms       :    4 (   4 equ;   0 cnn)
%            Maximal formula atoms :    2 (   4 avg)
%            Number of connectives :   24 (   0   ~;   0   |;   1   &;  23   @)
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    2 (   2 avg)
%            Number of types       :    1 (   1 usr)
%            Number of type decls  :    6 (   0 !>P;   2 !>D)
%            Number of type conns  :    3 (   3   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    6 (   5 usr;   1 con; 0-2 aty)
%            Number of variables   :    4 (   0   ^;   0   !;   0   ?;   4   :)
%                                         (   2  !>;   0  ?*;   0  @-;   2  @+)
% SPC      : TH0_THM_NEQ_ARI

% Comments :
%------------------------------------------------------------------------------
thf(nat_type,type, (nat : $tType)).
thf(zer_type,type, (zer : nat)).
thf(suc_type,type, (suc : (nat > nat))).
thf(fin_type,type, (fin : (nat > $tType))).
thf(zerf_type,type, (zerf : (!> [N:nat] : (fin @ (suc @ N))))).
thf(sucf_type,type, (sucf : (!> [N:nat] : ((fin @ N) > (fin @ (suc @ N)))))).

thf(dchoiceex4,conjecture, (((@+ [X: (fin @ (suc @ (suc @ zer)))] : (X = (zerf @ (suc @ zer)))) = (zerf @ (suc @ zer))) & ((@+ [X: (fin @ (suc @ (suc @ zer)))] : (X = (sucf @ (suc @ zer) @ (zerf @ zer)))) = (sucf @ (suc @ zer) @ (zerf @ zer))))).



%------------------------------------------------------------------------------
