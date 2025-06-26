thf(nat_type,type,
    nat: $tType ).

thf(zero_type,type,
    zero: nat ).

thf(suc_type,type,
    suc: nat > nat ).

thf(plus_type,type,
    plus: nat > nat > nat ).

thf(mult_type,type,
    mult: nat > nat > nat ).

thf(lt_type,type,
    lt: nat > nat > $o).

thf(bounded_type,type,
    bounded:
    !> [N: nat] : nat ?| (^ [M:nat] : lt @ M @ N) ).

thf(mat_type,type,
    mat:
    !> [M: nat, N: nat] : ((bounded @ M) > (bounded @ N) > nat) ).

thf(mmult,type,
    mmult:
    !> [L: nat, M: nat, N: nat] : ((mat @ L @ M) > (mat @ M @ N) > (mat @ L @ N)) ).

thf(lt_lzero,axiom,
    ! [N: nat]: (lt @ zero @ (suc @ N)) ).

thf(lt_rzero,axiom,
    ! [N: nat]: (~ (lt @ N @ zero)) ).

thf(lt_succ,axiom,
    ! [N: nat, M: nat]: ((lt @ (suc @ N) @ (suc @ M)) = (lt @ N @ M)) ).

thf(plus_zero,axiom,
    ! [N: nat] : ((plus @ zero @ N) = N)).

thf(plus_succ,axiom,
    ! [N: nat, M: nat] : ((plus @ (suc @ N) @ M) = (suc @ (plus @ N @ M)))).

thf(mult_zero,axiom,
    ! [N: nat] : ((mult @ zero @ N) = zero)).

thf(mult_succ,axiom,
    ! [N: nat, M: nat] : ((mult @ (suc @ N) @ M) = (plus @ M @ (mult @ N @ M)))).

thf(mmult_comp_zero,axiom,
    ![L: nat, M: nat, N: nat, A: mat @ L @ M, B: mat @ M @ N, I: bounded @ L, K: bounded @ N]: ((mmult_comp @ L @ M @ N @ A @ B @ I @ K @ zero) = (mult @ (A @ I @ zero) @ (B @ zero @ K)))).

thf(mmult_comp_succ,axiom,
    ![L: nat, M: nat, N: nat, A: mat @ L @ M, B: mat @ M @ N, I: bounded @ L, K: bounded @ N, J: bounded @ M]: ((mmult_comp @ L @ M @ N @ A @ B @ I @ K @ (suc @ J)) = (plus @ (mult @ (A @ I @ (suc @ J)) @ (B @ (suc @ J) @ K)) @ (mmult_comp @ L @ M @ N @ A @ B @ I @ K @ J)))).

thf(mmult,axiom,
    ! [L: nat, M: nat, N: nat, A: mat @ L @ M, B: mat @ M @ N] : ((mmult @ L @ M @ N @ A @ B) = (^ [I: bounded @ L, K: bounded @ N]: mmult_comp @ L @ M @ N @ A @ B I @ K @ M))).

thf(matrix_mult_assoc,conjecture,
    ! [L: nat,M: nat,N: nat, O: nat, A: mat @ L @ M, B: mat @ M @ N, C: mat @ N @ O] : ( (mmult @ L @ N @ O @ (mmult @ L @ M @ N @ A @ B) @ C) = (mmult @ L @ M @ O @ A @ (mmult @ M @ N @ O @ B @ C))) ).

