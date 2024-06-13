import 'package:pure/src/common/function_types.dart';
import 'package:pure/src/memoization/helpers.dart';

/// {@template extensions.memoization}
/// Returns a memoized version of the function.
///
/// Caches the result of the function based on its arguments and actually runs
/// the computation only once for a given combination of arguments.
///
/// Because of that, the source function must be **pure**.
/// {@endtemplate}
extension Memoize0X<T> on F0<T> {
  /// {@macro extensions.memoization}
  F0<T> memoize() {
    final cached = createCached<T>();

    return () => cached([]);
  }
}

/// {@macro extensions.memoization}
extension Memoize1X<A, T> on F1<A, T> {
  /// {@macro extensions.memoization}
  F1<A, T> memoize() {
    final cached = createCached<T>();

    return (a) => cached([a]);
  }
}

/// {@macro extensions.memoization}
extension Memoize2X<A, B, T> on F2<A, B, T> {
  /// {@macro extensions.memoization}
  F2<A, B, T> memoize() {
    final cached = createCached<T>();

    return (a, b) => cached([a, b]);
  }
}

/// {@macro extensions.memoization}
extension Memoize3X<A, B, C, T> on F3<A, B, C, T> {
  /// {@macro extensions.memoization}
  F3<A, B, C, T> memoize() {
    final cached = createCached<T>();

    return (a, b, c) => cached([a, b, c]);
  }
}

/// {@macro extensions.memoization}
extension Memoize4X<A, B, C, D, T> on F4<A, B, C, D, T> {
  /// {@macro extensions.memoization}
  F4<A, B, C, D, T> memoize() {
    final cached = createCached<T>();

    return (a, b, c, d) => cached([a, b, c, d]);
  }
}

/// {@macro extensions.memoization}
extension Memoize5X<A, B, C, D, E, T> on F5<A, B, C, D, E, T> {
  /// {@macro extensions.memoization}
  F5<A, B, C, D, E, T> memoize() {
    final cached = createCached<T>();

    return (a, b, c, d, e) => cached([a, b, c, d, e]);
  }
}

/// {@macro extensions.memoization}
extension Memoize6X<A, B, C, D, E, F, T> on F6<A, B, C, D, E, F, T> {
  /// {@macro extensions.memoization}
  F6<A, B, C, D, E, F, T> memoize() {
    final cached = createCached<T>();

    return (a, b, c, d, e, f) => cached([a, b, c, d, e, f]);
  }
}

/// {@macro extensions.memoization}
extension Memoize7X<A, B, C, D, E, F, G, T> on F7<A, B, C, D, E, F, G, T> {
  /// {@macro extensions.memoization}
  F7<A, B, C, D, E, F, G, T> memoize() {
    final cached = createCached<T>();

    return (a, b, c, d, e, f, g) => cached([a, b, c, d, e, f, g]);
  }
}

/// {@macro extensions.memoization}
extension Memoize8X<A, B, C, D, E, F, G, H, T>
    on F8<A, B, C, D, E, F, G, H, T> {
  /// {@macro extensions.memoization}
  F8<A, B, C, D, E, F, G, H, T> memoize() {
    final cached = createCached<T>();

    return (a, b, c, d, e, f, g, h) => cached([a, b, c, d, e, f, g, h]);
  }
}

/// {@macro extensions.memoization}
extension Memoize9X<A, B, C, D, E, F, G, H, I, T>
    on F9<A, B, C, D, E, F, G, H, I, T> {
  /// {@macro extensions.memoization}
  F9<A, B, C, D, E, F, G, H, I, T> memoize() {
    final cached = createCached<T>();

    return (a, b, c, d, e, f, g, h, i) => cached([a, b, c, d, e, f, g, h, i]);
  }
}
