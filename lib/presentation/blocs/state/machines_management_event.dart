import 'package:equatable/equatable.dart';
import 'package:injection_molding_machine_application/data/models/product_model.dart';
import 'package:injection_molding_machine_application/domain/entities/configuration.dart';
import 'package:injection_molding_machine_application/domain/entities/node_query_result.dart';

class MachineManagementState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MachineManagementStateUnLoad extends MachineManagementState {}

class MachineManagementStateLoading extends MachineManagementState {}

class MachineManagementStateLoaded extends MachineManagementState {
  Product product;
  List<DeviceQueryResult> deviceQueryResult;
  MachineManagementStateLoaded(this.deviceQueryResult, this.product);
  @override
  List<Object?> get props => [deviceQueryResult];
}

class MachineManagementStateLoadFail extends MachineManagementState {}
