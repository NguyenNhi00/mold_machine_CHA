import 'package:flutter/material.dart';
import 'package:injection_molding_machine_application/domain/entities/node_query_result.dart';
import 'package:injection_molding_machine_application/presentation/widgets/constant.dart';
import '../widgets/widgets.dart';
import 'package:injection_molding_machine_application/presentation/widgets/main_app_name.dart';
class AllModeScreen extends StatefulWidget {
  @override
  _AllModeScreenState createState() => _AllModeScreenState();
}
class _AllModeScreenState extends State<AllModeScreen> {
   NodeQueryResult nodeQueryResult = NodeQueryResult('', false, []);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // drawer: Drawer(
      //   child: ListView(
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Text("Hải Minh bị khùm òi huhu T.T"),
      //         decoration: BoxDecoration(
      //           color: Constants.mainColor,
      //         ),
      //       ),
      //       ListTile(
      //         title: Text("TẤT CẢ"),
      //         onTap: () {
      //           Navigator.pushNamed(context, '/MachinesManagementScreen');
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        title: const Text("Quản lý máy ép"),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        backgroundColor: Constants.mainColor,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(height: SizeConfig.screenHeight * 0.0456),
            MainAppName(text: "KHU MÁY ÉP"),
            SizedBox(
              height: SizeConfig.screenHeight * 0.1024,
            ),
            CustomizedButton(
              text: "TẤT CẢ",
              fontSize: 20,
              width: SizeConfig.screenWidth * 0.3521,
              padding: 70,
              height: SizeConfig.screenHeight * 0.07121,
              onPressed: () {
               Navigator.pushNamed(context, '/DeviceQueryResultView');
              },
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.0028),
            CustomizedButton(
              text: "ĐANG CHẠY",
              fontSize: 20,
              width: SizeConfig.screenWidth * 0.1121,
              padding: 70,
              height: SizeConfig.screenHeight * 0.07121,
              onPressed: () {
                Navigator.pushNamed(context, '/DeviceQueryResultView');
              },
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.0028),
            CustomizedButton(
              text: 'CẢNH BÁO',
              fontSize: 20,
              width: SizeConfig.screenWidth * 0.5121,
              padding: 70,
              height: SizeConfig.screenHeight * 0.07121,
              onPressed: () {
                // Navigator.pushNamed(context, '/deformationreportscreen');
              },
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.0028),
            CustomizedButton(
              text: 'LỖI',
              fontSize: 20,
              width: SizeConfig.screenWidth * 0.1121,
              padding: 70,
              height: SizeConfig.screenHeight * 0.07121,
              onPressed: () {
                //  Navigator.pushNamed(context, '/deformationreportscreen');
              },
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.0028),
          ],
        ),
      ),
    );
  }
}