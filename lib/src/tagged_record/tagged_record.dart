import 'package:meta/meta.dart';
import 'package:pure/pure.dart';

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

final class User extends TaggedRecord<({String name, int age})> {
  const User(super.value);
}

sealed class Result<T> {}

mixin _Constructor<T> implements Result<T> {}

final class Success<T> = TaggedRecord<({T value})> with _Constructor<T>;

final class Error<T> = TaggedRecord<()> with _Constructor<T>;
