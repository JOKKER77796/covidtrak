import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:covidtrak/screens/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: Duration(seconds: 4))
        ..repeat();
  @override
  void dispose() {
    // TODO: implement dispose

    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              AnimatedBuilder(
                  animation: controller,
                  child: Container(
                    height: 200,
                    width: 200,
                    child: const Center(
                        child: Image(
                      image: AssetImage("images/ci.png"),
                    )),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: controller.value * 2 * math.pi,
                      child: child,
                    );
                  }),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Covid\nTracker",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 241, 30, 30)),
                textAlign: TextAlign.center,
              )
            ]),
      )),
    );
  }
}
