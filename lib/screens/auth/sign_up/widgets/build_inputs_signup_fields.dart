part of'sign_up_widgets_imports.dart';
class BuildInputsSignUpFields extends StatelessWidget {
  const BuildInputsSignUpFields({
    Key? key,
    required this.controller,
    required this.mediaQuery,
  }) : super(key: key);

  final SignUpProvider controller;
  final Size mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signUpData.formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        children: [
          SizedBox(height: mediaQuery.height*.04,),
          Image.asset(
            'assets/images/splash_logo.png',
            height: mediaQuery.height*.1,
            width: mediaQuery.width*.4,
          ),
          SizedBox(height: mediaQuery.height*.02,),
          const CustomText(
            text: 'الاسم',
            color:AppColors.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          SizedBox(height: mediaQuery.height*.01,),
          BuildTextFieldView(
            controller: controller.signUpData.textEditingFullNameController,
            hintText: 'full name',
            textType: TextInputType.name,
            validatorFunction: controller.textFieldFullNameValidator,
          ),
          SizedBox(height: mediaQuery.height*.02,),
          const CustomText(
            text: 'البريد الإلكتروني',
            color:AppColors.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          SizedBox(height: mediaQuery.height*.01,),
          BuildTextFieldView(
            controller: controller.signUpData.textEditingEmailController,
            hintText: 'mail@gmail.com',
            textType: TextInputType.emailAddress,
            validatorFunction: controller.textFieldEmailValidator,
          ),
          SizedBox(height: mediaQuery.height*.02,),
          const CustomText(
            text: 'كلمة المرور',
            color:AppColors.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          SizedBox(height: mediaQuery.height*.01,),
          BuildTextFieldView(
            controller: controller.signUpData.textEditingPasswordController,
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
          SizedBox(height: mediaQuery.height*.02,),
          const CustomText(
            text: 'رقم الهاتف',
            color:AppColors.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          SizedBox(height: mediaQuery.height*.01,),
          BuildTextFieldView(
            controller: controller.signUpData.textEditingPhoneNumberController,
            hintText: ' phone number',
            validatorFunction: controller.textFieldPhoneValidator,
            textType: TextInputType.phone,
          ),
          SizedBox(height: mediaQuery.height*.02,),
          const CustomText(
            text: 'برجاء تحديد دور المستخدم',
            color:AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          Row(
            children: [

              Radio(
                  value:'admin',
                  activeColor: AppColors.mainColorIndigo,
                  groupValue: controller.signUpData.userRole,
                  onChanged: controller.selectUserRole
              ),
              const CustomText(
                text: 'ادمن',
                color:AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ],

          ),
          CustomButton(
            // loading: true,
            text: 'تسجيل جديد',
            background: AppColors.mainColorIndigo,
            height: 50,
            onPressed: (){
              controller.sendDataToRegister(context);
            },
          )
        ],
      ),
    );
  }
}