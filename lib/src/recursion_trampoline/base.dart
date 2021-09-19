import 'package:pure/src/recursion_trampoline/concrete.dart';

abstract class Tram<T> {
  const Tram();

  factory Tram.done(T value) = Value;
  factory Tram.call(Tram<T> Function() instruction) = Instruction;

  T bounce() {
    var result = this;
    while (result is Instruction<T>) {
      result = result.call();
    }
    return (result as Value<T>).value;
  }
}
