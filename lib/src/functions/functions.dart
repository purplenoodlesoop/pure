/// Returns the value that was passed as an argument.
A id<A>(A a) => a;

/// Returns the first argument from passed two.
A idFirst<A, B>(A a, B b) => a;

/// Returns the second argument from passed two.
B idSecond<A, B>(A a, B b) => b;

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

/// Inverts of the passed argument.
// ignore: avoid_positional_boolean_parameters
bool negate(bool a) => !a;

/// Literally does nothing.
void nothing() {}

/// Literally does nothing, but asynchronously.
Future<void> asyncNothing() async {}
