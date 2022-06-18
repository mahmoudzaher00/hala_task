
part of'home_widgets_imports.dart';


class BuildFilterDialog extends StatelessWidget {
  const BuildFilterDialog({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomText(
            text: 'من تاريخ',
            color: AppColors.textColor,
            fontSize: 13,
            fontWeight: FontWeight.normal,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Consumer<HomeProvider>(
              builder: (context,notifier,child) {
                return DatePickerWidget(
                  looping: false,
                  firstDate: DateTime(2019, 01, 01),
                  initialDate: DateTime(2020, 01, 01),
                  dateFormat: "dd/MMMM/yyyy",
                  // onChange: (DateTime newDate, _) =>
                  //     homeData.startDateCubit.onUpdateData(newDate.toString()),
                  pickerTheme: const DateTimePickerTheme(
                    itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                    dividerColor: AppColors.greyBorder,

                  ),
                );
              },
            ),
          ),
          const CustomText(
            text: 'إلى تاريخ',
            color: AppColors.textColor,
            fontSize: 13,
            fontWeight: FontWeight.normal,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child:  Consumer<HomeProvider>(
              builder: (context,notifier,child) {
                return DatePickerWidget(
                  looping: false,
                  firstDate: DateTime(2020, 01, 01),
                  initialDate: DateTime(2022, 05, 01),
                  dateFormat: "dd/MMMM/yyyy",
                  // onChange: (DateTime newDate, _) =>
                  //     homeData.endDateCubit.onUpdateData(newDate.toString()),
                  pickerTheme: const DateTimePickerTheme(
                    itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                    dividerColor: AppColors.greyBorder,
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             TextButton(onPressed: (){
               Navigator.pop(context);
             }, child: const CustomText(
               text: 'بحث',
               color: Color(0xffE88342),
             )),
            ],
          )
        ],
      ),
    );
  }
}
