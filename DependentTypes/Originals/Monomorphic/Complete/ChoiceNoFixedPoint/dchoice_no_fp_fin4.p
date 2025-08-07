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
% Syntax   : Number of formulae    :   13 (   4 unt;   7 typ;   1 def)
%            Number of atoms       :    9 (   8 equ;   0 cnn)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :   53 (   3   ~;   1   |;   0   &;  48   @)
%                                         (   0 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    5 (   3 avg)
%            Number of types       :    1 (   1 usr)
%            Number of type decls  :    7 (   0 !>P;   2 !>D)
%            Number of type conns  :    4 (   4   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    8 (   6 usr;   2 con; 0-2 aty)
%            Number of variables   :   14 (   1   ^;   9   !;   1   ?;  14   :)
%                                         (   2  !>;   0  ?*;   0  @-;   1  @+)
% SPC      : TH0_THM_NEQ_ARI

% Comments :
%------------------------------------------------------------------------------
thf(nat_type, type, nat: $tType).
thf(zero_type,type, zero: nat).
thf(suc_type, type, suc: nat > nat).

thf(fin_type, type, fin: nat > $tType).
thf(f1_type, type, f1: !>[A:nat]: (fin @ (suc @ A))).
thf(fs_type, type, fs: !>[A:nat]: ((fin @ A) > (fin @ (suc @ A)))).

thf(f1notfs, axiom, (! [N:nat] : (! [X:(fin @ N)] : ((f1 @ N) != (fs @ N @ X))))).
thf(fs_inj, axiom, (! [N:nat] : (! [X:(fin @ N)] : (! [Y:(fin @ N)] : (((fs @ N @ X) = (fs @ N @ Y)) => (X = Y)))))).
thf(finZ_inv, axiom, (! [X:(fin @ zero)] : $false)).
thf(finS_inv, axiom, (! [N:nat] : (! [X:(fin @ (suc @ N))] : ((X = (f1 @ N)) | (? [Y:(fin @ N)] : (X = (fs @ N @ Y))))))).

thf(nofp_type, type, (nofp : ((fin @ (suc @ (suc @ (suc @ (suc @ zero))))) > (fin @ (suc @ (suc @ (suc @ (suc @ zero)))))))).
thf(nofp_def, definition, (nofp = (^ [X: (fin @ (suc @ (suc @ (suc @ (suc @ zero)))))] : (@+ [Y: (fin @ (suc @ (suc @ (suc @ (suc @ zero)))))] : (X != Y))))).

thf(dchoice_nofp_fin4, conjecture, (! [X:(fin @ (suc @ (suc @ (suc @ (suc @ zero)))))] : ((nofp @ X) != X))).
%------------------------------------------------------------------------------
