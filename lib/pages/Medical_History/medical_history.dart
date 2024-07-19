import 'package:elab/constant/constant.dart';
import 'package:elab/constant/ui_helpers.dart';
import 'package:elab/pages/History_Detials_Module/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'medical_history_state.dart';

class MedicalHistoryScreen extends StatelessWidget {
  const MedicalHistoryScreen({super.key});
  static const String id = 'MedicalHistoryScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MedicalHistoryState>(context);
    return Scaffold(
      appBar: defaultAppBar('Medical History'),
      body: state.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: kStandardPadding(),
              child: ListView.builder(
                itemCount: state.medicalReportsResponse!.data!.length,
                itemBuilder: (context, index) {
                  return MedicalHistory(
                    biilNo: state.medicalReportsResponse!.data![index].billNo,
                    date: state.medicalReportsResponse!.data![index].date,
                    title:
                        state.medicalReportsResponse!.data![index].reportName,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        HistoryScreen.id,
                        arguments:{
                           
                          'slug' : state.medicalReportsResponse!.data![index].slug,
                          'name':  state.medicalReportsResponse!.data![index].reportName,
                        }
                      );
                    },
                  );
                },
              )),
    );
  }
}

class MedicalHistory extends StatelessWidget {
  String? title;
  String? date;
  String? biilNo;
  Function() onTap;
  MedicalHistory({
    required this.onTap,
    this.biilNo,
    this.date,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3,
                      offset: Offset(2, 2),
                      spreadRadius: 2,
                      color: const Color.fromARGB(255, 212, 208, 208))
                ],
                color: const Color.fromARGB(255, 255, 255, 255)),
            padding: sPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: kkBoldTextStyle().copyWith(fontSize: 15),
                ),

                Text(
                  biilNo!,
                  style: kkTextStyle(),
                ),
                // kSizedBox(),
                Text(
                  date!,
                  style: kkTextStyle(),
                ),
              ],
            ),
          ),
        ),
        LSizedBox(),
      ],
    );
  }
}
