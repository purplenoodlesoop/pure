extension TryGetMemoized on Function {
  T Function(List<Object?> arguments) createCached<T>() {
    final results = <int, T>{};

    return (arguments) => results.putIfAbsent(
          Object.hashAll(arguments),
          () => Function.apply(this, arguments) as T,
        );
  }
}
