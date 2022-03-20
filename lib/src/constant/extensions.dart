library constant;

/// {@template extensions.constant}
/// Takes a single argument, discards it and return the value that it was called
/// on.
/// {@endtemplate}
extension ConstantX<A> on A {
  /// {@macro extensions.constant}
  A constant(dynamic _) => this;
}
