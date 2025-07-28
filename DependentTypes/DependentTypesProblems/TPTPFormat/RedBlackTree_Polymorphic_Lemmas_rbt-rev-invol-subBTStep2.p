%------------------------------------------------------------------------------
% File     : TBA000^1 : TPTP v10.0.0. Released v10.0.0.
% Domain   : Data Structures
% Problem  : Reversal of a red-black-tree is an involution, RT substep 2
% Version  : Especial.
% English  :

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : RedBlackTree/rbt-rev-invol-subBTStep2.p [Rot25]

% Status   : Theorem
% Rating   : ? v10.0.0
% Syntax   : Number of formulae    :   15 (   3 unt;  11 typ;   0 def)
%            Number of atoms       :    6 (   6 equ;   0 cnn)
%            Maximal formula atoms :    3 (   1 avg)
%            Number of connectives :  162 (   0   ~;   0   |;   0   &; 160   @)
%                                         (   0 <=>;   2  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   10 (   7 avg)
%            Number of types       :    2 (   2 usr)
%            Number of type decls  :   11 (   4 !>P;   3 !>D)
%            Number of type conns  :   11 (  11   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :   10 (   9 usr;   3 con; 0-7 aty)
%            Number of variables   :   30 (   0   ^;  20   !;   0   ?;  30   :)
%                                         (  10  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : DH1_THM_EQU_NAR

% Comments :
%------------------------------------------------------------------------------
thf(color_type,type,
    color: $tType ).

thf(black_type,type,
    black: color ).

thf(red_type,type,
    red: color ).

thf(nat_type,type,
    nat: $tType ).

thf(zero_type,type,
    zero: nat ).

thf(suc_type,type,
    suc: nat > nat ).

thf(tree_type,type,
    tree: $tType > color > nat > $tType ).

thf(leaf_type,type,
    leaf: 
      !>[A: $tType] : ( tree @ A @ black @ zero ) ).

thf(redTree_type,type,
    rt: 
      !>[A: $tType,N: nat] : ( ( tree @ A @ black @ N ) > A > ( tree @ A @ black @ N ) > ( tree @ A @ red @ N ) ) ).

thf(blackTree_type,type,
    bt: 
      !>[A: $tType,N: nat,C1: color,C2: color] : ( ( tree @ A @ C1 @ N ) > A > ( tree @ A @ C2 @ N ) > ( tree @ A @ black @ ( suc @ N ) ) ) ).

thf(rbt_rev,type,
    rev: 
      !>[A: $tType,C: color,N: nat] : ( ( tree @ A @ C @ N ) > ( tree @ A @ C @ N ) ) ).

thf(rev_leaf,axiom,
    ! [A: $tType] :
      ( ( rev @ A @ black @ zero @ ( leaf @ A ) )
      = ( leaf @ A ) ) ).

thf(rev_bt,axiom,
    ! [A: $tType,X: A,N: nat,C1: color,C2: color,T1: tree @ A @ C1 @ N,T2: tree @ A @ C2 @ N] :
      ( ( rev @ A @ black @ ( suc @ N ) @ ( bt @ A @ N @ C1 @ C2 @ T1 @ X @ T2 ) )
      = ( bt @ A @ N @ C2 @ C1 @ ( rev @ A @ C2 @ N @ T2 ) @ X @ ( rev @ A @ C1 @ N @ T1 ) ) ) ).

thf(rev_rt,axiom,
    ! [A: $tType,X: A,N: nat,T1: tree @ A @ black @ N,T2: tree @ A @ black @ N] :
      ( ( rev @ A @ red @ N @ ( rt @ A @ N @ T1 @ X @ T2 ) )
      = ( rt @ A @ N @ ( rev @ A @ black @ N @ T2 ) @ X @ ( rev @ A @ black @ N @ T2 ) ) ) ).

%thf(first_step,axiom,
%    ! [A:$tType,X:A,N:nat,C1:color,C2:color,T1:tree @ A @ C1 @ N,T2:tree @ A @ C2 @ N] :
%    ( ( ( rev @ A @ C1 @ N @ ( rev @ A @ C1 @ N @ T1 ) )
%    = T1 )
%     => ( ( ( rev @ A @ C2 @ N @ ( rev @ A @ C2 @ N @ T2 ) )
%    = T2 )     
%    => ( ( ( rev @ A @ black @ (suc @ N) @ ( rev @ A @ black @ (suc @ N) @ ( bt @ A @ N @ C1 @ C2 @ T1 @ X @ T2 ) ) )
%    = ( rev @ A @ black @ (suc @ N) @ (bt @ A @ N @ C2 @ C1 @ (rev @ A @ C2 @ N @ T2) @ X @ (rev @ A @ C1 @ N @ T1) ) ) ) ) ) ) ).

thf(second_step,conjecture,
    ! [A: $tType,X: A,N: nat,C1: color,C2: color,T1: tree @ A @ C1 @ N,T2: tree @ A @ C2 @ N] :
      ( ( ( rev @ A @ C1 @ N @ ( rev @ A @ C1 @ N @ T1 ) )
        = T1 )
     => ( ( ( rev @ A @ C2 @ N @ ( rev @ A @ C2 @ N @ T2 ) )
          = T2 )
       => ( ( rev @ A @ black @ ( suc @ N ) @ ( bt @ A @ N @ C2 @ C1 @ ( rev @ A @ C2 @ N @ T2 ) @ X @ ( rev @ A @ C1 @ N @ T1 ) ) )
          = ( bt @ A @ N @ C1 @ C2 @ ( rev @ A @ C1 @ N @ ( rev @ A @ C1 @ N @ T1 ) ) @ X @ ( rev @ A @ C2 @ N @ ( rev @ A @ C2 @ N @ T2 ) ) ) ) ) ) ).

%------------------------------------------------------------------------------
