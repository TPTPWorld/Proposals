%------------------------------------------------------------------------------
cnf(c1,plain,
    ( q(b)
    | ~ s(X) ),
    inference(clausify,[status(thm)],[a1]) ).

cnf(c2,plain,
    ( ~ q(b)
    | ~ p(X)
    | ~ r ),
    inference(clausify,[status(thm)],[a2]) ).

cnf(c3,plain,
    ( p(c)
    | ~ q(c) ),
    inference(clausify,[status(thm)],[a3]) ).

cnf(c4,plain,
    ( p(c)
    | q(Y) ),
    inference(clausify,[status(thm)],[a3]) ).

cnf(c5,plain,
    ( q(c)
    | ~ q(b) ),
    inference(clausify,[status(thm)],[a4]) ).

cnf(c6,plain,
    ( r
    | ~ p(c) ),
    inference(clausify,[status(thm)],[a5]) ).

cnf(c7,negated_conjecture,
    ( s(sK1)
    | q(b)
    | ~ p(c) ),
    inference(clausify,[status(thm)],[nc3]) ).
%------------------------------------------------------------------------------
