library partial_application;

import 'package:pure/src/common/types.dart';

extension Apply2X<A, B, T> on F2<A, B, T> {
  F1<B, T> apply(A a) => (b) => this(a, b);
}

extension Apply3X<A, B, C, T> on F3<A, B, C, T> {
  F2<B, C, T> apply(A a) => (b, c) => this(a, b, c);
}

extension Apply4X<A, B, C, D, T> on F4<A, B, C, D, T> {
  F3<B, C, D, T> apply(A a) => (b, c, d) => this(a, b, c, d);
}

extension Apply5X<A, B, C, D, E, T> on F5<A, B, C, D, E, T> {
  F4<B, C, D, E, T> apply(A a) => (b, c, d, e) => this(a, b, c, d, e);
}

extension Apply6X<A, B, C, D, E, F, T> on F6<A, B, C, D, E, F, T> {
  F5<B, C, D, E, F, T> apply(A a) => (b, c, d, e, f) => this(a, b, c, d, e, f);
}

extension Apply7X<A, B, C, D, E, F, G, T> on F7<A, B, C, D, E, F, G, T> {
  F6<B, C, D, E, F, G, T> apply(A a) =>
      (b, c, d, e, f, g) => this(a, b, c, d, e, f, g);
}

extension Apply8X<A, B, C, D, E, F, G, H, T> on F8<A, B, C, D, E, F, G, H, T> {
  F7<B, C, D, E, F, G, H, T> apply(A a) =>
      (b, c, d, e, f, g, h) => this(a, b, c, d, e, f, g, h);
}

extension Apply9X<A, B, C, D, E, F, G, H, I, T>
    on F9<A, B, C, D, E, F, G, H, I, T> {
  F8<B, C, D, E, F, G, H, I, T> apply(A a) =>
      (b, c, d, e, f, g, h, i) => this(a, b, c, d, e, f, g, h, i);
}
