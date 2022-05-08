import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injection_molding_machine_application/domain/entities/node_query_result.dart';
import 'package:injection_molding_machine_application/injector.dart';
import 'package:injection_molding_machine_application/presentation/blocs/bloc/machine_details_bloc.dart';
import 'package:injection_molding_machine_application/presentation/blocs/bloc/machine_management_bloc.dart';
import 'package:injection_molding_machine_application/presentation/blocs/event/machines_management_event.dart';
import 'package:injection_molding_machine_application/presentation/views/device_query_result_screen.dart';
import 'package:injection_molding_machine_application/presentation/views/machine_details_screen.dart';
import 'package:injection_molding_machine_application/presentation/views/mode_screen.dart';
import 'package:injection_molding_machine_application/presentation/widgets/global.dart';

class AppRouter {
  static NodeQueryResult nodeQueryResult = NodeQueryResult('', false, []);
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => AllModeScreen());
      case '/DeviceQueryResultView':
        return MaterialPageRoute(
         builder: (context) => BlocProvider<MachineDetailsBloc>(create: (context)=> injector(),
          child: DeviceQueryResultView(),
          ),
        );
      case '/MachineDetailsScreen':
        return MaterialPageRoute(
           builder: (context) => BlocProvider<MachinesManagementBloc>(create: (context)=> injector()..add(FetchDetailMachinesEvent()),
           child: MachineDetailsScreen(Global.deviceQuery)));
      default:
        return MaterialPageRoute(builder: (context) => AllModeScreen());
    }
  }
}
