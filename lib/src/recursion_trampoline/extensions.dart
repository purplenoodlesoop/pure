import 'package:pure/src/common/types.dart';
import 'package:pure/src/recursion_trampoline/tram.dart';

extension Bounce0X<T> on F0<Tram<T>> {
  T bounce() => this().bounce();
}

extension Bounce1X<A, T> on F1<A, Tram<T>> {
  T bounce(A a) => this(a).bounce();
}

extension Bounce2X<A, B, T> on F2<A, B, Tram<T>> {
  T bounce(A a, B b) => this(a, b).bounce();
}

extension Bounce3X<A, B, C, T> on F3<A, B, C, Tram<T>> {
  T bounce(A a, B b, C c) => this(a, b, c).bounce();
}

extension Bounce4X<A, B, C, D, T> on F4<A, B, C, D, Tram<T>> {
  T bounce(A a, B b, C c, D d) => this(a, b, c, d).bounce();
}

extension Bounce5X<A, B, C, D, E, T> on F5<A, B, C, D, E, Tram<T>> {
  T bounce(A a, B b, C c, D d, E e) => this(a, b, c, d, e).bounce();
}

extension Bounce6X<A, B, C, D, E, F, T> on F6<A, B, C, D, E, F, Tram<T>> {
  T bounce(A a, B b, C c, D d, E e, F f) => this(a, b, c, d, e, f).bounce();
}

extension Bounce7X<A, B, C, D, E, F, G, T> on F7<A, B, C, D, E, F, G, Tram<T>> {
  T bounce(A a, B b, C c, D d, E e, F f, G g) =>
      this(a, b, c, d, e, f, g).bounce();
}

extension Bounce8X<A, B, C, D, E, F, G, H, T>
    on F8<A, B, C, D, E, F, G, H, Tram<T>> {
  T bounce(A a, B b, C c, D d, E e, F f, G g, H h) =>
      this(a, b, c, d, e, f, g, h).bounce();
}

extension Bounce9X<A, B, C, D, E, F, G, H, I, T>
    on F9<A, B, C, D, E, F, G, H, I, Tram<T>> {
  T bounce(A a, B b, C c, D d, E e, F f, G g, H h, I i) =>
      this(a, b, c, d, e, f, g, h, i).bounce();
}
