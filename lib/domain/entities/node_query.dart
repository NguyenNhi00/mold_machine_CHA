import 'package:equatable/equatable.dart';

class DeviceQuery extends Equatable {
  final String deviceId;
  final List<String> tagName;

  const DeviceQuery({
    required this.deviceId,
    required this.tagName,
  });

  @override
  List<Object> get props => [tagName, deviceId];
}

class NodeQuery extends Equatable {
  final String eonNodeId;
  final List<DeviceQuery> deviceQueries;

  const NodeQuery({
    required this.eonNodeId,
    required this.deviceQueries,
  });
  @override
  List<Object> get props => [eonNodeId, deviceQueries];
}
