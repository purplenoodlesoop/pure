import 'package:meta/meta.dart';

@immutable
abstract base class TaggedRecord<R extends Record> {
  final R value;

  const TaggedRecord(this.value);

  String get name => runtimeType.toString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaggedRecord<R> &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => '$name($value)';
}
