import 'package:injection_molding_machine_application/data/datasources/machine_service.dart';
import 'package:injection_molding_machine_application/data/models/product_model.dart';
import 'package:injection_molding_machine_application/domain/entities/configuration.dart';
import 'package:injection_molding_machine_application/domain/repositories/machine_repoisitory.dart';

class MachineRepositoryImpl extends MachineRepository {
  final MachineService _machineService;
  MachineRepositoryImpl(this._machineService);
  @override
  Future<ProductModel> getMachineDetail() {
    return _machineService.getMachinesData();
  }
}
