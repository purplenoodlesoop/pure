library currying;

import 'package:pure/src/common/curried_function_types.dart';
import 'package:pure/src/common/function_types.dart';

extension Curry2X<A, B, T> on F2<A, B, T> {
  T Function(B b) curry(A a) => (b) => this(a, b);
}

extension Curry3X<A, B, C, T> on F3<A, B, C, T> {
  CF2<B, C, T> curry(A a) => (b) => (c) => this(a, b, c);
}

extension Curry4X<A, B, C, D, T> on F4<A, B, C, D, T> {
  CF3<B, C, D, T> curry(A a) => (b) => (c) => (d) => this(a, b, c, d);
}

extension Curry5X<A, B, C, D, E, T> on F5<A, B, C, D, E, T> {
  CF4<B, C, D, E, T> curry(A a) =>
      (b) => (c) => (d) => (e) => this(a, b, c, d, e);
}

extension Curry6X<A, B, C, D, E, F, T> on F6<A, B, C, D, E, F, T> {
  CF5<B, C, D, E, F, T> curry(A a) =>
      (b) => (c) => (d) => (e) => (f) => this(a, b, c, d, e, f);
}

extension Curry7X<A, B, C, D, E, F, G, T> on F7<A, B, C, D, E, F, G, T> {
  CF6<B, C, D, E, F, G, T> curry(A a) =>
      (b) => (c) => (d) => (e) => (f) => (g) => this(a, b, c, d, e, f, g);
}

extension Curry8X<A, B, C, D, E, F, G, H, T> on F8<A, B, C, D, E, F, G, H, T> {
  CF7<B, C, D, E, F, G, H, T> curry(A a) => (b) =>
      (c) => (d) => (e) => (f) => (g) => (h) => this(a, b, c, d, e, f, g, h);
}

extension Curry9X<A, B, C, D, E, F, G, H, I, T>
    on F9<A, B, C, D, E, F, G, H, I, T> {
  CF8<B, C, D, E, F, G, H, I, T> curry(A a) => (b) => (c) =>
      (d) => (e) => (f) => (g) => (h) => (i) => this(a, b, c, d, e, f, g, h, i);
}
