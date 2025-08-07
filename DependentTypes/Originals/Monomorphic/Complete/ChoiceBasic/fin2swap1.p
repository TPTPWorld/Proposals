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
% Syntax   : Number of formulae    :   12 (   3 unt;   8 typ;   1 def)
%            Number of atoms       :    4 (   4 equ;   0 cnn)
%            Maximal formula atoms :    1 (   1 avg)
%            Number of connectives :   45 (   2   ~;   0   |;   0   &;  41   @)
%                                         (   0 <=>;   2  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    9 (   4 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    8 (   0 !>P;   3 !>D)
%            Number of type conns  :    7 (   7   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    8 (   7 usr;   1 con; 0-2 aty)
%            Number of variables   :   14 (   1   ^;   9   !;   0   ?;  14   :)
%                                         (   3  !>;   0  ?*;   0  @-;   1  @+)
% SPC      : TH0_THM_NEQ_ARI

% Comments :
%------------------------------------------------------------------------------
thf(nat_type, type, nat: $tType).
thf(zero_type,type, zero: nat).
thf(suc_type, type, suc: nat > nat).
thf(plus_type,type, plus: nat > nat > nat).

thf(plus_suc, axiom, (![X:nat,Y:nat]: ((plus @ (suc @ X) @ Y) = (suc @ (plus @ X @ Y))))).

thf(fin_type, type, fin: nat > $tType).
thf(f1_type, type, f1: !>[A:nat]: (fin @ (suc @ A))).
thf(fs_type, type, fs: !>[A:nat]: ((fin @ A) > (fin @ (suc @ A)))).

thf(fin_elim, axiom,
    ![P : (!>[N : nat]: ((fin @ (suc @ N)) > $o))]:
      (![N:nat]: (P @ N @ (f1 @ N))
    => (![N:nat]: ![F:(fin @ N)]: (P @ N @ (fs @ N @ F))
     => ![N:nat]: ![F:(fin @ (suc @ N))]: (P @ N @ F)))).

thf(swap_type, type, (swap : ((fin @ (suc @ (suc @ zero))) > (fin @ (suc @ (suc @ zero)))))).
thf(swap_def, definition, (swap = (^ [X: (fin @ (suc @ (suc @ zero)))] : (@+ [Y: (fin @ (suc @ (suc @ zero)))] : (X != Y))))).
    
thf(fin2swap1, conjecture, (! [X:(fin @ (suc @ (suc @ zero)))] : ((swap @ X) != X))).
%------------------------------------------------------------------------------
