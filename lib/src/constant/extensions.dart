library constant;

/// {@template extensions.constant}
/// Takes a single argument, discards it and return the value that it was called
/// on.
/// {@endtemplate}
extension ConstantX<A> on A {
  /// {@macro extensions.constant}
  A constant(
    dynamic p0, [
    dynamic p1,
    dynamic p2,
    dynamic p3,
    dynamic p4,
    dynamic p5,
    dynamic p6,
    dynamic p7,
    dynamic p8,
    dynamic p9,
  ]) =>
      this;
}
