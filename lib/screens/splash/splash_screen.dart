import 'package:flutter/material.dart';
import 'package:hala_task/data/splash_provider.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SplashProvider.get(context).gotoNextScreen(context,);
  }


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(

      body:Container(
             alignment: Alignment.center,
             width: mediaQuery.width,
             height: mediaQuery.height,
             decoration: const BoxDecoration(
                 image: DecorationImage(
                     image: AssetImage('assets/images/background_screen.png'),
                     fit: BoxFit.fill
                 )
             ),
             child: Image.asset(
               'assets/images/splash_logo.png',
                height: mediaQuery.height*.2,
                width: mediaQuery.width*.5,
              // height: 161,
             ),
           )

      );
  }
}
