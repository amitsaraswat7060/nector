import 'package:flutter/material.dart';

class UiHelper {
  // CustomTextField

  static CustomTextField(
    TextEditingController controller,
    TextInputType keyboardtype,
    bool tohide,
    String hintext,
    IconData icon,
  ) {
    return Container(
      height: 67,
      width: 353,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0XFFF3F2F2)),
      child: Center(
        child: TextField(
          controller: controller,
          keyboardType: keyboardtype,
          obscureText: tohide,
          obscuringCharacter: "*",
          decoration: InputDecoration(
              hintText: hintext,
              hintStyle:
                  const TextStyle(fontSize: 12, color: Color(0XFF181725)),
              prefixIcon: Icon(
                icon,
                color: const Color(0XFF181725),
              ),
              border: InputBorder.none),
        ),
      ),
    );
  }

  // CustomImage

  static CustomImage(String imgurl) {
    return Image.asset("assets/images/$imgurl");
  }

  // Custom Button

  static CustomButton(
    VoidCallback callback,
    String text,
  ) {
    return SizedBox(
      height: 67,
      width: 353,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0XFF53B175),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {
            callback();
          },
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }

  // Custom Text

  static CustomText(
      String text, Color color, FontWeight fontweight, double fontsize) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: fontweight, fontSize: fontsize, color: color),
    );
  }

  // CustomContainer

  static CustomContainer(
      double height, double weight, Color color, Widget widget) {
    return Container(
      height: height,
      width: weight,
      decoration: BoxDecoration(color: color),
      child: widget,
    );
  }
  // Custom Text Button

  static CustomTextButton(VoidCallback callback, String text, Color color,
      double fontsize, FontWeight fontweight) {
    return TextButton(
        onPressed: () {
          callback();
        },
        style: TextButton.styleFrom(elevation: 0),
        child: Text(text,
            style: TextStyle(
                fontWeight: fontweight, fontSize: fontsize, color: color)));
  }

  // Custom Snack bar

  static CustomSnackBar({required String text, required BuildContext context}) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }
}
