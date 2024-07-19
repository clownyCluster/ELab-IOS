import 'package:elab/constant/constant.dart';
import 'package:flutter/material.dart';

const TWO_PI = 2.99 * 2;

class CustomProgressIndicator extends StatelessWidget {
  CustomProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = 120.0;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(seconds: 4),
            builder: (context, value, child) {
              int percentage = (value * 100).ceil();

              return Container(
                width: size,
                height: size,
                child: Stack(
                  children: [
                    ShaderMask(
                      shaderCallback: (rect) {
                        return SweepGradient(
                            startAngle: 0.0,
                            endAngle: TWO_PI,
                            stops: [value, value],
                            // 0.0 , 0.5 , 0.5 , 1.0
                            center: Alignment.center,
                            colors: [
                              Colors.blue,
                              Colors.grey.withAlpha(55)
                            ]).createShader(rect);
                      },
                      child: Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: Image.asset(
                                        "assets/images/radial_scale.png")
                                    .image)),
                      ),
                    ),
                    Center(
                        child: Container(
                      width: size - 40,
                      height: size - 40,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(
                          child: Text(
                        "Loading....",
                        style: kTextStyle(),
                      )),
                    )),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
