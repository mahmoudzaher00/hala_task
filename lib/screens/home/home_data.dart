part of'home_imports.dart';
class HomeData{

  PagingController<int, HomeDataModel> pagingController = PagingController(firstPageKey: 1);
  final int pageSize = 10;
  bool servicesLoader = false;

  HomeModel model = HomeModel(
      fromDate: '2020-01-01',
      toDate: '2022-05-01',
      trxNumber: '',
      userId: '',
      filter: {"PageNumber": 0, "PageSize": 10});

  Future<void> servicesFuture({required int pageKey,required BuildContext context}) async {
      var data = await Provider.of<HomeProvider>(context, listen: false)
          .pagingPaymentList(pageKey: pageKey, pageNum: pageSize);

      if (data != null) {
        List<HomeDataModel> adds = data.dateSet!.data!;

        if (pageKey == 1) {
          pagingController.itemList = [];
        }
        final isLastPage = adds.length < pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(adds);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(adds, nextPageKey);
        }
      }



  }
  Future<bool> displayLogoutDialog(BuildContext context, String title, String body,) async {
    bool goBack = false;
    return await showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
              title: Text(
                title,
                style: const TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 13,
                ),
              ),
              content: Text(body,
                  style: const TextStyle(fontFamily: "Cairo", fontSize: 13)),
              actions: <Widget>[
                CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child:  Text("لا",
                        style: const TextStyle(fontFamily: "Cairo", fontSize: 13))),
                CupertinoButton(
                    onPressed: () {
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    },
                    child:  Text('نعم',
                        style: const TextStyle(fontFamily: "Cairo", fontSize: 13)))
              ]);
        }
    );

  }
}