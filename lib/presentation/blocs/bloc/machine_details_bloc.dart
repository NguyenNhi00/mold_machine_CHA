

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injection_molding_machine_application/data/models/error_package.dart';
import 'package:injection_molding_machine_application/data/models/mold_monitor_model.dart';
import 'package:injection_molding_machine_application/data/models/product_model.dart';
import 'package:injection_molding_machine_application/domain/entities/mold.dart';
import 'package:injection_molding_machine_application/domain/entities/mold_monitor.dart';
import 'package:injection_molding_machine_application/presentation/blocs/event/machine_details_event.dart';
import 'package:injection_molding_machine_application/presentation/blocs/state/machine_details_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injection_molding_machine_application/presentation/widgets/constant.dart';
import 'package:signalr_core/signalr_core.dart';
import 'dart:async';
  Mold? moldCurrent;
 MoldMonitor? moldMonitor;
class MachineDetailsBloc extends Bloc<MachineEvent, MachineDetailsState> {
  MachineDetailsBloc()
      : super(MachineDetailsStateInit(
          timestamp: DateTime.now(),
          data1: "null",
          data2: "null",
          data3: "null",
          warning: false,
          running: false,
          data4: "null",
          data5: "null",
          data6: "null",
          data7: "null",
          data8: "null",
          // hubConnectionBuilder:
          // HubConnectionBuilder().withUrl('').build().start()
        ));

  @override
  Stream<MachineDetailsState> mapEventToState(MachineEvent event) async* {
    if (event is MachineDetailsEventHubConnected) {
      yield MachineDetailsStateLoadingRequest(timestamp: event.timestamp);
      event.hubConnection.state == HubConnectionState.disconnected
          ? await event.hubConnection.start()!.onError((error, stackTrace) {
              return MachineDetailsBloc().add(
                  MachineDetailsEventConnectFail(
                      errorPackage: ErrorPackage(
                          errorCode: "error",
                          message: "Ngắt kết nối",
                          detail: "Đã ngắt kết nối tới máy chủ")));
            })
          : await event.hubConnection.stop();
      if (event.hubConnection.state == HubConnectionState.disconnected) {
        // print('Trạng thái hub:' + event.hubConnection.state.toString());
        yield MachineDetailsStateConnectFail(
            errorPackage: ErrorPackage(
                errorCode: "error",
                message: "Ngắt kết nối",
                detail: "Đã ngắt kết nối tới máy chủ"));
      } else if (event.hubConnection.state == HubConnectionState.connected) {
        MoldMonitorModel moldMonitorModel = MoldMonitorModel(
          alarm: false,
          running: false,
          maSanPham: "M25",
          soLuongKeHoach: 0,
          soLuongThucTe: 0,
        );
        MoldModel moldModel = const MoldModel(
          id: "1234",
          standardInjectionCycle: 10,
          standardOpenTime: 10,
          injectionCycleTolerance: 5,
          automatic: true,
          productsPerShot: 0,
        );
        yield MachineDetailsStateConnectSuccessful(
         
        );
      }
    } else if (event is MachineDetailsEventDataUpDated) {
      yield MachineDetailsStateDataUpdated(
        deviceQuery:event.deviceQuery ,
        timestamp: DateTime.now(),
      );
    }
    }
  }
  