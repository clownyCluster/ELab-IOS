import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  String? name;
  Function onTap;
  String? image;
  Color? color;
  WhiteButton({this.name, required this.onTap, this.image, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(20),
            color: color),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.15,
            // ),
            Image.asset(image!, height: 25, width: 25),
            SizedBox(
              width: 15,
            ),
            Text(
              name!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
    );
  }
}
