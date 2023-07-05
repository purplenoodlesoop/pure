import 'dart:async' as async;

import 'package:meta/meta.dart';

typedef _TaggedRecordConfig = ({bool stringify});

extension TaggedRecordZone on Never {
  static final Object _configKey = Object();

  static T runZoned<T>({
    required T Function() body,
    bool stringify = false,
  }) =>
      async.runZoned(
        body,
        zoneValues: <Object, _TaggedRecordConfig>{
          _configKey: (stringify: stringify,),
        },
      );
}

@immutable
abstract class TaggedRecord<R extends Record> {
  final R value;

  const TaggedRecord(this.value);

  static _TaggedRecordConfig get _config =>
      async.Zone.current[TaggedRecordZone._configKey] as _TaggedRecordConfig? ??
      (stringify: false);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaggedRecord<R> &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() =>
      _config.stringify ? '$runtimeType($value)' : super.toString();
}
