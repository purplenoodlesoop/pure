// ignore_for_file: avoid_positional_boolean_parameters

/// Falls back to the given value if the nullable value is `null`.
T Function(T? nullable) fallbackTo<T>(T value) =>
    (nullable) => nullable ?? value;

/// Returns the result of the callback.
A call<A>(A Function() callback) => callback();

/// Calls the given callback if the predicate is `true`.
T? callIf<T>(bool predicate, T Function() callback) =>
    predicate ? callback() : null;

/// Returns the value that was passed as an argument.
A id<A>(A a) => a;

/// Returns the first value that was passed as an argument.
A idFirst<A, B>(A a, B b) => a;

/// Returns the second value that was passed as an argument.
B idSecond<A, B>(A a, B b) => b;

/// Returns the first value that was passed as an argument from the three.
A idFirstTernary<A, B, C>(A a, B b, C c) => a;

/// Returns the second value that was passed as an argument from the three.
B idSecondTernary<A, B, C>(A a, B b, C c) => b;

/// Returns the third value that was passed as an argument from the three.
C idThirdTernary<A, B, C>(A a, B b, C c) => c;

/// Literally does nothing.
void nothing() {}

/// Literally does nothing, but asynchronously.
Future<void> asyncNothing() async {}

/// Returns the passed argument, coerced to the given type.
T coerce<T>(Object? value) => value as T;
