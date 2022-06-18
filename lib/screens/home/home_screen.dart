part of'home_imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeData homeData=HomeData();

  @override
  void initState() {

    homeData.servicesFuture(pageKey: 1,context: context);
    homeData.pagingController.addPageRequestListener((pageKey) {
      homeData.servicesFuture(pageKey: pageKey,context: context);
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeProvider>(context,);
    final mediaQuery = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop:() {
        return controller.homeData.displayLogoutDialog(context,'هل تريد الخروج من التطبيق',"");},
      child: Scaffold(
        backgroundColor: AppColors.homeBackGround,
          appBar: AppBar(
            backgroundColor: AppColors.homeBackGround,
            elevation: 0,
            centerTitle: true,
            title: const CustomText(
              text: 'مدفوعات هلا',
              color: AppColors.textColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            leading: InkWell(
              onTap: (){
                  controller.homeData.displayLogoutDialog(context,'هل تريد الخروج من التطبيق',"");
              },
                child: const Icon(Icons.arrow_back,color: AppColors.textColor,)),
          ),
          body:Consumer<HomeProvider>(
            builder: (context, value, child) =>
            value.homePaymentModel==null?
            const Center(child: CircularProgressIndicator()):
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BuildTotalPayment(mediaQuery: mediaQuery, controller: controller),
                        BuildFilterSearch(mediaQuery: mediaQuery),
                      ],
                    ),
                    Expanded(
                      child: PagedListView<int, HomeDataModel>(
                        pagingController: homeData.pagingController,
                        padding: const EdgeInsets.only(bottom: 30),
                        shrinkWrap: true,
                        // physics: ScrollPhysics(),
                        builderDelegate: PagedChildBuilderDelegate<HomeDataModel>(
                          noItemsFoundIndicatorBuilder: (context) => const Text(''),
                          firstPageProgressIndicatorBuilder: (_) => const CircularProgressIndicator(),
                          itemBuilder: (context, item, index) => Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)
                            ),
                            child: Container(
                              width: mediaQuery.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.white,
                              ),
                              child: ExpansionTile(
                                title:  Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(

                                      children: [
                                        const SizedBox(width: 8,),
                                        CustomText(
                                          text: '${item.fullNameAR}',
                                          color: AppColors.mainColorIndigo,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        const Expanded(child: SizedBox()),

                                        CustomText(
                                          text: '${item.amount}',
                                          color: const Color(0xffF03913),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(

                                      children: [
                                        const SizedBox(width: 10,),
                                        CustomText(
                                          text: '${item.userId}',
                                          color: AppColors.textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        const Expanded(child: SizedBox()),
                                        const CustomText(
                                          text: 'ريال سعودي',
                                          color: Color(0xff8C8C8C),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                                childrenPadding: EdgeInsets.zero,
                                tilePadding: EdgeInsets.zero,
                                trailing: const SizedBox.shrink(),

                                children: [
                                  Container(
                                    height: 80,
                                    width: mediaQuery.width,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: const Color(0xffF9FBFD),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:  [
                                            const CustomText(
                                              text: 'رقم التحويل : ',
                                              color:Color(0xff8C8C8C),
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            CustomText(
                                              text: '${item.trxRef}',
                                              color:AppColors.textColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:  [
                                            const CustomText(
                                              text: 'تاريخ التحويل : ',
                                              color:Color(0xff8C8C8C),
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            CustomText(
                                              text: '${item.trxDate}',
                                              color:AppColors.textColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:  const [
                                            CustomText(
                                              text: 'اسم المنشأة : ',
                                              color:Color(0xff8C8C8C),
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            CustomText(
                                              text: 'ركن الأضواء',
                                              color:AppColors.mainColorIndigo,
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          )),
    );

  }

}




