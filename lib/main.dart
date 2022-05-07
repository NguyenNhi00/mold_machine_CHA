import 'package:flutter/material.dart';
import 'package:injection_molding_machine_application/presentation/router/app_router.dart';

import 'injector.dart';

Future<void> main() async {
  await initialDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.onGenerateRoute,
      title: 'KHU MAY EP',
      //initialRoute: '/',
      //routes:{
      //'/' : (context) => AllModeScreen(),
      //'/second': (context) =>MaterialApp(
      // home: Scafford(body: BlocProvider<LoginBloc>(create: (context) => injector(),
      // child: MachinesManagementScreen(),),
      //  ),
      // ),
      //'/'
      //'/thirdth' : (context) =>MachineDetailsScreen(),
      //'/fourth': (context) => MachinesManagementScreen(),
      //'/five': (context) => MachineDetailsScreen(),
      //},
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
    );
  }
}
