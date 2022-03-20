/// {@template pipe.index}
/// Feeds the value into a given function, returning the result of the
/// computation.
///
/// Useful for chaining functions, feeding ones result as others input. Also can
/// be used in conjunction with the `?.` operator.
/// {@endtemplate}
extension PipeX<A> on A {
  /// {@macro pipe.index}
  B pipe<B>(B Function(A a) f) => f(this);
}
