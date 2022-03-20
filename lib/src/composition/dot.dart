/// {@template dot.index}
/// Composes two functions following the rules of mathematical function
/// composition.
/// {@endtemplate}
extension ComposeX<B, C> on C Function(B) {
  /// {@macro dot.index}
  C Function(A) dot<A>(B Function(A a) f) => (a) => this(f(a));
}
