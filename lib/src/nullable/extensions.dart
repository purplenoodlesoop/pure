library nullable;

import 'package:pure/src/common/types.dart';

extension Nullable1X<A, T> on F1<A, T> {
  T? nullable(A? a) {
    if (a != null) {
      return this(a);
    }
  }
}

extension Nullable2X<A, B, T> on F2<A, B, T> {
  T? nullable(A? a, B? b) {
    if (a != null && b != null) {
      return this(a, b);
    }
  }
}

extension Nullable3X<A, B, C, T> on F3<A, B, C, T> {
  T? nullable(A? a, B? b, C? c) {
    if (a != null && b != null && c != null) {
      return this(a, b, c);
    }
  }
}

extension Nullable4X<A, B, C, D, T> on F4<A, B, C, D, T> {
  T? nullable(A? a, B? b, C? c, D? d) {
    if (a != null && b != null && c != null && d != null) {
      return this(a, b, c, d);
    }
  }
}

extension Nullable5X<A, B, C, D, E, T> on F5<A, B, C, D, E, T> {
  T? nullable(A? a, B? b, C? c, D? d, E? e) {
    if (a != null && b != null && c != null && d != null && e != null) {
      return this(a, b, c, d, e);
    }
  }
}

extension Nullable6X<A, B, C, D, E, F, T> on F6<A, B, C, D, E, F, T> {
  T? nullable(A? a, B? b, C? c, D? d, E? e, F? f) {
    if (a != null &&
        b != null &&
        c != null &&
        d != null &&
        e != null &&
        f != null) {
      return this(a, b, c, d, e, f);
    }
  }
}

extension Nullable7X<A, B, C, D, E, F, G, T> on F7<A, B, C, D, E, F, G, T> {
  T? nullable(A? a, B? b, C? c, D? d, E? e, F? f, G? g) {
    if (a != null &&
        b != null &&
        c != null &&
        d != null &&
        e != null &&
        f != null &&
        g != null) {
      return this(a, b, c, d, e, f, g);
    }
  }
}

extension Nullable8X<A, B, C, D, E, F, G, H, T>
    on F8<A, B, C, D, E, F, G, H, T> {
  T? nullable(A? a, B? b, C? c, D? d, E? e, F? f, G? g, H? h) {
    if (a != null &&
        b != null &&
        c != null &&
        d != null &&
        e != null &&
        f != null &&
        g != null &&
        h != null) {
      return this(a, b, c, d, e, f, g, h);
    }
  }
}

extension Nullable9X<A, B, C, D, E, F, G, H, I, T>
    on F9<A, B, C, D, E, F, G, H, I, T> {
  T? nullable(A? a, B? b, C? c, D? d, E? e, F? f, G? g, H? h, I? i) {
    if (a != null &&
        b != null &&
        c != null &&
        d != null &&
        e != null &&
        f != null &&
        g != null &&
        h != null &&
        i != null) {
      return this(a, b, c, d, e, f, g, h, i);
    }
  }
}
