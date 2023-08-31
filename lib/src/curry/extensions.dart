library currying;

import 'package:pure/src/common/curried_function_types.dart';
import 'package:pure/src/common/function_types.dart';

/// {@template extensions.curry}
/// Curries the function.
///
/// Transforms it into a higher order function that
/// takes a single argument and returns another function that takes a single
/// argument and returns another function, as many times as many
/// there were arguments in the original function.
///
/// Handy for partial application.
/// {@endtemplate}
extension Curry1X<A, T> on F1<A, T> {
  /// {@macro extensions.curry}
  F0<T> curry(A a) => () => this(a);
}

/// {@macro extensions.curry}
extension Curry2X<A, B, T> on F2<A, B, T> {
  /// {@macro extensions.curry}
  T Function(B b) curry(A a) => (b) => this(a, b);
}

/// {@macro extensions.curry}
extension Curry3X<A, B, C, T> on F3<A, B, C, T> {
  /// {@macro extensions.curry}
  CF2<B, C, T> curry(A a) => (b) => (c) => this(a, b, c);
}

/// {@macro extensions.curry}
extension Curry4X<A, B, C, D, T> on F4<A, B, C, D, T> {
  /// {@macro extensions.curry}
  CF3<B, C, D, T> curry(A a) => (b) => (c) => (d) => this(a, b, c, d);
}

/// {@macro extensions.curry}
extension Curry5X<A, B, C, D, E, T> on F5<A, B, C, D, E, T> {
  /// {@macro extensions.curry}
  CF4<B, C, D, E, T> curry(A a) =>
      (b) => (c) => (d) => (e) => this(a, b, c, d, e);
}

/// {@macro extensions.curry}
extension Curry6X<A, B, C, D, E, F, T> on F6<A, B, C, D, E, F, T> {
  /// {@macro extensions.curry}
  CF5<B, C, D, E, F, T> curry(A a) =>
      (b) => (c) => (d) => (e) => (f) => this(a, b, c, d, e, f);
}

/// {@macro extensions.curry}
extension Curry7X<A, B, C, D, E, F, G, T> on F7<A, B, C, D, E, F, G, T> {
  /// {@macro extensions.curry}
  CF6<B, C, D, E, F, G, T> curry(A a) =>
      (b) => (c) => (d) => (e) => (f) => (g) => this(a, b, c, d, e, f, g);
}

/// {@macro extensions.curry}
extension Curry8X<A, B, C, D, E, F, G, H, T> on F8<A, B, C, D, E, F, G, H, T> {
  /// {@macro extensions.curry}
  CF7<B, C, D, E, F, G, H, T> curry(A a) => (b) =>
      (c) => (d) => (e) => (f) => (g) => (h) => this(a, b, c, d, e, f, g, h);
}

/// {@macro extensions.curry}
extension Curry9X<A, B, C, D, E, F, G, H, I, T>
    on F9<A, B, C, D, E, F, G, H, I, T> {
  /// {@macro extensions.curry}
  CF8<B, C, D, E, F, G, H, I, T> curry(A a) => (b) => (c) =>
      (d) => (e) => (f) => (g) => (h) => (i) => this(a, b, c, d, e, f, g, h, i);
}
