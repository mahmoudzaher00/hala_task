part of'sign_in_widgets_import.dart';

class BuildInputsSignInFields extends StatelessWidget {
  const BuildInputsSignInFields({
    Key? key,
    required this.controller,
    required this.mediaQuery,
  }) : super(key: key);

  final SignInProvider controller;
  final Size mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Form(
      key:controller.signInData.formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        children: [
           SizedBox(height: mediaQuery.height*.09,),
          Image.asset(
            'assets/images/splash_logo.png',
            height: mediaQuery.height*.1,
            width: mediaQuery.width*.4,
          ),
           SizedBox(height:  mediaQuery.height*.04,),
          const CustomText(
            text: 'البريد الإلكتروني',
            color:AppColors.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          SizedBox(height:  mediaQuery.height*.03,),
          BuildTextFieldView(
            controller: controller.signInData.textEditingEmailController,
            hintText: 'mail@gmail.com',
            validatorFunction: controller.textFieldEmailValidator,

          ),
          SizedBox(height:  mediaQuery.height*.04,),
          const CustomText(
            text: 'كلمة المرور',
            color:AppColors.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          SizedBox(height:  mediaQuery.height*.03,),
          BuildTextFieldView(
            controller: controller.signInData.textEditingPasswordController,
            hintText: '*********************',
            validatorFunction: controller.textFieldPassWordValidator,
            obscure: controller.password,
            textType: TextInputType.visiblePassword,
            suffixIconWidget: IconButton(
              icon: Icon(
                  controller.passwordState(),
                  color: AppColors.mainColorIndigo,size: 18
              ) ,
              onPressed: (){
                controller.passwordVisible();
              },
            ) ,

          ),
          const SizedBox(height: 20,),
          CustomButton(
            text: 'دخول',
            background: AppColors.mainColorIndigo,
            height: 50,
            onPressed:(){controller.sendDataToSignIn(context);}
          ),
          SizedBox(height:  mediaQuery.height*.04,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: 'ليس لديك حساب / ',
                color:AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                },
                child: const CustomText(
                  text: 'تسجيل جديد',
                  color:AppColors.mainColorIndigo,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 15,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}