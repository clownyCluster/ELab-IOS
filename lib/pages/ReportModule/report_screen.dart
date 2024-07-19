import 'package:elab/constant/constant.dart';
import 'package:elab/constant/ui_helpers.dart';
import 'package:elab/pages/ReportModule/report_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../NoInternet/no_internet_screen.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});
  static const String id = 'ReportScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ReportState>(context);
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Report'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: state.isNetConnected == false
          ? ConnectivityScreen()
          : state.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(color: primaryColor),
                )
              : Column(
                  children: [
                    state.reportResponse!.data == [] ||
                            state.reportResponse!.data == null ||
                            state.reportResponse!.data!.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/empty_cart.png',
                                    ),
                                    Text(
                                      ' No Report ! ',
                                      style: kkBoldTextStyle(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Expanded(
                            child: Container(
                              padding: kStandardPadding(),
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: state.reportResponse!.data!.length,
                                itemBuilder: (context, index) {
                                  return ReportTile(
                                    state: state,
                                    reports: state
                                        .reportResponse!.data![index].report,
                                    date: state
                                        .reportResponse!.data![index].orderDate,
                                    id: state.reportResponse!.data![index].id,
                                    packageName: state.reportResponse!
                                        .data![index].packageName![0]
                                        .toString(),
                                  );
                                },
                              ),
                            ),
                          ),
                  ],
                ),
    );
  }
}

class ReportTile extends StatelessWidget {
  String? id;
  String? date;
  String? packageName;
  String? reports;

  ReportTile({
    this.date,
    this.id,
    this.reports,
    this.packageName,
    required this.state,
    super.key,
  });
  ReportState? state;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: kPadding(),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 196, 196, 196),
                blurRadius: 2.0, // soften the shadow
                spreadRadius: 1.3, //extend the shadow
                offset: Offset(
                  2.0,
                  2,
                ),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                id!,
                style: kkBoldTextStyle(),
              ),
              sSizedBox(),
              Row(
                children: [
                  Text(
                    'Order Date : ',
                    style: kBoldTextStyle(),
                  ),
                  Text(
                    date!,
                    style: kkBoldTextStyle().copyWith(fontSize: 14),
                  ),
                ],
              ),
              sSizedBox(),
              Row(
                children: [
                  Text(
                    'Smart Report :  ',
                    style: kBoldTextStyle(),
                  ),
                  Expanded(
                    child: Text(
                      packageName!,
                      style: kkBoldTextStyle().copyWith(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Receipt : ',
                        style: kBoldTextStyle(),
                      ),
                      Text(
                        'Delivered',
                        style: kkBoldTextStyle().copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      state!.postReport(id);
                      state!.reportDownload(reports);
                    },
                    child: Container(
                      padding: kPadding(),
                      decoration: BoxDecoration(
                        // border: Border.all(width: 1, color: Colors.grey),
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 231, 231, 231),
                            blurRadius: 15.0, // soften the shadow
                            spreadRadius: 5.0, //extend the shadow
                            offset: Offset(
                              2.0, // Move to right 5  horizontally
                              2.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: Text('Download Report',
                          style: kWhiteBoldTextStyle().copyWith(fontSize: 12)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        kSizedBox(),
      ],
    );
  }
}
