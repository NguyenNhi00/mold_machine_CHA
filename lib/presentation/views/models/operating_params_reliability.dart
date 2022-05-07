// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:injection_molding_machine_application/presentation/widgets/constant.dart';

class MonitorOperatingParamsReli extends StatefulWidget {
  String text1;
  String text2;
  String text3;
  String data1 = "";
  String data2 = "";
  String data3 = "";
  MonitorOperatingParamsReli({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.data1,
    required this.data2,
    required this.data3,
  }) : super(key: key);
  @override
  _MonitorOperatingParamsReliState createState() =>
      _MonitorOperatingParamsReliState();
}

class _MonitorOperatingParamsReliState
    extends State<MonitorOperatingParamsReli> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              widget.text1,
              // "Mã sản phẩm",
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            Text(
              widget.text2,
              //"Số lượng kế hoạch",
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            Text(
              widget.text3,
              //"Số lượng thực tế",
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
        SizedBox(width: SizeConfig.screenWidth * 0.08662),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: SizeConfig.screenWidth * 0.4241,
              height: SizeConfig.screenHeight * 0.03841,
              decoration: const BoxDecoration(color: Colors.black26),
              child: Center(child: Text(widget.data1)),
            ),
            Container(
              width: SizeConfig.screenWidth * 0.4241,
              height: SizeConfig.screenHeight * 0.03841,
              decoration: const BoxDecoration(color: Colors.black26),
              child: Center(child: Text(widget.data2)),
            ),
            Container(
              width: SizeConfig.screenWidth * 0.4241,
              height: SizeConfig.screenHeight * 0.03841,
              decoration: const BoxDecoration(color: Colors.black26),
              child: Center(child: Text(widget.data3)),
            ),
          ],
        ),
      ],
    );
  }
}
