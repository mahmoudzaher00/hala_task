import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hala_task/data/sign_in_provider.dart';
import 'package:hala_task/screens/home/home_screen.dart';
import 'package:hala_task/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'data/home_cubit/home_cubit.dart';
import 'data/splash_cubit/splash_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // MultiBlocProvider(providers: [
    //   BlocProvider<SplashCubit>(create: (BuildContext context) => SplashCubit(),),
    //   BlocProvider<HomeCubit>(create: (BuildContext context) => HomeCubit(),),
    //
    // ],
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SignInProvider(),),



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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Montserrat-Medium.ttf'
       // primarySwatch: Colors.blue,
      ),

      home:HomeScreen()
    );
  }
}
