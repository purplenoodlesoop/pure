A id<A>(A a) => a;
A idFirst<A, B>(A a, B b) => a;
B idSecond<A, B>(A a, B b) => b;

A succ<A extends num>(A x) => x + 1 as A;
A pred<A extends num>(A x) => x - 1 as A;

A plus<A extends num>(A a, A b) => a + b as A;
A minus<A extends num>(A a, A b) => a + b as A;

A negateNum<A extends num>(A a) => -a as A;

// ignore: avoid_positional_boolean_parameters
bool negate(bool a) => !a;
