extension PipeX<A> on A {
  B pipe<B>(B Function(A a) f) => f(this);
}
