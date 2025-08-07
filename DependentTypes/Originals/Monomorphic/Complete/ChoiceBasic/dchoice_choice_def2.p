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
% SPC      : TH0_THM_NEQ_ARI

% Comments :
%------------------------------------------------------------------------------
thf(nat_type,type, (nat : $tType)).
thf(zer_type,type, (zer : nat)).
thf(suc_type,type, (suc : (nat > nat))).
thf(fin_type,type, (fin : (nat > $tType))).
thf(zerf_type,type, (zerf : (!> [N:nat] : (fin @ (suc @ N))))).
thf(sucf_type,type, (sucf : (!> [N:nat] : ((fin @ N) > (fin @ (suc @ N)))))).

thf(zer_not_suc, axiom, (! [N:nat] : (zer != (suc @ N)))).

thf(p_type,type, (p : (!> [N:nat] : ((fin @ N) > $o)))).
thf(pax,axiom, (! [N:nat] : (p @ (suc @ N) @ (zerf @ N)))).

thf(dchoiceex2,conjecture, (! [N:nat] : (p @ (suc @ N) @ (@+ [X: (fin @ (suc @ N))] : (p @ (suc @ N) @ X))))).


%------------------------------------------------------------------------------
