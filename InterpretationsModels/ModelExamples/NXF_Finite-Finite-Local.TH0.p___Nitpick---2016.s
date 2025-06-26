Nitpicking formula...
Timestamp: 09:38:04
Using SAT solver "Lingeling_JNI" The following solvers are configured:
"Lingeling_JNI", "CryptoMiniSat_JNI", "MiniSat_JNI", "SAT4J", "SAT4J_Light"
Skipping 5000 scopes. (Consider using "mono" or "merge_type_vars" to prevent
this.)
Batch 1 of 1000: Trying 5 scopes:
  card bnd_fruit = 1 and card bnd_mworld = 1
  card bnd_fruit = 1 and card bnd_mworld = 2
  card bnd_fruit = 2 and card bnd_mworld = 1
  card bnd_fruit = 2 and card bnd_mworld = 2
  card bnd_fruit = 1 and card bnd_mworld = 3
% SZS status CounterSatisfiable % SZS output start FiniteModel
Nitpick found a counterexample for card bnd_fruit = 2 and
card bnd_mworld = 2:

  Skolem constant:
    ??.bnd_mbox.V = b1
  Constants:
    bnd_apple = b1
    bnd_banana = b2
    bnd_healthy =
      (\<lambda>x. _)
      (b1 := (\<lambda>x. _)(b1 := True, b2 := True),
       b2 := (\<lambda>x. _)(b1 := True, b2 := True))
    bnd_mactual = b1
    bnd_mrel =
      (\<lambda>x. _)
      (b1 := (\<lambda>x. _)(b1 := True, b2 := True),
       b2 := (\<lambda>x. _)(b1 := False, b2 := True))
    bnd_rotten =
      (\<lambda>x. _)
      (b1 := (\<lambda>x. _)(b1 := False, b2 := False),
       b2 := (\<lambda>x. _)(b1 := True, b2 := False))
% SZS output end FiniteModel
Total time: 717 ms
