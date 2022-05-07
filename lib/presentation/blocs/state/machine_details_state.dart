import 'package:equatable/equatable.dart';
import 'package:injection_molding_machine_application/data/models/error_package.dart';
import 'package:injection_molding_machine_application/data/models/product_model.dart';
import 'package:injection_molding_machine_application/domain/entities/configuration.dart';
import 'package:injection_molding_machine_application/domain/entities/mold.dart';
import 'package:injection_molding_machine_application/domain/entities/mold_monitor.dart';
import 'package:injection_molding_machine_application/domain/entities/node_query.dart';
import '../../../data/models/mold_monitor_model.dart';

abstract class MachineDetailsState extends Equatable {}

class MachineDetailsStateInit extends MachineDetailsState {
  DateTime timestamp;
  String data1;
  String data2;
  String data3;
  bool running;
  bool warning;
  String data4;
  String data5;
  String data6;
  String data7;
  String data8;
  // late Future<void>? hubConnectionBuilder;

  MachineDetailsStateInit({
    required this.timestamp,
    required this.data1,
    required this.data2,
    required this.data3,
    required this.warning,
    required this.running,
    required this.data4,
    required this.data5,
    required this.data6,
    required this.data7,
    required this.data8,
    //required this.hubConnectionBuilder,
  }) : super();

  @override
  List<Object?> get props => [
        timestamp, data2, data3, running, warning,
        //hubConnectionBuilder
      ];
}

class MachineDetailsStateLoadingRequest extends MachineDetailsState {
  DateTime timestamp;
  // late ErrorPackage errorPackage;
  MachineDetailsStateLoadingRequest({required this.timestamp});

  @override
  List<Object> get props => [timestamp];
}

class MachineDetailsStateConnectSuccessful extends MachineDetailsState {
  // DateTime timestamp;
 
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class MachineDetailsStateConnectFail extends MachineDetailsState {
  ErrorPackage errorPackage;

  MachineDetailsStateConnectFail({required this.errorPackage});
  @override
  List<Object> get props => [errorPackage];
}

class MachineDetailsStateDataUpdated extends MachineDetailsState {
  NodeQuery nodeQuery;
  DateTime timestamp;
  MachineDetailsStateDataUpdated({
    required this.nodeQuery,
    required this.timestamp,
  });
  @override
  // TODO: implement props
  List<Object> get props => [timestamp];
}
