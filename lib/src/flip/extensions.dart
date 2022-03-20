library flip;

import 'package:pure/src/common/function_types.dart';

/// {@template extensions.flip}
/// Returns a new function with flipped arguments, reversing their order.
/// {@endtemplate}
extension Flip2X<A, B, T> on F2<A, B, T> {
  /// {@macro extensions.flip}
  T flip(B b, A a) => this(a, b);
}

/// {@macro extensions.flip}
extension Flip3X<A, B, C, T> on F3<A, B, C, T> {
  /// {@macro extensions.flip}
  T flip(C c, B b, A a) => this(a, b, c);
}

/// {@macro extensions.flip}
extension Flip4X<A, B, C, D, T> on F4<A, B, C, D, T> {
  /// {@macro extensions.flip}
  T flip(D d, C c, B b, A a) => this(a, b, c, d);
}

/// {@macro extensions.flip}
extension Flip5X<A, B, C, D, E, T> on F5<A, B, C, D, E, T> {
  /// {@macro extensions.flip}
  T flip(E e, D d, C c, B b, A a) => this(a, b, c, d, e);
}

/// {@macro extensions.flip}
extension Flip6X<A, B, C, D, E, F, T> on F6<A, B, C, D, E, F, T> {
  /// {@macro extensions.flip}
  T flip(F f, E e, D d, C c, B b, A a) => this(a, b, c, d, e, f);
}

/// {@macro extensions.flip}
extension Flip7X<A, B, C, D, E, F, G, T> on F7<A, B, C, D, E, F, G, T> {
  /// {@macro extensions.flip}
  T flip(G g, F f, E e, D d, C c, B b, A a) => this(a, b, c, d, e, f, g);
}

/// {@macro extensions.flip}
extension Flip8X<A, B, C, D, E, F, G, H, T> on F8<A, B, C, D, E, F, G, H, T> {
  /// {@macro extensions.flip}
  T flip(H h, G g, F f, E e, D d, C c, B b, A a) =>
      this(a, b, c, d, e, f, g, h);
}

/// {@macro extensions.flip}
extension Flip9X<A, B, C, D, E, F, G, H, I, T>
    on F9<A, B, C, D, E, F, G, H, I, T> {
  /// {@macro extensions.flip}
  T flip(I i, H h, G g, F f, E e, D d, C c, B b, A a) =>
      this(a, b, c, d, e, f, g, h, i);
}
