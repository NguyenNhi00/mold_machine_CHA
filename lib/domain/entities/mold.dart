import 'package:equatable/equatable.dart';

enum EUnit { pieces, kilogram }
enum EmachineType { large, small }
enum Eshift { day, night }

class Mold extends Equatable {
  final String? id;
  final int? standardInjectionCycle;
  final int? standardOpenTime;
  final int? injectionCycleTolerance;
  final int? openTimeTolerance;
  final bool? automatic;
  final int? productsPerShot;
  

  const Mold({
      this.id,
      this.standardInjectionCycle,
      this.standardOpenTime,
      this.injectionCycleTolerance,
      this.openTimeTolerance,
      this.automatic,
      this.productsPerShot, 
      // List<MoldModel>? moldModel,
      
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        standardInjectionCycle,
        standardOpenTime,
        injectionCycleTolerance,
        openTimeTolerance,
        automatic,
        productsPerShot,
      ];
}
