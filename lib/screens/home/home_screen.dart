import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hala_task/app/app_colors.dart';
import 'package:hala_task/model/home_model.dart';
import 'package:hala_task/model/test.dart';
import 'package:hala_task/widgets/custom_text.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../data/sign_in_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PagingController<int, Data> pagingController =
      PagingController(firstPageKey: 1);
  final int pageSize = 10;

  bool servicesLoader = false;
  var select;

  HomeModel model = HomeModel(
      fromDate: '2020-01-01',
      toDate: '2022-05-01',
      trxNumber: '',
      userId: '',
      filter: {"PageNumber": 0, "PageSize": 10});

  Future<void> servicesFuture({required int pageKey}) async {
    servicesLoader = true;

    try {
      var data = await Provider.of<SignInProvider>(context, listen: false)
          .postUnBlock(pageKey: pageKey, pageNum: pageSize);

      if (data != null) {
        List<Data> adds = data.dateSet!.data!;

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

      servicesLoader = false;
    } catch (e) {
      servicesLoader = false;
      rethrow;
    }
  }

  @override
  void initState() {
    servicesFuture(pageKey: 1);
    pagingController.addPageRequestListener((pageKey) {
      servicesFuture(pageKey: pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ref = Provider.of<SignInProvider>(
      context,
    );
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: 'مدفوعات هلا',
            color: AppColors.textColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          leading: Icon(Icons.arrow_back),
        ),
        body: servicesLoader || ref.autoGenerate == null
            ? Center(child: CircularProgressIndicator())
            :

            // ListView.builder(
            //         shrinkWrap: true,
            //         physics: ScrollPhysics(),
            //         itemCount: ref.autoGenerate!.dateSet!.data!.length,
            //         itemBuilder: (context, index) {
            //           return SizedBox(
            //             height: 100,
            //             child: Card(
            //               child: CustomText(
            //                 text:
            //                     '${ref.autoGenerate!.dateSet!.data![index].fullNameAR}',
            //               ),
            //             ),
            //           );
            //         },
            //       ),

            PagedListView<int, Data>(
                pagingController: pagingController,
                padding: const EdgeInsets.only(bottom: 30),
                shrinkWrap: true,
                builderDelegate: PagedChildBuilderDelegate<Data>(
                  noItemsFoundIndicatorBuilder: (context) => Text(''),
                  firstPageProgressIndicatorBuilder: (_) =>
                      CircularProgressIndicator(),
                  itemBuilder: (context, item, index) => SizedBox(
                    height: 100,
                    child: Card(
                      child: CustomText(
                        text: '${item.fullNameAR}',
                      ),
                    ),
                  ),
                ),
              ));
  }
}
