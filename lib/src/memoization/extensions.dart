import 'package:pure/src/common/types.dart';
import 'package:pure/src/memoization/helpers.dart';

extension Memoized0<T> on F0<T> {
  F0<T> memoize() {
    T? result;
    return () => result ??= this();
  }
}

extension Memoized1<A, T> on F1<A, T> {
  F1<A, T> memoize() {
    final results = <int, T>{};

    return (A a) => results.putIfAbsent(a.hashCode, () => this(a));
  }
}

extension Memoized2<A, B, T> on F2<A, B, T> {
  F2<A, B, T> memoize() {
    final results = <int, T>{};

    return (A a, B b) => tryGetMemoized(results, [a, b]);
  }
}

extension Memoized3<A, B, C, T> on F3<A, B, C, T> {
  F3<A, B, C, T> memoize() {
    final results = <int, T>{};

    return (A a, B b, C c) => tryGetMemoized(results, [a, b, c]);
  }
}

extension Memoized4<A, B, C, D, T> on F4<A, B, C, D, T> {
  F4<A, B, C, D, T> memoize() {
    final results = <int, T>{};

    return (A a, B b, C c, D d) => tryGetMemoized(results, [a, b, c, d]);
  }
}

extension Memoized5<A, B, C, D, E, T> on F5<A, B, C, D, E, T> {
  F5<A, B, C, D, E, T> memoize() {
    final results = <int, T>{};

    return (A a, B b, C c, D d, E e) =>
        tryGetMemoized(results, [a, b, c, d, e]);
  }
}

extension Memoized6<A, B, C, D, E, F, T> on F6<A, B, C, D, E, F, T> {
  F6<A, B, C, D, E, F, T> memoize() {
    final results = <int, T>{};

    return (A a, B b, C c, D d, E e, F f) =>
        tryGetMemoized(results, [a, b, c, d, e, f]);
  }
}

extension Memoized7<A, B, C, D, E, F, G, T> on F7<A, B, C, D, E, F, G, T> {
  F7<A, B, C, D, E, F, G, T> memoize() {
    final results = <int, T>{};

    return (A a, B b, C c, D d, E e, F f, G g) =>
        tryGetMemoized(results, [a, b, c, d, e, f, g]);
  }
}

extension Memoized8<A, B, C, D, E, F, G, H, T>
    on F8<A, B, C, D, E, F, G, H, T> {
  F8<A, B, C, D, E, F, G, H, T> memoize() {
    final results = <int, T>{};

    return (A a, B b, C c, D d, E e, F f, G g, H h) =>
        tryGetMemoized(results, [a, b, c, d, e, f, g, h]);
  }
}

extension Memoized9<A, B, C, D, E, F, G, H, I, T>
    on F9<A, B, C, D, E, F, G, H, I, T> {
  F9<A, B, C, D, E, F, G, H, I, T> memoize() {
    final results = <int, T>{};

    return (A a, B b, C c, D d, E e, F f, G g, H h, I i) =>
        tryGetMemoized(results, [a, b, c, d, e, f, g, h, i]);
  }
}
