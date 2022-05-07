import 'package:flutter/material.dart';
import 'package:injection_molding_machine_application/domain/entities/configuration.dart';
import 'package:injection_molding_machine_application/domain/entities/node_query.dart';
class Global {
  static int id = 0;
  static int machineLengh = 0;
  static int machineindex = 0;
  static DeviceQuery deviceQuery = DeviceQuery(deviceId: 'deviceId', tagName: []);
}