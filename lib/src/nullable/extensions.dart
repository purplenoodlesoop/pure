library nullable;

import 'package:pure/src/common/function_types.dart';

/// {@template extensions.nullable}
/// Takes nullable versions of arguments and runs the computation if all of them
/// are not `null`.
/// {@endtemplate}
extension Nullable1X<A, T> on F1<A, T> {
  /// {@macro extensions.nullable}
  T? nullable(A? a) => a != null ? this(a) : null;
}

/// {@macro extensions.nullable}
extension Nullable2X<A, B, T> on F2<A, B, T> {
  /// {@macro extensions.nullable}
  T? nullable(A? a, B? b) => a != null && b != null ? this(a, b) : null;
}

/// {@macro extensions.nullable}
extension Nullable3X<A, B, C, T> on F3<A, B, C, T> {
  /// {@macro extensions.nullable}
  T? nullable(A? a, B? b, C? c) =>
      a != null && b != null && c != null ? this(a, b, c) : null;
}

/// {@macro extensions.nullable}
extension Nullable4X<A, B, C, D, T> on F4<A, B, C, D, T> {
  /// {@macro extensions.nullable}
  T? nullable(A? a, B? b, C? c, D? d) =>
      a != null && b != null && c != null && d != null
          ? this(a, b, c, d)
          : null;
}

/// {@macro extensions.nullable}
extension Nullable5X<A, B, C, D, E, T> on F5<A, B, C, D, E, T> {
  /// {@macro extensions.nullable}
  T? nullable(A? a, B? b, C? c, D? d, E? e) =>
      a != null && b != null && c != null && d != null && e != null
          ? this(a, b, c, d, e)
          : null;
}

/// {@macro extensions.nullable}
extension Nullable6X<A, B, C, D, E, F, T> on F6<A, B, C, D, E, F, T> {
  /// {@macro extensions.nullable}
  T? nullable(A? a, B? b, C? c, D? d, E? e, F? f) =>
      a != null && b != null && c != null && d != null && e != null && f != null
          ? this(a, b, c, d, e, f)
          : null;
}

/// {@macro extensions.nullable}
extension Nullable7X<A, B, C, D, E, F, G, T> on F7<A, B, C, D, E, F, G, T> {
  /// {@macro extensions.nullable}
  T? nullable(A? a, B? b, C? c, D? d, E? e, F? f, G? g) => a != null &&
          b != null &&
          c != null &&
          d != null &&
          e != null &&
          f != null &&
          g != null
      ? this(a, b, c, d, e, f, g)
      : null;
}

/// {@macro extensions.nullable}
extension Nullable8X<A, B, C, D, E, F, G, H, T>
    on F8<A, B, C, D, E, F, G, H, T> {
  /// {@macro extensions.nullable}
  T? nullable(A? a, B? b, C? c, D? d, E? e, F? f, G? g, H? h) => a != null &&
          b != null &&
          c != null &&
          d != null &&
          e != null &&
          f != null &&
          g != null &&
          h != null
      ? this(a, b, c, d, e, f, g, h)
      : null;
}

/// {@macro extensions.nullable}
extension Nullable9X<A, B, C, D, E, F, G, H, I, T>
    on F9<A, B, C, D, E, F, G, H, I, T> {
  /// {@macro extensions.nullable}
  T? nullable(A? a, B? b, C? c, D? d, E? e, F? f, G? g, H? h, I? i) =>
      a != null &&
              b != null &&
              c != null &&
              d != null &&
              e != null &&
              f != null &&
              g != null &&
              h != null &&
              i != null
          ? this(a, b, c, d, e, f, g, h, i)
          : null;
}
