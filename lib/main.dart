import 'package:flutter/material.dart';
import 'package:hala_task/data/home_provider.dart';
import 'package:hala_task/data/sign_up_provider.dart';
import 'package:hala_task/data/splash_provider.dart';
import 'package:hala_task/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'app/shard_pref.dart';
import 'data/sign_in_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();



  runApp(

    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeProvider(),),
          ChangeNotifierProvider(create: (context) => SplashProvider(),),
          ChangeNotifierProvider(create: (context) => SignInProvider(),),
          ChangeNotifierProvider(create: (context) => SignUpProvider(),),
        ],
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder:  (context, widget) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: widget!,

          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'din-next-lt-w23-regular.ttf'
          // primarySwatch: Colors.blue,
        ),

        home: SplashScreen()
    );
  }
}
