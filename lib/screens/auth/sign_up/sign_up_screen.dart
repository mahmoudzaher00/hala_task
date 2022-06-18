part of'sign_up_imports.dart';


class SignUpScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final controller = SignUpProvider.get(context);
    return Scaffold(
        body:Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background_screen.png'),
                  fit: BoxFit.fill
              )
          ),
          child: BuildInputsSignUpFields(controller: controller, mediaQuery: mediaQuery),
        )

    );
  }
}


