// ignore_for_file: avoid_positional_boolean_parameters

/// Always returns `true`.
bool nullaryTrue() => true;

/// Always returns `false`.
bool nullaryFalse() => false;

/// Returns `true` for any argument.
bool unaryTrue(dynamic _) => true;

/// Returns `false` for any argument.
bool unaryFalse(dynamic _) => false;

/// Inverts of the passed argument.
bool negate(bool a) => !a;

/// Returns the logical conjunction of the passed arguments.
bool and(bool a, bool b) => a && b;

/// Returns the logical disjunction of the passed arguments.
bool or(bool a, bool b) => a || b;

/// Returns the logical exclusive disjunction of the passed arguments.
bool xor(bool a, bool b) => a ^ b;

/// Returns the logical non-exclusive disjunction of the passed arguments.
bool nand(bool a, bool b) => !(a && b);

/// Returns the logical non-exclusive conjunction of the passed arguments.
bool nor(bool a, bool b) => !(a || b);

/// Returns the logical non-exclusive exclusive disjunction of the passed
/// arguments.
bool xnor(bool a, bool b) => !(a ^ b);

/// Returns the logical implication of the passed arguments.
bool implies(bool a, bool b) => !a || b;

/// Returns the logical non-exclusive implication of the passed arguments.
bool nonImplies(bool a, bool b) => a && !b;
