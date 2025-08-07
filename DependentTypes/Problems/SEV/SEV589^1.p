%------------------------------------------------------------------------------
% File     : SEV589^1 : TPTP v9.2.0. Released v9.2.0.
% Domain   : Set Theory
% Problem  : No fixed point for function that returns different element, size 6
% Version  : Especial > Reduced > Especial.
% English  : Given a function that, if available, returns an element different
%            from the argument, show that this function has no fixed point for
%            sets above a certain size (that size of course being 1). For sets
%            of size 1 the conjecture cannot be proved, but the problem is
%            still well-typed in the weak sense as it is non-empty. In the
%            strong case, it is not even well-typed as it is not possible to
%            exhibit an element anymore. The problem has fewer axioms. This
%            results in finite sets of _at least_ size N as opposed to finite
%            sets of _exactly_ size N as in the previous family of problems.

% Refs     : [RRB23] Rothgang et al. (2023), Theorem Proving in Dependently
%          : [Rot25] Rothgang (2025), Email to Geoff Sutcliffe
% Source   : [Rot25]
% Names    : ChoiceNoFixedPoint/dchoice_no_fp_fin6_min.p [Rot25]

% Status   : Theorem
% Rating   : ? v9.2.0
% Syntax   : Number of formulae    :   11 (   3 unt;   7 typ;   1 def)
%            Number of atoms       :    6 (   6 equ;   0 cnn)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :   55 (   3   ~;   0   |;   0   &;  51   @)
%                                         (   0 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    5 (   3 avg)
%            Number of types       :    1 (   1 usr)
%            Number of type decls  :    7 (   0 !>P;   2 !>D)
%            Number of type conns  :    4 (   4   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    7 (   6 usr;   1 con; 0-2 aty)
%            Number of variables   :   10 (   1   ^;   6   !;   0   ?;  10   :)
%                                         (   2  !>;   0  ?*;   0  @-;   1  @+)
% SPC      : DH0_THM_EQU_NAR

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

%thf(finZ_inv, axiom, (! [X:(fin @ zero)] : $false)).
%thf(finS_inv, axiom, (! [N:nat] : (! [X:(fin @ (suc @ N))] : ((X = (f1 @ N)) | (? [Y:(fin @ N)] : (X = (fs @ N @ Y))))))).

thf(nofp_type,type,
    nofp: ( fin @ ( suc @ ( suc @ ( suc @ ( suc @ ( suc @ ( suc @ zero ) ) ) ) ) ) ) > ( fin @ ( suc @ ( suc @ ( suc @ ( suc @ ( suc @ ( suc @ zero ) ) ) ) ) ) ) ).

thf(nofp_def,definition,
    ( nofp
    = ( ^ [X: fin @ ( suc @ ( suc @ ( suc @ ( suc @ ( suc @ ( suc @ zero ) ) ) ) ) )] :
        @+[Y: fin @ ( suc @ ( suc @ ( suc @ ( suc @ ( suc @ ( suc @ zero ) ) ) ) ) )] : ( X != Y ) ) ) ).

thf(dchoice_nofp_fin6,conjecture,
    ! [X: fin @ ( suc @ ( suc @ ( suc @ ( suc @ ( suc @ ( suc @ zero ) ) ) ) ) )] :
      ( ( nofp @ X )
     != X ) ).

%------------------------------------------------------------------------------
