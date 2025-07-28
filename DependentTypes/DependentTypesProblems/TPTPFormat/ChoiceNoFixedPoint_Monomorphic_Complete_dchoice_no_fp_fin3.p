%------------------------------------------------------------------------------
% File     : TBA000^1 : TPTP v10.0.0. Released v10.0.0.
% Domain   : Set Theory
% Problem  : No fixed point for function that returns different element, size 3
% Version  : Especial.
% English  : Given a function that, if available, returns an element different
%            from the argument, show that this function has no fixed point for
%            sets above a certain size (that size of course being 1). For sets 
%            of size 1 the conjecture cannot be proved, but the problem is
%            still well-typed in the weak sense as it is non-empty. In the 
%            strong case, it is not even well-typed as it is not possible to 
%            exhibit an element anymore.

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ChoiceNoFixedPoint/dchoice_no_fp_fin3.p [Rot25]

% Status   : CounterSatisfiable
% Rating   : ? v10.0.0
% Syntax   : Number of formulae    :   13 (   4 unt;   7 typ;   1 def)
%            Number of atoms       :    9 (   8 equ;   0 cnn)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :   48 (   3   ~;   1   |;   0   &;  43   @)
%                                         (   0 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    5 (   3 avg)
%            Number of types       :    1 (   1 usr)
%            Number of type decls  :    7 (   0 !>P;   2 !>D)
%            Number of type conns  :    4 (   4   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    8 (   6 usr;   2 con; 0-2 aty)
%            Number of variables   :   14 (   1   ^;   9   !;   1   ?;  14   :)
%                                         (   2  !>;   0  ?*;   0  @-;   1  @+)
% SPC      : DH0_CSA_EQU_NAR

% Comments :
%------------------------------------------------------------------------------
thf(nat_type,type,
    nat: $tType ).

thf(zero_type,type,
    zero: nat ).

thf(suc_type,type,
    suc: nat > nat ).

thf(fin_type,type,
    fin: nat > $tType ).

thf(f1_type,type,
    f1: 
      !>[A: nat] : ( fin @ ( suc @ A ) ) ).

thf(fs_type,type,
    fs: 
      !>[A: nat] : ( ( fin @ A ) > ( fin @ ( suc @ A ) ) ) ).

thf(f1notfs,axiom,
    ! [N: nat,X: fin @ N] :
      ( ( f1 @ N )
     != ( fs @ N @ X ) ) ).

thf(fs_inj,axiom,
    ! [N: nat,X: fin @ N,Y: fin @ N] :
      ( ( ( fs @ N @ X )
        = ( fs @ N @ Y ) )
     => ( X = Y ) ) ).

thf(finZ_inv,axiom,
    ! [X: fin @ zero] : $false ).

thf(finS_inv,axiom,
    ! [N: nat,X: fin @ ( suc @ N )] :
      ( ( X
        = ( f1 @ N ) )
      | ? [Y: fin @ N] :
          ( X
          = ( fs @ N @ Y ) ) ) ).

thf(nofp_type,type,
    nofp: ( fin @ ( suc @ ( suc @ ( suc @ zero ) ) ) ) > ( fin @ ( suc @ ( suc @ ( suc @ zero ) ) ) ) ).

thf(nofp_def,definition,
    ( nofp
    = ( ^ [X: fin @ ( suc @ ( suc @ ( suc @ zero ) ) )] :
        @+[Y: fin @ ( suc @ ( suc @ ( suc @ zero ) ) )] : ( X != Y ) ) ) ).

thf(dchoice_nofp_fin3,conjecture,
    ! [X: fin @ ( suc @ ( suc @ ( suc @ zero ) ) )] :
      ( ( nofp @ X )
     != X ) ).

%------------------------------------------------------------------------------
