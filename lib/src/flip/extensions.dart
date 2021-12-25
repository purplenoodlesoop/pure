library flip;

import 'package:pure/src/common/types.dart';

extension Flip2X<A, B, T> on F2<A, B, T> {
  T flip(B b, A a) => this(a, b);
}

extension Flip3X<A, B, C, T> on F3<A, B, C, T> {
  T flip(C c, B b, A a) => this(a, b, c);
}

extension Flip4X<A, B, C, D, T> on F4<A, B, C, D, T> {
  T flip(D d, C c, B b, A a) => this(a, b, c, d);
}

extension Flip5X<A, B, C, D, E, T> on F5<A, B, C, D, E, T> {
  T flip(E e, D d, C c, B b, A a) => this(a, b, c, d, e);
}

extension Flip6X<A, B, C, D, E, F, T> on F6<A, B, C, D, E, F, T> {
  T flip(F f, E e, D d, C c, B b, A a) => this(a, b, c, d, e, f);
}

extension Flip7X<A, B, C, D, E, F, G, T> on F7<A, B, C, D, E, F, G, T> {
  T flip(G g, F f, E e, D d, C c, B b, A a) => this(a, b, c, d, e, f, g);
}

extension Flip8X<A, B, C, D, E, F, G, H, T> on F8<A, B, C, D, E, F, G, H, T> {
  T flip(H h, G g, F f, E e, D d, C c, B b, A a) =>
      this(a, b, c, d, e, f, g, h);
}

extension Flip9X<A, B, C, D, E, F, G, H, I, T>
    on F9<A, B, C, D, E, F, G, H, I, T> {
  T flip(I i, H h, G g, F f, E e, D d, C c, B b, A a) =>
      this(a, b, c, d, e, f, g, h, i);
}
