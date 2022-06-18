part of'home_widgets_imports.dart';
class BuildTotalPayment extends StatelessWidget {
  const BuildTotalPayment({
    Key? key,
    required this.mediaQuery,
    required this.controller,
  }) : super(key: key);

  final Size mediaQuery;
  final HomeProvider controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: mediaQuery.width*.8-16,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.mainColorAmber,
        ),
        child: Row(
          children:  [
            const CustomText(
              text: 'إجمالي المدفوعات',
              color:Color(0xff009877),
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
            const Expanded(child: SizedBox()),
            CustomText(
              text: '${controller.homePaymentModel!.dateSet!.totalRecords}',
              color:const Color(0xff009877),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            const SizedBox(width: 5,),
            const CustomText(
              text: 'ريال سعودي',
              color:Color(0xff009877),
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ],
        ),
      ),
    );
  }
}