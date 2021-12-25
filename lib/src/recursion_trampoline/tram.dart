abstract class Tram<T> {
  const Tram._();

  const factory Tram.done(T value) = _Value;
  const factory Tram.call(Tram<T> Function() instruction) = _Instruction;

  T bounce() {
    var result = this;
    while (result is _Instruction<T>) {
      result = result.call();
    }
    return (result as _Value<T>).value;
  }
}

class _Value<T> extends Tram<T> {
  final T value;

  const _Value(this.value) : super._();
}

class _Instruction<T> extends Tram<T> {
  final Tram<T> Function() call;

  const _Instruction(this.call) : super._();
}
