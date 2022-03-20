/// {@template function_types.fn}
/// Typedef for a function that takes
/// {@endtemplate}
/// 0
/// {@template function_types.args}
/// arguments
/// {@endtemplate}
typedef F0<T> = T Function();

/// {@macro function_types.fn}
/// 1 argument.
typedef F1<A, T> = T Function(A a);

/// {@macro function_types.fn}
/// 2
/// {@macro function_types.args}
typedef F2<A, B, T> = T Function(A a, B b);

/// {@macro function_types.fn}
/// 3
/// {@macro function_types.args}
typedef F3<A, B, C, T> = T Function(A a, B b, C c);

/// {@macro function_types.fn}
/// 4
/// {@macro function_types.args}
typedef F4<A, B, C, D, T> = T Function(A a, B b, C c, D d);

/// {@macro function_types.fn}
/// 5
/// {@macro function_types.args}
typedef F5<A, B, C, D, E, T> = T Function(A a, B b, C c, D d, E e);

/// {@macro function_types.fn}
/// 6
/// {@macro function_types.args}
typedef F6<A, B, C, D, E, F, T> = T Function(A a, B b, C c, D d, E e, F f);

/// {@macro function_types.fn}
/// 7
/// {@macro function_types.args}
typedef F7<A, B, C, D, E, F, G, T> = T Function(
  A a,
  B b,
  C c,
  D d,
  E e,
  F f,
  G g,
);

/// {@macro function_types.fn}
/// 8
/// {@macro function_types.args}
typedef F8<A, B, C, D, E, F, G, H, T> = T Function(
  A a,
  B b,
  C c,
  D d,
  E e,
  F f,
  G g,
  H h,
);

/// {@macro function_types.fn}
/// 9
/// {@macro function_types.args}
typedef F9<A, B, C, D, E, F, G, H, I, T> = T Function(
  A a,
  B b,
  C c,
  D d,
  E e,
  F f,
  G g,
  H h,
  I i,
);
