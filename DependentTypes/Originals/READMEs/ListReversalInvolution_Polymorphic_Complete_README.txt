This is a modified version of the original problem collection by
Johannes Niederhauser, extending the problem from fixed-length lists
to polymorphic fixed-length lists. Following is the original problem
description, slightly modified to take polymorphism in account. 

Using the following lemma,

thf(list_rev_invol_lem,axiom,
    ! [A: $tType,N: nat,L: list @ A @ N,M2: nat,L2: list @ A @ M2] :
      ( ( rev @ A @ ( plus @ N @ M2 ) @ ( app @ A @ N @ M2 @ ( rev @ A @ N @ L ) @ L2 ) )
      = ( app @ A @ M2 @ N @ ( rev @ A @ M2 @ L2 ) @ L ) ) ).

the problems list-rev-invol-step[1-5].p as a whole prove that the reversal
function on lists is an involution  The proof is split into smaller steps.
To simplify proof search, the axioms in each problem file have been preselected.
The file list-rev-invol.p contains a direct description of the problem and
includes all used axioms.
