Nitpick---2016   system information being retrieved
Nitpick---2016's non-default parameters being retrieved
Nitpick---2016's NXF_Finite-Finite-Global.TH0 being prepared by /exp/home/tptp/ServiceTools/tptp4X
    -d /tmp/SystemOnTPTP6509 
    -t none 
    -f tptp
    -x 
    -u machine
    NXF_Finite-Finite-Global.TH0.p
Nitpick---2016   being executed on NXF_Finite-Finite-Global.TH0 using /exp/home/tptp/Systems/Nitpick---2016/Source/bin/isabelle tptp_nitpick 60 '/tmp/SystemOnTPTP6509/NXF_Finite-Finite-Global.TH0.tptp'
% START OF SYSTEM OUTPUT
Nitpicking formula...
Timestamp: 10:46:37
The type bnd_product passed the monotonicity test; Nitpick might be able to
skip some scopes
Using SAT solver "Lingeling_JNI" The following solvers are configured:
"Lingeling_JNI", "CryptoMiniSat_JNI", "MiniSat_JNI", "SAT4J", "SAT4J_Light"
Skipping 995000 scopes. (Consider using "mono" or "merge_type_vars" to
prevent this.)
Batch 1 of 1000: Trying 5 scopes:
  card bnd_product = 1, card bnd_mworld = 1, and card bnd_person = 1
  card bnd_product = 2, card bnd_mworld = 2, and card bnd_person = 2
  card bnd_product = 3, card bnd_mworld = 3, and card bnd_person = 3
  card bnd_product = 4, card bnd_mworld = 4, and card bnd_person = 4
  card bnd_product = 5, card bnd_mworld = 5, and card bnd_person = 5
% SZS status CounterSatisfiable % SZS output start FiniteModel
Nitpick found a counterexample for card bnd_product = 2,
card bnd_mworld = 2, and card bnd_person = 2:

  Constants:
    bnd_alex = b1
    bnd_chris = b2
    bnd_gets_rich =
      (\<lambda>x. _)
      (b1 := (\<lambda>x. _)(b1 := True, b2 := True),
       b2 := (\<lambda>x. _)(b1 := False, b2 := False))
    bnd_leo = b1
    bnd_mactual = b2
    bnd_mrel =
      (\<lambda>x. _)
      (b1 := (\<lambda>x. _)(b1 := True, b2 := True),
       b2 := (\<lambda>x. _)(b1 := True, b2 := True))
    bnd_work_hard =
      (\<lambda>x. _)
      (b1 := (\<lambda>x. _)
         (b1 := (\<lambda>x. _)(b1 := True, b2 := True),
          b2 := (\<lambda>x. _)(b1 := True, b2 := True)),
       b2 := (\<lambda>x. _)
         (b1 := (\<lambda>x. _)(b1 := True, b2 := True),
          b2 := (\<lambda>x. _)(b1 := True, b2 := True)))
% SZS output end FiniteModel
Total time: 1.7 s

% END OF SYSTEM OUTPUT
RESULT: NXF_Finite-Finite-Global.TH0 - Nitpick---2016 says CounterSatisfiable - CPU = 28.34 WC = 10.08 
OUTPUT: NXF_Finite-Finite-Global.TH0 - Nitpick---2016 says FiniteModel - CPU = 28.34 WC = 10.08 
