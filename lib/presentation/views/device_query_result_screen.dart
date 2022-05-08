import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injection_molding_machine_application/data/models/error_package.dart';
import 'package:injection_molding_machine_application/domain/entities/node_query.dart';
import 'package:injection_molding_machine_application/presentation/blocs/bloc/machine_details_bloc.dart';
import 'package:injection_molding_machine_application/presentation/blocs/event/machine_details_event.dart';
import 'package:injection_molding_machine_application/presentation/blocs/state/machine_details_state.dart';
import 'package:injection_molding_machine_application/presentation/widgets/constant.dart';
import 'package:injection_molding_machine_application/presentation/widgets/global.dart';
import 'package:signalr_core/signalr_core.dart';

class DeviceQueryResultView extends StatefulWidget {
  _DeviceQueryResultViewState createState() => _DeviceQueryResultViewState();
}

class _DeviceQueryResultViewState extends State<DeviceQueryResultView> {
  late HubConnection hubConnection;
  final List<DeviceQuery> connectedDeviceQuery = [];
  final List<DeviceQuery> disconnectedDeviceQuery = [];
  List<DeviceQuery> deviceQueries = [];
  String deviceId = ''; // ma may
  String data1 = "null"; // ma san pham
  String data2 = "null"; // so luong ke hoach
  String data3 = "null"; // so luong thuc te
  String data4 = "CycleTime";
  String data5 = "OpenTime";
  String data6 = "CounterShot";
  String data7 = "SetCycle";
  String data8 = "MachineStatus";
  bool warning = false;
  bool running = false;
  @override
  void initState() {
    super.initState();
    try {
      hubConnection = HubConnectionBuilder()
          .withUrl(Constants.signalRUrl)
          .withAutomaticReconnect()
          .build();
      hubConnection.keepAliveIntervalInMilliseconds = 10000;
      hubConnection.serverTimeoutInMilliseconds = 10000;
      hubConnection.onclose((error) {
        return error != null
            ? BlocProvider.of<MachineDetailsBloc>(context).add(
                MachineDetailsEventConnectFail(
                    errorPackage: ErrorPackage(
                        errorCode: "error",
                        message: "Ngắt kết nối",
                        detail: "Đã ngắt kết nối đến máy chủ!")))
            : null;
      });
      hubConnection.on('machineDetailsHandlers', machineDetailsHandlers);
    } on TimeoutException {
      BlocProvider.of<MachineDetailsBloc>(context).add(
          MachineDetailsEventConnectFail(
              errorPackage: ErrorPackage(
                  errorCode: "erro",
                  message: "Không tìm thấy máy chủ",
                  detail: "Vui lòng kiểm tra đường truyền!")));
    } on SocketException {
      BlocProvider.of<MachineDetailsBloc>(context).add(
          MachineDetailsEventConnectFail(
              errorPackage: ErrorPackage(
                  errorCode: "erro",
                  message: "Không tìm thấy máy chủ",
                  detail: "Vui lòng kiểm tra đường truyền!")));
    } catch (e) {
      BlocProvider.of<MachineDetailsBloc>(context).add(
          MachineDetailsEventConnectFail(
              errorPackage: ErrorPackage(
                  errorCode: "error",
                  message: "Lỗi xảy ra",
                  detail: e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(text: "Tất cả"),
                Tab(text: "Đang chạy"),
              ],
            ),
            title: const Text('Quản lý máy ép'),
            backgroundColor: Constants.mainColor,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ),
          endDrawer: Drawer(
          backgroundColor: Constants.secondaryColor,
          child: Column(
            children: [
              Container(
                width: SizeConfig.screenWidth * 0.7421,
                height: SizeConfig.screenHeight * 0.4659,
                decoration: const BoxDecoration(
                    color: Constants.mainColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35.0),
                        bottomRight: Radius.circular(35.0))),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.0664,
                    ),
                    Icon(
                      Icons.account_circle_rounded,
                      size: SizeConfig.screenHeight * 0.2659,
                      color: Colors.white,
                    ),
                    const Text(
                      'Người Kiểm Tra:',
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.0468,
                        top: SizeConfig.screenHeight * 0.0797),
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings_outlined,
                          size: SizeConfig.screenHeight * 0.0398,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.0156,
                        ),
                        const Text(
                          'Cài Đặt',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.0398,
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.0468),
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            size: SizeConfig.screenHeight * 0.0398,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth * 0.0156,
                          ),
                          const Text(
                            'Đăng Xuất',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/');
                    },
                  )
                ],
              ),
            ],
          ),
        ),
          body: BlocConsumer<MachineDetailsBloc, MachineDetailsState>(
              listener: (context, machineDetailsState) async {
            if (machineDetailsState is MachineDetailsStateConnectSuccessful) {
            } else if (machineDetailsState is MachineDetailsStateDataUpdated) {
              data4 = machineDetailsState
                  .nodeQuery
                  .deviceQueries[Global.machineindex]
                  .tagName[Global.machineindex][0]
                  .toString();
              data5 = machineDetailsState
                  .nodeQuery
                  .deviceQueries[Global.machineindex]
                  .tagName[Global.machineindex][1]
                  .toString();
              data6 = machineDetailsState
                  .nodeQuery
                  .deviceQueries[Global.machineindex]
                  .tagName[Global.machineindex][2]
                  .toString();
              data7 = machineDetailsState
                  .nodeQuery
                  .deviceQueries[Global.machineindex]
                  .tagName[Global.machineindex][3]
                  .toString();
              data8 = machineDetailsState
                  .nodeQuery
                  .deviceQueries[Global.machineindex]
                  .tagName[Global.machineindex][4]
                  .toString();
            }
          }, builder: (context, machineDetailState) {
            if (machineDetailState is MachineDetailsStateDataUpdated) {
              return TabBarView(
                children: [
                  GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: SizeConfig.screenWidth * 0.0650,
                      crossAxisCount: 2,
                    ),
                    itemCount: Global.machineLengh,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(deviceQueries[index].deviceId.toString()),
                          Expanded(
                            child: GestureDetector(
                              child: Image(
                                image:
                                    const AssetImage('lib/assets/may_ep.jpg'),
                                width: SizeConfig.screenWidth * 0.3650,
                              ),
                              onTap: () {
                                Global.deviceQuery = deviceQueries[index];
                                Navigator.pushNamed(
                                    context, '/MachineDetailsScreen');
                                Global.machineindex = index;
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                bool.fromEnvironment(
                                        deviceQueries[index].tagName[4])
                                    ? Icons.check_box_rounded
                                    : Icons.check_box_outline_blank_rounded,
                                color: bool.fromEnvironment(
                                        deviceQueries[index].tagName[4])
                                    ? Colors.green
                                    : Colors.red,
                                size: 20,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                bool.fromEnvironment(
                                        deviceQueries[index].tagName[4])
                                    ? "Đang kết nối"
                                    : "Ngắt kết nối",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: bool.fromEnvironment(
                                            deviceQueries[index].tagName[4])
                                        ? Colors.green
                                        : Colors.red),
                              ),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  // machines connecting creen
                  GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: SizeConfig.screenWidth * 0.0650,
                      crossAxisCount: 2,
                    ),
                    itemCount: connectedDeviceQuery.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(connectedDeviceQuery[index].deviceId.toString()),
                          Expanded(
                            child: GestureDetector(
                              child: Image(
                                image:
                                    const AssetImage('lib/assets/may_ep.jpg'),
                                width: SizeConfig.screenWidth * 0.3650,
                              ),
                              onTap: () {
                                Global.deviceQuery = deviceQueries[index];
                                Navigator.pushNamed(
                                    context, '/MachineDetailsScreen');
                                Global.machineindex = index;
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                bool.fromEnvironment(connectedDeviceQuery[index]
                                        .tagName[4]
                                        .toString())
                                    ? Icons.check_box_rounded
                                    : Icons.check_box_outline_blank_rounded,
                                color: bool.fromEnvironment(
                                        connectedDeviceQuery[index]
                                            .tagName[4]
                                            .toString())
                                    ? Colors.green
                                    : Colors.red,
                                size: 20,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                bool.fromEnvironment(connectedDeviceQuery[index]
                                        .tagName[4]
                                        .toString())
                                    ? "Đang kết nối"
                                    : "Ngắt kết nối",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: bool.fromEnvironment(
                                            connectedDeviceQuery[index]
                                                .tagName[4]
                                                .toString())
                                        ? Colors.green
                                        : Colors.red),
                              ),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ));
  }

  // ham hung du lieu tu SignalR
  void machineDetailsHandlers(List<dynamic>? data) {
    print('data get from server: ${data}');
    for (int i = 0; i < data!.length; i++) {
      Global.machineLengh = data.length;
      Map<String,dynamic> tagName = {
        deviceQueries[i].tagName[i][1]: data[i]['tagName']
            ['${data[i]['deviceId']}.CycleTime'],
        deviceQueries[i].tagName[i][2]: data[i]['tagName']
            ['${data[i]['deviceId']}.CycleTime'],
        deviceQueries[i].tagName[i][3]: data[i]['tagName']
            ['${data[i]['deviceId']}.CycleTime'],
        deviceQueries[i].tagName[i][4]: data[i]['tagName']
            ['${data[i]['deviceId']}.CycleTime'],
        deviceQueries[i].tagName[i][5]: data[i]['tagName']
            ['${data[i]['deviceId']}.CycleTime'],
      };
      Map<String, dynamic> deviceid = {
        deviceQueries[i].deviceId[i]: data[i]['deviceId'],
      };
      deviceQueries.add(DeviceQuery(deviceId: deviceid[i], tagName: tagName[i]));
    }
    machineManagementdevided();

    print(Map<String, dynamic>.from(data[Global.machineindex])["alarm"]);
    BlocProvider.of<MachineDetailsBloc>(context).add(
        MachineDetailsEventDataUpDated(
            timestamp: DateTime.now(),
            nodeQuery: NodeQuery(
                deviceQueries: deviceQueries,
                eonNodeId: Map<String, dynamic>.from(data[0])['eonNodeId'])));
  }

  void machineManagementdevided() {
    for (int i = 0; i < deviceQueries.length; i++) {
      if (bool.fromEnvironment(deviceQueries[i].tagName[i][4]) == true) {
        connectedDeviceQuery.add(deviceQueries[i]);
      } else {
        disconnectedDeviceQuery.add(deviceQueries[i]);
      }
    }
  }
}
