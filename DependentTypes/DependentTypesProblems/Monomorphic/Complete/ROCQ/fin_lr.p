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
% Syntax   : Number of formulae    :   18 (   7 unt;   9 typ;   0 def)
%            Number of atoms       :    7 (   7 equ;   0 cnn)
%            Maximal formula atoms :    1 (   0 avg)
%            Number of connectives :  104 (   0   ~;   0   |;   2   &;  99   @)
%                                         (   0 <=>;   3  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   11 (   5 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :    9 (   0 !>P;   6 !>D)
%            Number of type conns  :    9 (   9   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    9 (   8 usr;   1 con; 0-3 aty)
%            Number of variables   :   37 (   0   ^;  29   !;   0   ?;  37   :)
%                                         (   8  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : TH0_THM_NEQ_ARI

% Comments :
%------------------------------------------------------------------------------
thf(nat_type, type, nat: $tType).
thf(zero_type,type, zero: nat).
thf(suc_type, type, suc: nat > nat).
thf(plus_type,type, plus: nat > nat > nat).

thf(plus_suc, axiom, ![X:nat, Y:nat]: ((plus @ (suc @ X) @ Y) = (suc @ (plus @ X @ Y)))).
thf(plus_zero, axiom, ![X:nat]: (plus @ X @ zero) = X).

thf(fin_type, type, fin: nat > $tType).
thf(f1_type, type, f1: !>[A:nat]: (fin @ (suc @ A))).
thf(fs_type, type, fs: !>[A:nat]: ((fin @ A) > (fin @ (suc @ A)))).

thf(fin_case, axiom,
    ![P : (!>[N:nat]: ((fin @ (suc @ N)) > $o))]:
    (((![N:nat]: (P @ N @ (f1 @ N)))
    & (![N:nat]: (![F:(fin @ N)]: (P @ N @ (fs @ N @ F)))))
    => (![N:nat]: (![F:(fin @ (suc @ N))]: (P @ N @ F))))).

thf(fin_rec, axiom,
    ![P : (!>[N:nat]: ((fin @ (suc @ N)) > $o))]:
    (((![N:nat]: (P @ N @ (f1 @ N)))
    & (![N:nat]: (![F:(fin @ (suc @ N))]: ((P @ N @ F) => (P @ (suc @ N) @ (fs @ (suc @ N) @ F))))))
    => (![N:nat]: (![F:(fin @ (suc @ N))]: (P @ N @ F))))).

thf(l_type, type, l: !>[A:nat,B:nat]: ((fin @ A) > (fin @ (plus @ A @ B)))).

thf(l_f1, axiom, ![M:nat,N:nat]: ((l @ (suc @ M) @ N @ (f1 @ M)) = (f1 @ (plus @ M @ N)))).
thf(l_fs, axiom, ![M:nat,N:nat]: ![P:(fin @ M)]: ((l @ M @ N @ (fs @ M @ P)) = (fs @ (plus @ M @ N) @ (l @ M @ N @ P)))).

thf(r_type, type, r: !>[A:nat,B:nat]: ((fin @ A) > (fin @ (plus @ A @ B)))).

thf(r_0, axiom, ![M:nat]: (![F:(fin @ M)]: (r @ M @ zero @ F) = F)).
thf(r_s, axiom, ![M:nat, N:nat]: (![F:(fin @ M)]: ((r @ M @ (suc @ N) @ F) = (fs @ (plus @ M @ N) @ (r @ M @ N @ F))))).

thf(l_r_neq, conjecture, ![M:nat, N:nat]: (![P:(fin @ N), Q:(fin @ M)]: ((l @ N @ M @ P) = (r @ M @ N @ Q)))).
%------------------------------------------------------------------------------
