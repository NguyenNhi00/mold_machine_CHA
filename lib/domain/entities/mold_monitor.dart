import 'package:equatable/equatable.dart';

class MoldMonitor extends Equatable {
  final bool? alarm;
  final bool? running;
  final String? maSanPham;
  final int? soLuongKeHoach;
  final int? soLuongThucTe;

  const MoldMonitor(
      {required this.alarm,
      required this.running,
      required this.maSanPham,
      required this.soLuongKeHoach,
      required this.soLuongThucTe});

  @override
  List<Object?> get props =>
      [alarm, running, maSanPham, soLuongKeHoach, soLuongThucTe];
}
