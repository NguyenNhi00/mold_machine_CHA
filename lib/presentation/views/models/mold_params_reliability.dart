// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:injection_molding_machine_application/presentation/widgets/constant.dart';

class MoldParamsReli extends StatefulWidget {
  String text4;
  String text5;
  String text6;
  String text7;
  String text8;
  String data4 = "";
  String data5 = "";
  String data6 = "";
  String data7 = "";
  String data8 = "";
  MoldParamsReli({
    Key? key,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
    required this.text8,
    required this.data4,
    required this.data5,
    required this.data6,
    required this.data7,
    required this.data8,
  }) : super(key: key);
  @override
  _MoldParamsReliState createState() => _MoldParamsReliState();
}

class _MoldParamsReliState extends State<MoldParamsReli> {
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
              widget.text4,
              // "Mã số khuôn",
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            Text(
              widget.text5,
              //"Chu kỳ ép",
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            Text(
              widget.text6,
              //"Thời gian mở cửa",
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            Text(
              widget.text7,
              //"Chế độ vận hành",
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            Text(
              widget.text8,
              //"Số lượng sản phẩm một lần ep",
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
              child: Center(child: Text(widget.data4)),
            ),
            Container(
              width: SizeConfig.screenWidth * 0.4241,
              height: SizeConfig.screenHeight * 0.03841,
              decoration: const BoxDecoration(color: Colors.black26),
              child: Center(child: Text(widget.data5)),
            ),
            Container(
              width: SizeConfig.screenWidth * 0.4241,
              height: SizeConfig.screenHeight * 0.03841,
              decoration: const BoxDecoration(color: Colors.black26),
              child: Center(child: Text(widget.data6)),
            ),
            Container(
              width: SizeConfig.screenWidth * 0.4241,
              height: SizeConfig.screenHeight * 0.03841,
              decoration: const BoxDecoration(color: Colors.black26),
              child: Center(child: Text(widget.data7)),
            ),
            Container(
              width: SizeConfig.screenWidth * 0.4241,
              height: SizeConfig.screenHeight * 0.03841,
              decoration: const BoxDecoration(color: Colors.black26),
              child: Center(child: Text(widget.data8)),
            ),
          ],
        ),
      ],
    );
  }
}
