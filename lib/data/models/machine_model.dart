import 'package:flutter/material.dart';
import 'package:injection_molding_machine_application/domain/entities/configuration.dart';
import 'package:injection_molding_machine_application/domain/entities/mold.dart';

class MachineModel extends Machine{
  const MachineModel({String? id,
  EmachineType? machineType,
   String? model,});
   factory MachineModel.fromJon(Map<String,dynamic> json){
     return MachineModel(
       id: json['id'] as String,
       machineType: json[' machineType'] as EmachineType,
       model: json['model'] as String,
     );
   }
}