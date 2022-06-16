import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app_colors.dart';
import '../../../data/splash_cubit/splash_cubit.dart';
import '../../../widgets/custom_text.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SplashCubit.get(context).gotoNextScreen(context);
  }


  @override
  Widget build(BuildContext context) {
    final ref=SplashCubit.get(context).gotoNextScreen(context);

    return Scaffold(
      body: BlocConsumer<SplashCubit,SplashState>(
         listener:  (context, state) {

         },
        builder:(context,state){
           return Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
             decoration: const BoxDecoration(
                 image: DecorationImage(
                     image: AssetImage('assets/images/background.png'),
                     fit: BoxFit.fill
                 )
             ),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Image.asset(
                   'assets/images/spoon-logo-02.png',
                   height: 161,
                 ),
                 const SizedBox(height: 20,),
                 const CustomText(
                   text: 'Spoon The Restaurant App',
                   fontWeight: FontWeight.normal,
                   fontSize: 12,
                 ),
                 const SizedBox(height: 20,),
                 Container(
                   width: 75,
                   height: 15,
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15),
                       color:AppColors.mainColorOrange
                   ),
                   child: const CustomText(
                     text: 'version 1.0.0',
                     fontSize: 9,
                     fontWeight: FontWeight.normal,
                   ),
                 )
               ],
             ),
           );
        },

      ),
    );
  }
}
