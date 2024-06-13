/// {@template extensions.thunk}
/// Applies arguments to the function and returns a lazy thunk.
/// {@endtemplate}
library thunk;

import 'package:pure/src/common/function_types.dart';

/// {@macro extensions.thunk}
extension Thunk1X<A, T> on F1<A, T> {
  /// {@macro extensions.thunk}
  F0<T> thunk(A a) => () => this(a);
}

/// {@macro extensions.thunk}
extension Thunk2X<A, B, T> on F2<A, B, T> {
  /// {@macro extensions.thunk}
  F0<T> thunk(A a, B b) => () => this(a, b);
}

/// {@macro extensions.thunk}
extension Thunk3X<A, B, C, T> on F3<A, B, C, T> {
  /// {@macro extensions.thunk}
  F0<T> thunk(A a, B b, C c) => () => this(a, b, c);
}

/// {@macro extensions.thunk}
extension Thunk4X<A, B, C, D, T> on F4<A, B, C, D, T> {
  /// {@macro extensions.thunk}
  F0<T> thunk(A a, B b, C c, D d) => () => this(a, b, c, d);
}

/// {@macro extensions.thunk}
extension Thunk5X<A, B, C, D, E, T> on F5<A, B, C, D, E, T> {
  /// {@macro extensions.thunk}
  F0<T> thunk(A a, B b, C c, D d, E e) => () => this(a, b, c, d, e);
}

/// {@macro extensions.thunk}
extension Thunk6X<A, B, C, D, E, F, T> on F6<A, B, C, D, E, F, T> {
  /// {@macro extensions.thunk}
  F0<T> thunk(A a, B b, C c, D d, E e, F f) => () => this(a, b, c, d, e, f);
}

/// {@macro extensions.thunk}
extension Thunk7X<A, B, C, D, E, F, G, T> on F7<A, B, C, D, E, F, G, T> {
  /// {@macro extensions.thunk}
  F0<T> thunk(A a, B b, C c, D d, E e, F f, G g) =>
      () => this(a, b, c, d, e, f, g);
}

/// {@macro extensions.thunk}
extension Thunk8X<A, B, C, D, E, F, G, H, T> on F8<A, B, C, D, E, F, G, H, T> {
  /// {@macro extensions.thunk}
  F0<T> thunk(A a, B b, C c, D d, E e, F f, G g, H h) =>
      () => this(a, b, c, d, e, f, g, h);
}

/// {@macro extensions.thunk}
extension Thunk9X<A, B, C, D, E, F, G, H, I, T>
    on F9<A, B, C, D, E, F, G, H, I, T> {
  /// {@macro extensions.thunk}
  F0<T> thunk(A a, B b, C c, D d, E e, F f, G g, H h, I i) =>
      () => this(a, b, c, d, e, f, g, h, i);
}
