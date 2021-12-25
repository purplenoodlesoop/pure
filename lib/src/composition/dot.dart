extension ComposeX<B, C> on C Function(B) {
  C Function(A) dot<A>(B Function(A a) f) => (a) => this(f(a));
}
