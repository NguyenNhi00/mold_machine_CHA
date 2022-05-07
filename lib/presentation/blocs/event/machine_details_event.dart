import 'package:equatable/equatable.dart';
import 'package:injection_molding_machine_application/domain/entities/configuration.dart';
import 'package:injection_molding_machine_application/domain/entities/mold.dart';
import 'package:injection_molding_machine_application/domain/entities/node_query.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:injection_molding_machine_application/data/models/error_package.dart';

import '../../../domain/entities/mold_monitor.dart';

abstract class MachineEvent extends Equatable {}

class MachineDetailsEventHubConnected extends MachineEvent {
  DateTime timestamp;
  HubConnection hubConnection;
  MachineDetailsEventHubConnected(
      {required this.hubConnection, required this.timestamp});
  @override
  List<Object> get props => [timestamp, hubConnection];
}

class MachineDetailsEventDataUpDated extends MachineEvent {
  DateTime timestamp;
  NodeQuery nodeQuery;
  MachineDetailsEventDataUpDated(
      {required this.timestamp,
      required this.nodeQuery,
      });
  @override
  List<Object> get props => [timestamp];
}

class MachineDetailsEventConnectFail extends MachineEvent {
  ErrorPackage errorPackage;
  MachineDetailsEventConnectFail({required this.errorPackage});
  @override
  List<Object> get props => [errorPackage];
}

class MachineDetailsEvent extends MachineEvent {
  ErrorPackage errorPackage;
  DateTime timestamp;
  MachineDetailsEvent(this.errorPackage, this.timestamp);
  @override
  List<Object> get props => [errorPackage, timestamp];
}
class MachineDetailsEventInit extends MachineEvent {
  @override
  List<Object> get props => [];
}
