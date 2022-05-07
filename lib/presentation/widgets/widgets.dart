import 'package:flutter/material.dart';
import 'constant.dart';

class CustomizedButton extends StatelessWidget {
  String text;
  double padding;
  double width, height, radius;
  Color bgColor;
  Color fgColor;
  VoidCallback onPressed;
  double fontSize;
  CustomizedButton(
      {this.text = "Tên nút",
      this.width = 100,
      this.height = 50,
      this.padding = 20,
      this.radius = 60,
      this.bgColor = Constants.mainColor,
      this.fgColor = Colors.white,
      required this.onPressed,
      this.fontSize = 30});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: padding),
      child: Container(
        width: width,
        height: height,
        // ignore: deprecated_member_use
        child: RaisedButton(
          disabledColor: Colors.grey,
          color: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, color: fgColor),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class AnnotationContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [Column()],
      ),
    );
  }
}

class CircularLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 60,
              height: 60,
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Constants.mainColor),
                strokeWidth: 6.0,
              )),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Đang tải dữ liệu",
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}

class IconAnnotation extends StatelessWidget {
  final Color color;
  const IconAnnotation({this.color = Colors.blue});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 30,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
    );
  }
}

class TextAnnotation extends StatelessWidget {
  final String text;
  const TextAnnotation({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16),
    );
  }
}
