library currying;

import 'package:pure/src/common/types.dart';

extension Curry2<A, B, T> on F2<A, B, T> {
  T Function(B) curry(A a) => (b) => this(a, b);
}

extension Curry3<A, B, C, T> on F3<A, B, C, T> {
  T Function(C) Function(B) curry(A a) => (b) => (c) => this(a, b, c);
}

extension Curry4<A, B, C, D, T> on F4<A, B, C, D, T> {
  T Function(D) Function(C) Function(B) curry(A a) =>
      (b) => (c) => (d) => this(a, b, c, d);
}

extension Curry5<A, B, C, D, E, T> on F5<A, B, C, D, E, T> {
  T Function(E) Function(D) Function(C) Function(B) curry(A a) =>
      (b) => (c) => (d) => (e) => this(a, b, c, d, e);
}

extension Curry6<A, B, C, D, E, F, T> on F6<A, B, C, D, E, F, T> {
  T Function(F) Function(E) Function(D) Function(C) Function(B) curry(A a) =>
      (b) => (c) => (d) => (e) => (f) => this(a, b, c, d, e, f);
}

extension Curry7<A, B, C, D, E, F, G, T> on F7<A, B, C, D, E, F, G, T> {
  T Function(G) Function(F) Function(E) Function(D) Function(C) Function(B)
      curry(A a) =>
          (b) => (c) => (d) => (e) => (f) => (g) => this(a, b, c, d, e, f, g);
}

extension Curry8<A, B, C, D, E, F, G, H, T> on F8<A, B, C, D, E, F, G, H, T> {
  T Function(H) Function(G) Function(F) Function(E) Function(D) Function(C)
      Function(B) curry(
          A a) =>
      (b) => (c) =>
          (d) => (e) => (f) => (g) => (h) => this(a, b, c, d, e, f, g, h);
}

extension Curry9<A, B, C, D, E, F, G, H, I, T>
    on F9<A, B, C, D, E, F, G, H, I, T> {
  T Function(I) Function(H) Function(G) Function(F) Function(E) Function(D)
          Function(C)
      Function(B) curry(
          A a) =>
      (b) => (c) => (d) =>
          (e) => (f) => (g) => (h) => (i) => this(a, b, c, d, e, f, g, h, i);
}
