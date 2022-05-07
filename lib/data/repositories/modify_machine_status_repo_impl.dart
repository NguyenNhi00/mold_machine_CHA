import 'package:injection_molding_machine_application/data/datasources/modify_status_machine_service.dart';
import 'package:injection_molding_machine_application/domain/repositories/modify_machine_status_repository.dart';

class ModifyStatusMachineRepositoryImpl
    implements ModifyStatusMachineRepository {
  final ModifyStatusMachineService _modifyStatusMachineService;
  ModifyStatusMachineRepositoryImpl(this._modifyStatusMachineService);
  @override
  Future<void> requestModifyMachineStatus() {
    // TODO: implement requestModifyMachineStatus
    throw UnimplementedError();
  }
}
