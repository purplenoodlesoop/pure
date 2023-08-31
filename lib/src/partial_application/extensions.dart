library partial_application;

import 'package:pure/src/common/function_types.dart';

/// {@template extensions.partial_application}
/// Partially applies the first argument to the function without currying it.
///
/// Essentially acts as a shortcut of currying a function, applying the first
/// argument and immediately uncurrying it back.
/// {@endtemplate}
extension Apply1X<A, T> on F1<A, T> {
  /// {@macro extensions.partial_application}
  F0<T> apply(A a) => () => this(a);
}

/// {@macro extensions.partial_application}
extension Apply2X<A, B, T> on F2<A, B, T> {
  /// {@macro extensions.partial_application}
  F1<B, T> apply(A a) => (b) => this(a, b);
}

/// {@macro extensions.partial_application}
extension Apply3X<A, B, C, T> on F3<A, B, C, T> {
  /// {@macro extensions.partial_application}
  F2<B, C, T> apply(A a) => (b, c) => this(a, b, c);
}

/// {@macro extensions.partial_application}
extension Apply4X<A, B, C, D, T> on F4<A, B, C, D, T> {
  /// {@macro extensions.partial_application}
  F3<B, C, D, T> apply(A a) => (b, c, d) => this(a, b, c, d);
}

/// {@macro extensions.partial_application}
extension Apply5X<A, B, C, D, E, T> on F5<A, B, C, D, E, T> {
  /// {@macro extensions.partial_application}
  F4<B, C, D, E, T> apply(A a) => (b, c, d, e) => this(a, b, c, d, e);
}

/// {@macro extensions.partial_application}
extension Apply6X<A, B, C, D, E, F, T> on F6<A, B, C, D, E, F, T> {
  /// {@macro extensions.partial_application}
  F5<B, C, D, E, F, T> apply(A a) => (b, c, d, e, f) => this(a, b, c, d, e, f);
}

/// {@macro extensions.partial_application}
extension Apply7X<A, B, C, D, E, F, G, T> on F7<A, B, C, D, E, F, G, T> {
  /// {@macro extensions.partial_application}
  F6<B, C, D, E, F, G, T> apply(A a) =>
      (b, c, d, e, f, g) => this(a, b, c, d, e, f, g);
}

/// {@macro extensions.partial_application}
extension Apply8X<A, B, C, D, E, F, G, H, T> on F8<A, B, C, D, E, F, G, H, T> {
  /// {@macro extensions.partial_application}
  F7<B, C, D, E, F, G, H, T> apply(A a) =>
      (b, c, d, e, f, g, h) => this(a, b, c, d, e, f, g, h);
}

/// {@macro extensions.partial_application}
extension Apply9X<A, B, C, D, E, F, G, H, I, T>
    on F9<A, B, C, D, E, F, G, H, I, T> {
  /// {@macro extensions.partial_application}
  F8<B, C, D, E, F, G, H, I, T> apply(A a) =>
      (b, c, d, e, f, g, h, i) => this(a, b, c, d, e, f, g, h, i);
}
