import 'package:elab/Drawer_Pages/AboutUs_Module/about_us_state.dart';
import 'package:elab/constant/constant.dart';
import 'package:elab/constant/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String stripHtmlIfNeeded(String text) {
  return text.replaceAll(
    RegExp(r'<[^>]*>|&[^;]+;'),
    ' ',
  );
}

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});
  static const String id = 'AboutUsScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AboutUsState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: state.isLoading == true
          ? Center(
              child: CircularProgressIndicator(color: primaryColor),
            )
          : SingleChildScrollView(
              child: Container(
                padding: kStandardPadding(),
                child: AboutDescription(
                  title: state.aboutUSResponse!.data!.contentTitle,
                  content: state.aboutUSResponse!.data!.content,
                  missionTopic: state.aboutUSResponse!.data!.missionTopic,
                  missionContent: state.aboutUSResponse!.data!.missionContent,
                  topImage: state.aboutUSResponse!.data!.topImage1,
                  // centerImage: state.aboutUSResponse!.data!.topImage2,
                  extraImage: state.aboutUSResponse!.data!.extraImage,
                  extraTopic: state.aboutUSResponse!.data!.extraTopic,
                  extraContent: state.aboutUSResponse!.data!.extraContent,
                  missionImage: state.aboutUSResponse!.data!.missionImage1,
                ),
              ),
            ),
    );
  }
}

class AboutDescription extends StatelessWidget {
  String? title;
  String? content;
  String? topImage;
  String? missionTopic;
  String? missionContent;
  String? centerImage;
  String? extraTopic;
  String? extraContent;
  String? extraImage;
  String? missionImage;

  AboutDescription({
    this.title,
    this.content,
    this.topImage,
    this.missionContent,
    this.missionTopic,
    this.centerImage,
    this.extraTopic,
    this.extraContent,
    this.extraImage,
    this.missionImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 350,
          width: double.infinity,
          child: Image.network(
            topImage!,
            height: 50,
            width: 50,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              }
            },
            fit: BoxFit.cover,
          ),
        ),
        LSizedBox(),
        Text(
          stripHtmlIfNeeded(
            title!.replaceAll('\n', 'A'),
          ),
          style: kkBoldTextStyle(),
          textAlign: TextAlign.justify,
        ),
        // sSizedBox(),
        Text(
          stripHtmlIfNeeded(
            content!.replaceAll('\n', '\n'),
          ),
          style: kBoldTextStyle(),
          textAlign: TextAlign.justify,
        ),
        LSizedBox(),

        Container(
          height: 350,
          width: double.infinity,
          child: Image.network(
           extraImage!,
            height: 50,
            width: 50,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              }
            },
            fit: BoxFit.cover,
          ),
        ),
        LSizedBox(),
        Text(
          stripHtmlIfNeeded(
            extraTopic!.replaceAll('\n', 'A'),
          ),
          style: kkBoldTextStyle(),
          textAlign: TextAlign.justify,
        ),
        sSizedBox(),
        Text(
          stripHtmlIfNeeded(
            extraContent!.replaceAll('\n', '\n'),
          ),
          style: kBoldTextStyle(),
          textAlign: TextAlign.justify,
        ),

        kSizedBox(),
        Text(
          stripHtmlIfNeeded(
            missionTopic!.replaceAll('\n', '\n'),
          ),
          style: kkBoldTextStyle(),
          textAlign: TextAlign.justify,
        ),
        kSizedBox(),
        Text(
          stripHtmlIfNeeded(
            missionContent!.replaceAll('\n', '\n'),
          ),
          style: kBoldTextStyle(),
          textAlign: TextAlign.justify,
        ),
        sSizedBox(),
        Container(
            height: 150,
            width: double.infinity,
            child: Image.network(
              missionImage!,
              fit: BoxFit.contain,
            )),

        // Row(
        //   children: [
        //     Container(
        //       color: secondaryColor,
        //       padding: sPadding,
        //       child: Column(
        //         children: [Text('achivements')],
        //       ),
        //     ),
        //     maxWidthSpan(),
        //     Container(
        //       padding: sPadding,
        //       child: Column(
        //         children: [Text('Events')],
        //       ),
        //     ),
        //     maxWidthSpan(),
        //     Container(
        //       padding: sPadding,
        //       child: Column(
        //         children: [Text('Our Value')],
        //       ),
        //     ),
        //   ],
        // )
      ],
    );
  }
}
