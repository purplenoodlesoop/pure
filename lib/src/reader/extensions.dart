import 'package:pure/src/lifting/extensions.dart';

typedef Reader<R, A> = A Function(R env);

extension ReaderMethods<R, A> on Reader<R, A> {
  Reader<R, B> map<B>(B Function(A a) f) => (env) => f(this(env));

  Reader<R, B> ap<B>(Reader<R, B Function(A a)> fa) =>
      (env) => fa(env)(this(env));

  Reader<R, B> flatMap<B>(Reader<R, B> Function(A a) f) =>
      (env) => f(this(env))(env);

  A run(R env) => this(env);
}
