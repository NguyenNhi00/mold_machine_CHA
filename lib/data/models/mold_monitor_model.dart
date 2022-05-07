import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injection_molding_machine_application/domain/entities/mold_monitor.dart';

class MoldMonitorModel extends MoldMonitor {
  MoldMonitorModel(
      {required bool? alarm,
      required bool? running,
      required String? maSanPham,
      required int? soLuongKeHoach,
      required int soLuongThucTe})
      : super(
            alarm: alarm,
            running: running,
            maSanPham: maSanPham,
            soLuongKeHoach: soLuongKeHoach,
            soLuongThucTe: soLuongThucTe);

  // factory MoldMonitorModel.fromJson(Map<String, dynamic> json) {
  //   return MoldMonitorModel(
  //     alarm: json["alarm"] as bool,
  //     running: json["running"] as bool,
  //     maSanPham: json["maSanPham"] as String,
  //     soLuongKeHoach: json["soLuongKeHoach"] as int,
  //     soLuongThucTe: json["soLuongThucTe"] as int,
  //   );
  // }

}
