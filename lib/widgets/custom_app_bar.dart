import 'package:flutter/material.dart';
import 'package:hala_task/widgets/custom_text_field.dart';
import '../app/app_colors.dart';


class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Widget? titleContent;
  final Widget? leadingWidget;

  CustomAppBar({Key? key,  this.titleContent,  this.leadingWidget}) : preferredSize = const Size.fromHeight(60.0), super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;


    return AppBar(

    title: titleContent??CustomTextField(
    height: 30,
    width: mediaQuery.width * .25,
    iconWidget: const Icon(
    Icons.search,
    color: AppColors.primaryColorBrown,
    )),
    centerTitle: true,
    leading: leadingWidget??Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: Image.asset('assets/images/spoon-logo-01.png'),
    ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset(
            'assets/images/Menu icon.png',
            height: 27,
            width: 30,
          ),
        ),

      ],
    //  automaticallyImplyLeading: false,
      // shadowColor: Colors.indigo[700],
      elevation: 0,
      backgroundColor: AppColors.mainColorGrey,
      //toolbarHeight: 50,
      // shape: ContinuousRectangleBorder(
      //   borderRadius: const BorderRadius.only(
      //     bottomLeft: const Radius.circular(80),
      //     bottomRight: Radius.circular(80),
      //   ),
      // ),
      // title: CircleAvatar(
      //   radius: 30,
      //   backgroundImage: AssetImage('images/2.png'),
      // ),
    );
  }
}






// AppBar(
//   elevation: 0,
//   backgroundColor: AppColors.mainColorGrey,
//   title: CustomTextField(
//     height: 30,
//     width: mediaQuery.width * .25,
//     iconWidget: const Icon(
//       Icons.search,
//       color: AppColors.primaryColorBrown,
//     ),
//   ),
//   centerTitle: true,
//   leading: Padding(
//     padding: const EdgeInsets.only(left: 8.0),
//     child: Image.asset('assets/images/spoon-logo-01.png'),
//   ),
//   actions: [
//     Padding(
//       padding: const EdgeInsets.only(right: 8.0),
//       child: Image.asset(
//         'assets/images/Menu icon.png',
//         height: 27,
//         width: 30,
//       ),
//     ),
//   ],
// ),
