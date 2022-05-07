import 'package:injection_molding_machine_application/domain/entities/node_query_result.dart';

class NodeQueryResultModel extends NodeQueryResult {
  NodeQueryResultModel(String eonNodeId, bool connected,
      List<DeviceQueryResult> deviceQueryResults)
      : super(eonNodeId, connected, deviceQueryResults);
}

class DeviceQueryResultMode extends DeviceQueryResult {
  DeviceQueryResultMode(
      {required String deviceId,
      required bool connected,
      required List<TagQueryResult> tagQueryResults})
      : super(
            deviceId: deviceId,
            connected: connected,
            tagQueryResults: tagQueryResults);
}

class TagQueryResultModel extends TagQueryResult {
  TagQueryResultModel({required String tagName, required Object value})
      : super(tagName: tagName, value: value);
}
