import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injection_molding_machine_application/domain/entities/configuration.dart';
import 'package:injection_molding_machine_application/domain/entities/node_query.dart';
import 'package:injection_molding_machine_application/presentation/blocs/bloc/machine_management_bloc.dart';
import 'package:injection_molding_machine_application/presentation/blocs/state/machines_management_event.dart';
import 'package:injection_molding_machine_application/presentation/views/models/operating_params_reliability.dart';
import 'package:injection_molding_machine_application/presentation/widgets/constant.dart';
import 'package:injection_molding_machine_application/presentation/views/models/mold_params_reliability.dart';
import '../../data/models/error_package.dart';
import '../blocs/bloc/machine_details_bloc.dart';
import '../blocs/event/machine_details_event.dart';
import '../widgets/widgets.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MachineDetailsScreen extends StatefulWidget {
  DeviceQuery devicequery;
  MachineDetailsScreen(this.devicequery);
  @override
  _MachineDetailsScreenState createState() => _MachineDetailsScreenState(devicequery);
}

class _MachineDetailsScreenState extends State<MachineDetailsScreen> {
   DeviceQuery devicequery;
   _MachineDetailsScreenState(this.devicequery);
  String data1 = "null";
  String data2 = "null";
  String data3 = "null";
  String data4 = "null";
  String data5 = "null";
  String data6 = "null";
  String data7 = "null";
  String data8 = "null";
  bool warning = false;
  bool running = false;
  late HubConnection hubConnection;
  List<Configuration> configuration = [];
  Product product = Product();
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
                        message: "Ng???t k???t n???i",
                        detail: "???? ng???t k???t n???i ?????n m??y ch???!")))
            : null;
      });
      hubConnection.on("machineDetailsHandlers", machineDetailsHandlers);
    } on TimeoutException {
      BlocProvider.of<MachineDetailsBloc>(context).add(
          MachineDetailsEventConnectFail(
              errorPackage: ErrorPackage(
                  errorCode: "erro",
                  message: "Kh??ng t??m th???y m??y ch???",
                  detail: "Vui l??ng ki???m tra ???????ng truy???n!")));
    } on SocketException {
      BlocProvider.of<MachineDetailsBloc>(context).add(
          MachineDetailsEventConnectFail(
              errorPackage: ErrorPackage(
                  errorCode: "erro",
                  message: "Kh??ng t??m th???y m??y ch???",
                  detail: "Vui l??ng ki???m tra ???????ng truy???n!")));
    } catch (e) {
      BlocProvider.of<MachineDetailsBloc>(context).add(
          MachineDetailsEventConnectFail(
              errorPackage: ErrorPackage(
                  errorCode: "error",
                  message: "L???i x???y ra",
                  detail: e.toString())));
   }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Th??ng s??? m??y ??p'),
          backgroundColor: Constants.mainColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/DeviceQueryResultView');
            },
          ),
        ),
      body: 
        BlocConsumer<MachinesManagementBloc, MachineManagementState>(
          listener: (context, MachineManagementState state) {
             if (state is MachineManagementStateLoaded) {
              product = state.product;
              print('information: $product');
            }
          },
          builder: (context, MachineDetailsState) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: SizeConfig.screenHeight * 0.0256),
                    const Text(
                      'TH??NG S??? V???N H??NH',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.0128),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            right: 5,
                          ),
                          child: CustomizedButton(
                              text: "T???m d???ng",
                              fontSize: 15,
                              width: SizeConfig.screenWidth * 0.3121,
                              height: SizeConfig.screenHeight * 0.07121,
                              onPressed: () {}),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 5,
                          ),
                          child: CustomizedButton(
                              text: "Ti???p t???c",
                              fontSize: 15,
                              width: SizeConfig.screenWidth * 0.3121,
                              height: SizeConfig.screenHeight * 0.07121,
                              onPressed: () {}),
                        )
                      ],
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.0128),
                    Container(
                      decoration: BoxDecoration(border: Border.all()),
                      width: SizeConfig.screenWidth * 0.8992,
                      height: SizeConfig.screenHeight * 0.1561,
                      child: MonitorOperatingParamsReli(
                        text1: "M?? s???n ph???m",
                        text2: "S??? l?????ng k??? ho???ch",
                        text3: "S??? l?????ng th???c t???",
                        data1: product.id.toString(),
                        data2: '',
                        data3: '',
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.0256),
                    const Text(
                      'TH??NG S??? KHU??N',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.0128),
                    Container(
                      decoration: BoxDecoration(border: Border.all()),
                      width: SizeConfig.screenWidth * 0.8992,
                      height: SizeConfig.screenHeight * 0.2461,
                      child: MoldParamsReli(
                        text4: "M?? s??? khu??n",
                        text5: "Chu k??? ??p",
                        text6: "Th???i gian m??? c???a",
                        text7: "Ch??? ????? v???n h??nh",
                        text8: "S??? s???n ph???m/l???n ??p",
                        data4: product.mold!.id.toString(),
                        data5: devicequery.tagName[0].toString(),
                        data6: devicequery.tagName[1].toString(),
                        data7: product.mold!.automatic.toString(),
                        data8: devicequery.tagName[2].toString(),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.0256),
                    const Text(
                      'B???NG GI??M S??T',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.0356),
                    Container(
                      decoration: BoxDecoration(border: Border.all()),
                      width: SizeConfig.screenWidth * 0.8992,
                      height: SizeConfig.screenHeight * 0.1996,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: SizeConfig.screenHeight * 0.1230,
                                height: SizeConfig.screenHeight * 0.1230,
                                decoration: BoxDecoration(
                                  color:
                                      bool.fromEnvironment(devicequery.tagName[4]) ? Colors.green : Colors.black26,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const Text(
                                "??ANG CH???Y",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: SizeConfig.screenHeight * 0.1230,
                                height: SizeConfig.screenHeight * 0.1230,
                                decoration: BoxDecoration(
                                  color: warning ? Colors.red : Colors.black26,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const Text(
                                "C???NH B??O",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
        );
  }

  void machineDetailsHandlers(List<dynamic>? data) {
    // print(Map<String, dynamic>.from(data![0])["alarm"]);
    // BlocProvider.of<MachineDetailsBloc>(context)
    //     .add(MachineDetailsEventDataUpDated(
    //         configuration: configuration,
    //         //bo dai cho dui @@ qua mit mui
    //         moldMonitor: MoldMonitor(
    //           alarm: Map<String, dynamic>.from(data[0])[" moldMonitor"],
    //           maSanPham: Map<String, dynamic>.from(data[0])["maSanPham"],
    //           running: Map<String, dynamic>.from(data[0])[" running"],
    //           soLuongKeHoach:
    //               Map<String, dynamic>.from(data[0])["soLuongKeHoach"],
    //           soLuongThucTe:
    //               Map<String, dynamic>.from(data[0])["soLuongThucTe"],
    //         ),
    //         timestamp: DateTime.now(),
    //         mold: Mold(
    //           automatic: Map<String, dynamic>.from(data[0])[" automatic"],
    //           id: Map<String, dynamic>.from(data[0])[" id"],
    //           standardInjectionCycle:
    //               Map<String, dynamic>.from(data[0])[" standardInjectionCycle"],
    //           standardOpenTime:
    //               Map<String, dynamic>.from(data[0])["standardOpenTime"],
    //           productsPerShot:
    //               Map<String, dynamic>.from(data[0])["productsPerShot"],
    //           injectionCycleTolerance:
    //               Map<String, dynamic>.from(data[0])["injectionCycleTolerance"],
    //         )));
  }
}
