/// Class that exposes recursion trampoline functionality, allowing to emulate
/// a tail call optimization.
///
/// Represents one of the two states of a recursive computations –
/// following recursive call or a returned value.
///
/// ```dart
/// Tram<int> recursiveSum(int number, int sum) => number == 0
///      ? Tram.done(sum)
///      : Tram.call(() => tramSum(number - 1, sum + number));
/// ```
sealed class Tram<T> {
  const Tram._();

  /// Represents a recursive tail call.
  const factory Tram.call(Tram<T> Function() instruction) = _Instruction;

  /// Represents a returning value.
  const factory Tram.done(T value) = _Value;

  /// {@template tram.bounce}
  /// Runs the function, "bouncing" on the recursion trampoline, returning
  /// the result of the wrapped computations.
  /// {@endtemplate}
  T bounce() {
    var result = this;

    while (true) {
      switch (result) {
        case _Value(:final value):
          return value;
        case _Instruction(:final call):
          result = call();
      }
    }
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
