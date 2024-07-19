import 'package:elab/constant/constant.dart';
import 'package:elab/constant/ui_helpers.dart';
import 'package:elab/pages/History_Detials_Module/history_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});
  static const String id = 'HistoryScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HistoryState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(state.name.toString()),
      ),
      body: state.isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: double.infinity,
              padding: kStandardPadding(),
              child: ListView.builder(
                itemCount: state.medicalReportsResponse!.parameters!.length,
                itemBuilder: (context, index) {
                  final report =
                      state.medicalReportsResponse!.parameters![index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.medicalReportsResponse!.parameters![index]
                            .parameterName
                            .toString(),
                        style: kkBoldTextStyle(),
                      ),
                      kSizedBox(),
                      Column(
                        children: state.medicalReportsResponse!
                            .parameters![index].children!
                            .map((e) {
                          return Column(
                            children: [
                              HistoryTile(
                                testName: e.parameterName ?? '',
                                lastValue: e.parameterUnit,
                                // latestValue: e.latestValue,
                                normalValue: e.parameterRange,
                                // icon: e.greater == 'last'
                                //     ? Icons.arrow_upward
                                //     : Icons.arrow_downward,
                                // iconColor: e.greater == 'last' ? true : false,
                                // lastColor: e.greater != 'last' ? true : false,
                                // lastIcon: e.greater != 'last'
                                //     ? Icons.arrow_upward
                                //     : Icons.arrow_downward,
                                child: e.childrens != null
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: e.childrens!.map((data) {
                                          return ReportTile(
                                            testName: data.parameterName ?? '',
                                            lastValue: data.parameterUnit ?? '',
                                            normalValue:
                                                data.parameterRange ?? '',
                                          );
                                        }).toList())
                                    : Container(),
                                // onTap: () {
                                //   if (e.childrens != null) {
                                //     state.onExpandedChange();
                                //   }
                                // },
                              ),
                              // e.childrens != null && state.isExpanded == true
                              //     ? Column(
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.start,
                              //         children: e.childrens!.map((data) {
                              //           return ReportTile(
                              //             testName: data.parameterName ?? '',
                              //             lastValue: data.lastValue ?? '',
                              //             latestValue: data.latestValue ?? '',
                              //             normalValue:
                              //                 data.parameterRange ?? '',
                              //           );
                              //         }).toList())
                              //     : Container()
                            ],
                          );
                        }).toList(),
                      )
                    ],
                  );
                },
              )),
    );
  }
}

class HistoryTile extends StatelessWidget {
  String? title;
  String? testName;
  String? normalValue;
  String? latestValue;
  String? lastValue;
  // IconData? icon;
  // bool? iconColor;
  // IconData? lastIcon;
  // bool? lastColor;

  // String? status;
  // Function onTap;
  Widget? child;

  HistoryTile({
    this.title,
    // required this.onTap,
    this.lastValue,
    this.latestValue,
    this.normalValue,
    this.testName,
    this.child,
    // this.icon,
    // this.iconColor,
    // this.lastColor,
    // this.lastIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.89,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  offset: Offset(2, 2),
                  spreadRadius: 2,
                  color: Color.fromARGB(255, 222, 218, 218),
                )
              ]),
          padding: tPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              title != null ? Text(title!) : Container(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Test Name :',
                          style: kkTextStyle().copyWith(fontSize: 14)),
                      maxWidthSpan(),
                      if (testName != null)
                        Text(testName ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: kkBoldTextStyle().copyWith(fontSize: 13)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      normalValue != null
                          ? Text('Normal  Value :',
                              style: kkTextStyle().copyWith(fontSize: 14))
                          : Container(),
                      maxWidthSpan(),
                      if (normalValue != null)
                        Text(normalValue.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: kkBoldTextStyle().copyWith(fontSize: 13)),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     lastValue != null
                  //         ? Text(
                  //             'Latest Value :',
                  //             style: kkTextStyle().copyWith(fontSize: 14),
                  //           )
                  //         : Container(),
                  //     maxWidthSpan(),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          lastValue != null
                              ? Text('Parameter Unit: ',
                                  style: kkTextStyle().copyWith(fontSize: 14))
                              : Container(),
                          maxWidthSpan(),
                          Row(
                            children: [
                              Text(lastValue ?? '',
                                  style:
                                      kkBoldTextStyle().copyWith(fontSize: 13)),
                              maxWidthSpan(),
                              // latestValue != null
                              //     ? Icon(
                              //         lastIcon,
                              //         size: 14,
                              //         color: lastColor == true
                              //             ? Colors.green
                              //             : Colors.red,
                              //       )
                              //     : Container(),
                            ],
                          )
                        ],
                      ),
                      maxWidthSpan(),
                      // InkWell(
                      //     onTap: () {
                      //       onTap();
                      //     },
                      //     child: Text(status!,
                      //         style: kkBoldTextStyle().copyWith(fontSize: 13)))
                    ],
                  ),
                  kSizedBox(),
                  Container(
                    child: child,
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

class ReportTile extends StatelessWidget {
  String? title;
  String? testName;
  String? normalValue;
  // String? latestValue;
  String? lastValue;
  IconData? icon;
  bool? iconColor;
  IconData? lastIcon;
  bool? lastColor;

  ReportTile({
    this.title,
    this.lastValue,
    // this.latestValue,
    this.normalValue,
    this.testName,
    this.icon,
    this.iconColor,
    this.lastColor,
    this.lastIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: sPadding,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          // margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TestName : $testName ",
                  ),
                  Text("NormalValue : $normalValue "),
                  // Row(
                  //   children: [
                  //     Text("LatestValue : $latestValue "),
                  //     Icon(
                  //       icon!,
                  //       size: 14,
                  //       color: iconColor == true ? Colors.green : Colors.red,
                  //     ),
                  //   ],
                  // ),
                  Row(
                    children: [
                      Text("LastValue : $lastValue"),
                      maxWidthSpan(),
                      Icon(
                        lastIcon,
                        size: 14,
                        color: lastColor == true ? Colors.green : Colors.red,
                      )
                    ],
                  ),
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
