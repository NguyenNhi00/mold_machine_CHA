import 'package:injection_molding_machine_application/domain/entities/configuration.dart';
import 'package:injection_molding_machine_application/domain/entities/mold.dart';

class ProductModel extends Product {
  const ProductModel({
    String? id,
    Mold? mold,
    String? name,
    int? unit,
    int? piecesPerKilogram,
  }):super(id: id,
  mold: mold,
  name: name,
  piecesPerKilogram: piecesPerKilogram,
  unit: unit);
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      mold: json['mold'] != null ?  MoldModel.fromJson(json['mold']) : null,
      name: json['name'] as String,
      piecesPerKilogram: json['piecesPerKilogram'] as int ,
      unit: json['unit'] as int,
    );
  }
}

class MoldModel extends Mold {
  const MoldModel({
     String? id,
     int? standardInjectionCycle,
     int? standardOpenTime,
     int? injectionCycleTolerance,
     int? openTimeTolerance,
     bool? automatic,
     int? productsPerShot,
  }) : super(
          id: id,
          standardInjectionCycle: standardInjectionCycle,
          standardOpenTime: standardOpenTime,
          automatic: automatic,
          productsPerShot: productsPerShot,
          injectionCycleTolerance: injectionCycleTolerance,
          openTimeTolerance: openTimeTolerance,
          // moldModel: moldModel,
        );

  factory MoldModel.fromJson(Map<String, dynamic> json) {
    return MoldModel(
    id : json['id'] as String,
    standardInjectionCycle : json['standardInjectionCycle'] as int,
    standardOpenTime : json['standardOpenTime'] as int,
    injectionCycleTolerance :json['injectionCycleTolerance'] as int,
    openTimeTolerance: json['openTimeTolerance'] as int,
    //openTimeTolerance : json['openTimeTolerance'],
    automatic : json['automatic'] as bool,
    productsPerShot : json['productsPerShot'] as int,
    );
  }
}
