import 'package:pure/src/common/types.dart';

extension LiftExtensions1<A, B> on F1<A, B> {
  B Function(C c) lift<C>(A Function(C c) f) => (c) => this(f(c));
}

extension LiftExtensions2<A, B, C> on F2<A, B, C> {
  C Function(D, B) liftFirst<D>(A Function(D d) f) => (d, b) => this(f(d), b);
  C Function(A, D) liftSecond<D>(B Function(D d) f) => (a, d) => this(a, f(d));
}
