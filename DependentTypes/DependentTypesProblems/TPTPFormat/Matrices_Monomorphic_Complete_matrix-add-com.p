%------------------------------------------------------------------------------
% File     : TBA000^1 : TPTP v10.0.0. Released v10.0.0.
% Domain   : Data Structures
% Problem  : Commutativity of matrix addition
% Version  : Especial.
% English  :

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : Matrices/matrix-add-com.p [Rot25]

% Status   : Theorem
% Rating   : ? v10.0.0
% Syntax   : Number of formulae    :   21 (   6 unt;  13 typ;   0 def)
%            Number of atoms       :    8 (   8 equ;   0 cnn)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :  113 (   3   ~;   0   |;   0   &; 106   @)
%                                         (   0 <=>;   4  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    8 (   5 avg)
%            Number of types       :    2 (   1 usr)
%            Number of type decls  :   13 (   0 !>P;   6 !>D)
%            Number of type conns  :   17 (  17   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :   13 (  12 usr;   2 con; 0-4 aty)
%            Number of variables   :   31 (   0   ^;  22   !;   0   ?;  31   :)
%                                         (   9  !>;   0  ?*;   0  @-;   0  @+)
% SPC      : DH0_THM_EQU_NAR

% Comments :
%------------------------------------------------------------------------------
thf(nat_type,type,
    nat: $tType ).

thf(zero_type,type,
    zero: nat ).

thf(suc_type,type,
    suc: nat > nat ).

thf(plus_type,type,
    plus: nat > nat > nat ).

thf(list_type,type,
    list: nat > $tType ).

thf(nil_type,type,
    nil: list @ zero ).

thf(cons_type,type,
    cons: 
      !>[N: nat] : ( nat > ( list @ N ) > ( list @ ( suc @ N ) ) ) ).

thf(app_type,type,
    app: 
      !>[N: nat,M: nat] : ( ( list @ N ) > ( list @ M ) > ( list @ ( plus @ N @ M ) ) ) ).

thf(matrix_type,type,
    matrix: nat > nat > $tType ).

thf(mempty_type,type,
    mempty: 
      !>[N: nat] : ( matrix @ zero @ N ) ).

thf(mcons_type,type,
    mcons: 
      !>[M: nat,N: nat] : ( ( list @ N ) > ( matrix @ M @ N ) > ( matrix @ ( suc @ M ) @ N ) ) ).

thf(ladd_type,type,
    ladd: 
      !>[N: nat] : ( ( list @ N ) > ( list @ N ) > ( list @ N ) ) ).

thf(madd_type,type,
    madd: 
      !>[M: nat,N: nat] : ( ( matrix @ M @ N ) > ( matrix @ M @ N ) > ( matrix @ M @ N ) ) ).

thf(peano1,axiom,
    ! [N: nat] :
      ( ( suc @ N )
     != zero ) ).

thf(peano2,axiom,
    ! [N: nat,M: nat] :
      ( ( N != M )
     => ( ( suc @ N )
       != ( suc @ M ) ) ) ).

thf(peano3,axiom,
    ! [P: nat > $o] :
      ( ( P @ zero )
     => ( ! [M: nat] :
            ( ( P @ M )
           => ( P @ ( suc @ M ) ) )
       => ! [N: nat] : ( P @ N ) ) ) ).

thf(ladd_nil,axiom,
    ( ( ladd @ zero @ nil @ nil )
    = nil ) ).

thf(ladd_cons,axiom,
    ! [N: nat,H1: nat,L1: list @ N,H2: nat,L2: list @ N] :
      ( ( ladd @ ( suc @ N ) @ ( cons @ N @ H1 @ L1 ) @ ( cons @ N @ H2 @ L2 ) )
      = ( cons @ N @ ( plus @ H1 @ H2 ) @ ( ladd @ N @ L1 @ L2 ) ) ) ).

thf(madd_mempty,axiom,
    ! [N: nat] :
      ( ( madd @ zero @ N @ ( mempty @ N ) @ ( mempty @ N ) )
      = ( mempty @ N ) ) ).

thf(madd_mcons,axiom,
    ! [M: nat,N: nat,L1: list @ N,M1: matrix @ M @ N,L2: list @ N,M2: matrix @ M @ N] :
      ( ( madd @ ( suc @ M ) @ N @ ( mcons @ M @ N @ L1 @ M1 ) @ ( mcons @ M @ N @ L2 @ M2 ) )
      = ( mcons @ M @ N @ ( ladd @ N @ L1 @ L2 ) @ ( madd @ M @ N @ M1 @ M2 ) ) ) ).

thf(matrix_add_com,conjecture,
    ! [M: nat,N: nat,M1: matrix @ M @ N,M2: matrix @ M @ N] :
      ( ( madd @ M @ N @ M1 @ M2 )
      = ( madd @ M @ N @ M2 @ M1 ) ) ).

%------------------------------------------------------------------------------
