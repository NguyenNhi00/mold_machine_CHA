// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:injection_molding_machine_application/presentation/widgets/constant.dart';

class MachinesManagementScreen extends StatefulWidget {
  @override
  _MachinesManagementScreenState createState() =>
      _MachinesManagementScreenState();
}

class _MachinesManagementScreenState extends State<MachinesManagementScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(text: "Tất cả"),
                Tab(text: "Đang chạy"),
                Tab(text: "Cảnh báo"),
                Tab(text: "Lỗi"),
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
          body: GridView.count(
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 4,
            crossAxisCount: 2,
            children: <Widget>[
              Column(
                children: [
                  const Text('2. Máy ép M25'),
                  GestureDetector(
                    child: Container(
                      child: Image.asset(
                        'lib/assets/may_ep.jpg',
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/DeviceQueryResultViewn');
                    },
                  ),
                ],
              ),
              // Column(
              //   children: [
              //     const Text('2. Máy ép M25'),
              //     Image.asset(
              //       'lib/assets/may_ep.jpg',
              //     ),
              //   ],
              // ),
              // Column(
              //   children: [
              //     const Text('3. Máy ép M25'),
              //     Image.asset('lib/assets/may_ep.jpg'),
              //   ],
              // ),
              // Column(
              //   children: [
              //     const Text('4. Máy ép M25'),
              //     Image.asset('lib/assets/may_ep.jpg'),
              //   ],
              // ),
              // Column(
              //   children: [
              //     const Text('5. Máy ép M25'),
              //     Image.asset(
              //       'lib/assets/may_ep.jpg',
              //     ),
              //   ],
              // ),
              // Column(
              //   children: [
              //     const Text('6. Máy ép M25'),
              //     Image.asset(
              //       'lib/assets/may_ep.jpg',
              //     ),
              //   ],
              // ),
              // Column(
              //   children: [
              //     const Text('7. Máy ép M25'),
              //     Image.asset(
              //       'lib/assets/may_ep.jpg',
              //     ),
              //   ],
              // ),
              // Column(
              //   children: [
              //     const Text('8. Máy ép M25'),
              //     Image.asset('lib/assets/may_ep.jpg'),
              //   ],
              // ),
              // Column(
              //   children: [
              //     const Text('9. Máy ép M25'),
              //     Image.asset(
              //       'lib/assets/may_ep.jpg',
              //     ),
              //   ],
              // ),
              // Column(
              //   children: [
              //     const Text('10. Máy ép M25'),
              //     Image.asset(
              //       'lib/assets/may_ep.jpg',
              //     ),
              //   ],
              // ),
              // Column(
              //   children: [
              //     const Text('11. Máy ép M25'),
              //     Image.asset(
              //       'lib/assets/may_ep.jpg',
              //     ),
              //   ],
              // ),
              // Column(
              //   children: [
              //     const Text('12. Máy ép M25'),
              //     Image.asset('lib/assets/may_ep.jpg'),
              //   ],
              // ),
              // Column(
              //   children: [
              //     const Text('13. Máy ép M25'),
              //     Image.asset(
              //       'lib/assets/may_ep.jpg',
              //     ),
              //   ],
              // ),
              // Column(
              //   children: [
              //     const Text('14. Máy ép M25'),
              //     Image.asset(
              //       'lib/assets/may_ep.jpg',
              //     ),
              //   ],
              // ),
              // Column(
              //   children: [
              //     const Text('15. Máy ép M25'),
              //     Image.asset(
              //       'lib/assets/may_ep.jpg',
              //     ),
              //   ],
              // ),
              // Column(
              //   children: [
              //     const Text('16. Máy ép M25'),
              //     Image.asset(
              //       'lib/assets/may_ep.jpg',
              //     ),
              //   ],
              // ),
            ],
          ),
        ));
  }
}
