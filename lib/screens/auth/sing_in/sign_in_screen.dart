part of'sign_in_imports.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final ref = SignInProvider.get(context);
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
          child: BuildInputsSignInFields(controller: ref, mediaQuery: mediaQuery),
        )

    );
  }
}


