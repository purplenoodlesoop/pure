library uncurry;

extension Uncurry2X<A, B, T> on T Function(B) Function(A) {
  T uncurry(A a, B b) => this(a)(b);
}

extension Uncurry3X<A, B, C, T> on T Function(C) Function(B) Function(A) {
  T uncurry(A a, B b, C c) => this(a)(b)(c);
}

extension Uncurry4X<A, B, C, D, T> on T Function(D) Function(C) Function(B)
    Function(A) {
  T uncurry(A a, B b, C c, D d) => this(a)(b)(c)(d);
}

extension Uncurry5X<A, B, C, D, E, T>
    on T Function(E) Function(D) Function(C) Function(B) Function(A) {
  T uncurry(A a, B b, C c, D d, E e) => this(a)(b)(c)(d)(e);
}

extension Uncurry6X<A, B, C, D, E, F, T>
    on T Function(F) Function(E) Function(D) Function(C) Function(B) Function(
        A) {
  T uncurry(A a, B b, C c, D d, E e, F f) => this(a)(b)(c)(d)(e)(f);
}

extension Uncurry7X<A, B, C, D, E, F, G, T>
    on T Function(G) Function(F) Function(E) Function(D) Function(C) Function(B)
        Function(A) {
  T uncurry(A a, B b, C c, D d, E e, F f, G g) => this(a)(b)(c)(d)(e)(f)(g);
}

extension Uncurry8X<A, B, C, D, E, F, G, H, T>
    on T Function(H) Function(G) Function(F) Function(E) Function(D) Function(C)
            Function(B)
        Function(A) {
  T uncurry(A a, B b, C c, D d, E e, F f, G g, H h) =>
      this(a)(b)(c)(d)(e)(f)(g)(h);
}

extension Uncurry9X<A, B, C, D, E, F, G, H, I, T>
    on T Function(I) Function(H) Function(G) Function(F) Function(E) Function(D)
                Function(C)
            Function(B)
        Function(A) {
  T uncurry(A a, B b, C c, D d, E e, F f, G g, H h, I i) =>
      this(a)(b)(c)(d)(e)(f)(g)(h)(i);
}
