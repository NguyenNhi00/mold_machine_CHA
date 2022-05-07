import 'package:equatable/equatable.dart';

class TagQueryResult extends Equatable {
  final String tagName;
  final Object value;

  const TagQueryResult({
    required this.tagName,
    required this.value,
  });

  @override
  List<Object> get props => [tagName, value];
}

class DeviceQueryResult extends Equatable {
  final String deviceId;
  final bool connected;
  final List<TagQueryResult> tagQueryResults;

  const DeviceQueryResult({
    required this.deviceId,
    required this.connected,
    required this.tagQueryResults,
  });

  @override
  List<Object> get props =>
      [deviceId, connected, tagQueryResults];
}

class NodeQueryResult extends Equatable {
  final String eonNodeId;
  final bool connected;
  final List<DeviceQueryResult> deviceQueryResults;

  NodeQueryResult(
    this.eonNodeId,
    this.connected,
    this.deviceQueryResults,
  );

  @override
  List<Object> get props =>
      [eonNodeId, connected, deviceQueryResults];
}
