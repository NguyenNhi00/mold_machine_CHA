import 'package:injection_molding_machine_application/data/models/product_model.dart';
import 'package:injection_molding_machine_application/domain/entities/configuration.dart';

abstract class MachineRepository {
  Future<Product> getMachineDetail();
}
