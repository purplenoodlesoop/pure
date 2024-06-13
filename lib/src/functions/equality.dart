import 'package:pure/src/composition/dot.dart';

/// Creates a comparator that compares two values by zooming into them.
Comparator<A> compare<A, B extends Comparable<B>>(
  B Function(A whole) zoom,
) =>
    (a, b) => zoom(a).compareTo(zoom(b));

/// Creates a comparator that compares two values by zooming into them
Comparator<A> compareByEntryIndex<A, B>(
  List<B> values,
  B Function(A whole) zoom,
) =>
    (a, b) {
      final indexOfZoomed = values.indexOf.dot(zoom);

      return indexOfZoomed(a).compareTo(indexOfZoomed(b));
    };

/// Compares two values.
bool eq<A>(A first, A second) => first == second;

/// Checks if object is of type [T].
bool itIs<T>(Object? object) => object is T;

/// Checks if object is not of type [T].
bool itIsNot<T>(Object? object) => object is! T;

/// Checks if object is null.
bool isNull<T>(T? nullable) => nullable == null;

/// Checks if object is not null.
bool isNotNull<T>(T? nullable) => nullable != null;
