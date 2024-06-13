bool Function(num other) greaterThan(num value) => (other) => other > value;

/// Increment the given value by one.
A succ<A extends num>(A x) => x + 1 as A;

/// Decrements the given value by one.
A pred<A extends num>(A x) => x - 1 as A;

/// Adds two arguments together.
A plus<A extends num>(A a, A b) => a + b as A;

/// Subtracts the second argument from the first one.
A minus<A extends num>(A a, A b) => a - b as A;

/// Inverts the sign of the passed argument.
A negateNum<A extends num>(A a) => -a as A;
