import 'package:equatable/equatable.dart';

import 'mold.dart';

class Product extends Equatable {
  final String? id;
  final String? name;
  final Mold? mold;
  final int? unit;
  final int? piecesPerKilogram;
 const Product({this.id, this.name, this.mold, this.unit, this.piecesPerKilogram});
  @override
  List<Object?> get props => [id,name,mold,unit,piecesPerKilogram];
}

class Machine extends Equatable {
  final String? id;
  final EmachineType? machineType;
  final String? model;
 const Machine({this.id, this.machineType, this.model});
  @override
  List<Object?> get props => [id, machineType, model];
}

class Configuration extends Equatable {
  final Product? product;
  final Machine? machine;
  final double? injectionCycle;
  final int? quanlity;
  final DateTime? productionDate;
  final Eshift? shift;
 const Configuration(
      {this.product,
      this.machine,
      this.injectionCycle,
      this.quanlity,
      this.productionDate,
      this.shift});
  @override
  List<Object?> get props => [product, machine, injectionCycle, quanlity, productionDate, shift];
}
