import 'package:pure/src/common/function_types.dart';
import 'package:pure/src/memoization/helpers.dart';

extension Memoize0X<T> on F0<T> {
  F0<T> memoize() {
    T? result;
    return () => result ??= this();
  }
}

extension Memoize1X<A, T> on F1<A, T> {
  F1<A, T> memoize() {
    final results = <int, T>{};

    return (a) => results.putIfAbsent(a.hashCode, () => this(a));
  }
}

extension Memoize2X<A, B, T> on F2<A, B, T> {
  F2<A, B, T> memoize() {
    final results = <int, T>{};

    return (a, b) => getMemoizedOrCompute(results, [a, b]);
  }
}

extension Memoize3X<A, B, C, T> on F3<A, B, C, T> {
  F3<A, B, C, T> memoize() {
    final results = <int, T>{};

    return (a, b, c) => getMemoizedOrCompute(results, [a, b, c]);
  }
}

extension Memoize4X<A, B, C, D, T> on F4<A, B, C, D, T> {
  F4<A, B, C, D, T> memoize() {
    final results = <int, T>{};

    return (a, b, c, d) => getMemoizedOrCompute(results, [a, b, c, d]);
  }
}

extension Memoize5X<A, B, C, D, E, T> on F5<A, B, C, D, E, T> {
  F5<A, B, C, D, E, T> memoize() {
    final results = <int, T>{};

    return (a, b, c, d, e) => getMemoizedOrCompute(results, [a, b, c, d, e]);
  }
}

extension Memoize6X<A, B, C, D, E, F, T> on F6<A, B, C, D, E, F, T> {
  F6<A, B, C, D, E, F, T> memoize() {
    final results = <int, T>{};

    return (a, b, c, d, e, f) =>
        getMemoizedOrCompute(results, [a, b, c, d, e, f]);
  }
}

extension Memoize7X<A, B, C, D, E, F, G, T> on F7<A, B, C, D, E, F, G, T> {
  F7<A, B, C, D, E, F, G, T> memoize() {
    final results = <int, T>{};

    return (a, b, c, d, e, f, g) =>
        getMemoizedOrCompute(results, [a, b, c, d, e, f, g]);
  }
}

extension Memoize8X<A, B, C, D, E, F, G, H, T>
    on F8<A, B, C, D, E, F, G, H, T> {
  F8<A, B, C, D, E, F, G, H, T> memoize() {
    final results = <int, T>{};

    return (a, b, c, d, e, f, g, h) =>
        getMemoizedOrCompute(results, [a, b, c, d, e, f, g, h]);
  }
}

extension Memoize9X<A, B, C, D, E, F, G, H, I, T>
    on F9<A, B, C, D, E, F, G, H, I, T> {
  F9<A, B, C, D, E, F, G, H, I, T> memoize() {
    final results = <int, T>{};

    return (a, b, c, d, e, f, g, h, i) =>
        getMemoizedOrCompute(results, [a, b, c, d, e, f, g, h, i]);
  }
}
