import 'package:injection_molding_machine_application/data/models/machine_model.dart';
import 'package:injection_molding_machine_application/data/models/product_model.dart';
import 'package:injection_molding_machine_application/domain/entities/configuration.dart';
import 'package:injection_molding_machine_application/domain/entities/mold.dart';

class ConfigurationModel extends Configuration {
  const ConfigurationModel({
    Product? product,
    Machine? machine,
    double? injectionCycle,
    int? quanlity,
    DateTime? productionDate,
    Eshift? shift,
  }) : super(
            product: product,
            machine: machine,
            injectionCycle: injectionCycle,
            quanlity: quanlity,
            productionDate: productionDate,
            shift: shift);

  factory ConfigurationModel.fromJson(Map<String, dynamic> json) {
    return ConfigurationModel(
      product: json["product"] != null? ProductModel.fromJson(json['product']): null,
      machine: json["machine"] != null? MachineModel.fromJon(json['machine']): null,
      injectionCycle: json["injectionCycle"],
      quanlity: json["quanlity"],
      productionDate: json["productionDate"] ,
      shift: json["shift"] ,
    );
  }
}
