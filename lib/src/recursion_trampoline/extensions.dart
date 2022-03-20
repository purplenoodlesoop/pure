import 'package:pure/src/common/function_types.dart';
import 'package:pure/src/recursion_trampoline/tram.dart';

/// {@macro tram.bounce}
extension Bounce0X<T> on F0<Tram<T>> {
  /// {@macro tram.bounce}
  T bounce() => this().bounce();
}

/// {@macro tram.bounce}
extension Bounce1X<A, T> on F1<A, Tram<T>> {
  /// {@macro tram.bounce}
  T bounce(A a) => this(a).bounce();
}

/// {@macro tram.bounce}
extension Bounce2X<A, B, T> on F2<A, B, Tram<T>> {
  /// {@macro tram.bounce}
  T bounce(A a, B b) => this(a, b).bounce();
}

/// {@macro tram.bounce}
extension Bounce3X<A, B, C, T> on F3<A, B, C, Tram<T>> {
  /// {@macro tram.bounce}
  T bounce(A a, B b, C c) => this(a, b, c).bounce();
}

/// {@macro tram.bounce}
extension Bounce4X<A, B, C, D, T> on F4<A, B, C, D, Tram<T>> {
  /// {@macro tram.bounce}
  T bounce(A a, B b, C c, D d) => this(a, b, c, d).bounce();
}

/// {@macro tram.bounce}
extension Bounce5X<A, B, C, D, E, T> on F5<A, B, C, D, E, Tram<T>> {
  /// {@macro tram.bounce}
  T bounce(A a, B b, C c, D d, E e) => this(a, b, c, d, e).bounce();
}

/// {@macro tram.bounce}
extension Bounce6X<A, B, C, D, E, F, T> on F6<A, B, C, D, E, F, Tram<T>> {
  /// {@macro tram.bounce}
  T bounce(A a, B b, C c, D d, E e, F f) => this(a, b, c, d, e, f).bounce();
}

/// {@macro tram.bounce}
extension Bounce7X<A, B, C, D, E, F, G, T> on F7<A, B, C, D, E, F, G, Tram<T>> {
  /// {@macro tram.bounce}
  T bounce(A a, B b, C c, D d, E e, F f, G g) =>
      this(a, b, c, d, e, f, g).bounce();
}

/// {@macro tram.bounce}
extension Bounce8X<A, B, C, D, E, F, G, H, T>
    on F8<A, B, C, D, E, F, G, H, Tram<T>> {
  /// {@macro tram.bounce}
  T bounce(A a, B b, C c, D d, E e, F f, G g, H h) =>
      this(a, b, c, d, e, f, g, h).bounce();
}

/// {@macro tram.bounce}
extension Bounce9X<A, B, C, D, E, F, G, H, I, T>
    on F9<A, B, C, D, E, F, G, H, I, Tram<T>> {
  /// {@macro tram.bounce}
  T bounce(A a, B b, C c, D d, E e, F f, G g, H h, I i) =>
      this(a, b, c, d, e, f, g, h, i).bounce();
}
