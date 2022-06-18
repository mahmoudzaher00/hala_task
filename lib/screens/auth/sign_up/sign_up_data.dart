part of'sign_up_imports.dart';
class SignUpData{
  final textEditingFullNameController = TextEditingController();
  final textEditingEmailController = TextEditingController();
  final textEditingPhoneNumberController = TextEditingController();
  final textEditingPasswordController = TextEditingController();
  String? userRole;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
}