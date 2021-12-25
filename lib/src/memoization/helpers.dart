int _combineHashes(int first, int second) => 3 * first + second;

extension on List<Object?> {
  int get combinedHash => map((e) => e.hashCode).fold(0, _combineHashes);
}

extension TryGetMemoized on Function {
  T tryGetMemoized<T>(Map<int, T> results, List<Object?> arguments) =>
      results.putIfAbsent(
        arguments.combinedHash,
        () => Function.apply(this, arguments) as T,
      );
}
