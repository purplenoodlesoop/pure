library uncurry;

import 'package:pure/src/common/curried_function_types.dart';

/// {@template extensions.uncurry}
/// Uncurries the function, returning a new function that takes multiple
/// arguments instead of a single one, and acts as a normal function that
/// returns a single value.
/// {@endtemplate}
extension Uncurry2X<A, B, T> on CF2<A, B, T> {
  /// {@macro extensions.uncurry}
  T uncurry(A a, B b) => this(a)(b);
}

/// {@macro extensions.uncurry}
extension Uncurry3X<A, B, C, T> on CF3<A, B, C, T> {
  /// {@macro extensions.uncurry}
  T uncurry(A a, B b, C c) => this(a)(b)(c);
}

/// {@macro extensions.uncurry}
extension Uncurry4X<A, B, C, D, T> on CF4<A, B, C, D, T> {
  /// {@macro extensions.uncurry}
  T uncurry(A a, B b, C c, D d) => this(a)(b)(c)(d);
}

/// {@macro extensions.uncurry}
extension Uncurry5X<A, B, C, D, E, T> on CF5<A, B, C, D, E, T> {
  /// {@macro extensions.uncurry}
  T uncurry(A a, B b, C c, D d, E e) => this(a)(b)(c)(d)(e);
}

/// {@macro extensions.uncurry}
extension Uncurry6X<A, B, C, D, E, F, T> on CF6<A, B, C, D, E, F, T> {
  /// {@macro extensions.uncurry}
  T uncurry(A a, B b, C c, D d, E e, F f) => this(a)(b)(c)(d)(e)(f);
}

/// {@macro extensions.uncurry}
extension Uncurry7X<A, B, C, D, E, F, G, T> on CF7<A, B, C, D, E, F, G, T> {
  /// {@macro extensions.uncurry}
  T uncurry(A a, B b, C c, D d, E e, F f, G g) => this(a)(b)(c)(d)(e)(f)(g);
}

/// {@macro extensions.uncurry}
extension Uncurry8X<A, B, C, D, E, F, G, H, T>
    on CF8<A, B, C, D, E, F, G, H, T> {
  /// {@macro extensions.uncurry}
  T uncurry(A a, B b, C c, D d, E e, F f, G g, H h) =>
      this(a)(b)(c)(d)(e)(f)(g)(h);
}

/// {@macro extensions.uncurry}
extension Uncurry9X<A, B, C, D, E, F, G, H, I, T>
    on CF9<A, B, C, D, E, F, G, H, I, T> {
  /// {@macro extensions.uncurry}
  T uncurry(A a, B b, C c, D d, E e, F f, G g, H h, I i) =>
      this(a)(b)(c)(d)(e)(f)(g)(h)(i);
}
