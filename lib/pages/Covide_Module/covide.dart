import 'package:elab/constant/constant.dart';
import 'package:elab/pages/Covide_Module/covide_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/ui_helpers.dart';

String stripHtmlIfNeeded(String text) {
  return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
}

class CovideScreen extends StatelessWidget {
  const CovideScreen({super.key});
  static const String id = 'CovideScreen';
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CovideState>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Covide'),
          backgroundColor: primaryColor,
        ),
        body: state.isLoading == true
            ? Center(
                child: CircularProgressIndicator(color: primaryColor),
              )
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  padding: kStandardPadding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stripHtmlIfNeeded(
                          state.covideResponse!.data!.name
                              .toString()
                              .replaceAll('\n', '\n'),
                        ),
                        style: kkBoldTextStyle(),
                      ),
                      kSizedBox(),
                      Text(
                        stripHtmlIfNeeded(
                          state.covideResponse!.data!.content
                              .toString()
                              .replaceAll('\n', '\n'),
                        ),
                        style: kkTextStyle(),
                      ),
                      kSizedBox(),
                      Column(
                        children: state.covideResponse!.data!.faqs!.map((e) {
                          return CovideList(
                            answer: e.answers,
                            question: e.questions,
                          );
                        }).toList(),
                      )
                      // Expanded(
                      //   child: ListView.builder(
                      //     itemCount: state.covideResponse!.data!.faqs!.length,
                      //     // itemCount: 1,
                      //     itemBuilder: (context, index) {
                      //       return CovideList(
                      //         question: state
                      //             .covideResponse!.data!.faqs![index].questions!
                      //             .toString(),
                      //         answer: state
                      //             .covideResponse!.data!.faqs![index].answers!
                      //             .toString(),
                      //       );
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ));
  }
}

class CovideList extends StatelessWidget {
  String? question;
  // String? title;
  String? answer;
  // String? content;
  CovideList({this.question, this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: kPadding(),
            decoration: BoxDecoration(
                // border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 2,
                    color: Colors.grey,
                    offset: Offset(2, 2),
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stripHtmlIfNeeded(
                    question!.replaceAll('\n', '\n'),
                  ),
                  style: kBoldTextStyle()..copyWith(fontSize: 15),
                ),
                // sSizedBox(),
                Text(
                  stripHtmlIfNeeded(
                    answer!.replaceAll('\n', '\n'),
                  ),
                  style: kBoldTextStyle().copyWith(fontSize: 15),
                )
              ],
            )),
        kSizedBox(),
      ],
    );
  }
}
