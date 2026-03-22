import 'package:pure/pure.dart';

mixin _Shape {}

sealed class Shape<T extends Record> = TaggedRecord<T> with _Shape;

final class Circle = Shape<({double radius})> with _Shape;

final class Rectangle = Shape<({double width, double height})> with _Shape;
