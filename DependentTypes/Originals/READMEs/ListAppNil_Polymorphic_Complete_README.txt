This is a modified version of the original problem collection by
Johannes Niederhauser, extending the problem from fixed-length lists
to polymorphic fixed-length lists. Following is the original problem
description, slightly modified to take polymorphism in account. 

This collection of problems proves

! [A:$tType, N: nat,L: list @ A @ N] : ( ( app @ A @ N @ zero @ L @ (nil @ A) ) = L ),

i.e., nil is a right-neutral element of app.
The proof is by induction with a separate problem file for
the base and step case as well as the correct instantiation of
the induction axiom for lists. The main file list-app-nil.p
uses the conjectures of the other files as lemmas in order
to prove the final result. To simplify proof search, the
lemmas in the problem file for the induction step have been
preselected.
