import 'package:pure/src/recursion_trampoline/base.dart';

class Value<T> extends Tram<T> {
  final T value;

  const Value(this.value);
}

class Instruction<T> extends Tram<T> {
  final Tram<T> Function() call;

  const Instruction(this.call);
}
