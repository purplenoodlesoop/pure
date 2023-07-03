int _combineHashes(int first, int second) => 3 * first + second;

extension on List<Object?> {
  int combineHash() => map((e) => e.hashCode).fold(0, _combineHashes);
}

extension TryGetMemoized on Function {
  T getMemoizedOrCompute<T>(Map<int, T> results, List<Object?> arguments) =>
      results.putIfAbsent(
        arguments.combineHash(),
        () => Function.apply(this, arguments) as T,
      );
}
