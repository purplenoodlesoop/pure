library uncurry;

import 'package:pure/src/common/curried_function_types.dart';

extension Uncurry2X<A, B, T> on CF2<A, B, T> {
  T uncurry(A a, B b) => this(a)(b);
}

extension Uncurry3X<A, B, C, T> on CF3<A, B, C, T> {
  T uncurry(A a, B b, C c) => this(a)(b)(c);
}

extension Uncurry4X<A, B, C, D, T> on CF4<A, B, C, D, T> {
  T uncurry(A a, B b, C c, D d) => this(a)(b)(c)(d);
}

extension Uncurry5X<A, B, C, D, E, T> on CF5<A, B, C, D, E, T> {
  T uncurry(A a, B b, C c, D d, E e) => this(a)(b)(c)(d)(e);
}

extension Uncurry6X<A, B, C, D, E, F, T> on CF6<A, B, C, D, E, F, T> {
  T uncurry(A a, B b, C c, D d, E e, F f) => this(a)(b)(c)(d)(e)(f);
}

extension Uncurry7X<A, B, C, D, E, F, G, T> on CF7<A, B, C, D, E, F, G, T> {
  T uncurry(A a, B b, C c, D d, E e, F f, G g) => this(a)(b)(c)(d)(e)(f)(g);
}

extension Uncurry8X<A, B, C, D, E, F, G, H, T>
    on CF8<A, B, C, D, E, F, G, H, T> {
  T uncurry(A a, B b, C c, D d, E e, F f, G g, H h) =>
      this(a)(b)(c)(d)(e)(f)(g)(h);
}

extension Uncurry9X<A, B, C, D, E, F, G, H, I, T>
    on CF9<A, B, C, D, E, F, G, H, I, T> {
  T uncurry(A a, B b, C c, D d, E e, F f, G g, H h, I i) =>
      this(a)(b)(c)(d)(e)(f)(g)(h)(i);
}
