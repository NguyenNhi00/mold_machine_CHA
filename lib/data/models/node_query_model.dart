import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injection_molding_machine_application/domain/entities/node_query.dart';
import 'package:injection_molding_machine_application/domain/entities/node_query_result.dart';

class DeviceQuryModel extends NodeQuery {
  DeviceQuryModel(
      {required String eonNodeId, required List<DeviceQuery> deviceQueries})
      : super(eonNodeId: eonNodeId, deviceQueries: deviceQueries);
}

class NodeQueryModel extends NodeQuery {
  NodeQueryModel(
      {required String eonNodeId, required List<DeviceQuery> deviceQueries})
      : super(eonNodeId: eonNodeId, deviceQueries: deviceQueries);
}
