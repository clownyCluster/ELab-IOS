import 'package:elab/Drawer_Pages/Blogs_Module/blogs_state.dart';
import 'package:elab/constant/constant.dart';
import 'package:elab/constant/ui_helpers.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String stripHtmlIfNeeded(String text) {
  return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
}

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({super.key});
  static const String id = 'BlogsScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<BlogsState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Blogs'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: state.isLoading == true
          ? Center(
              child: CircularProgressIndicator(color: primaryColor),
            )
          : Container(
            padding: kStandardPadding(),
            child: ListView.builder(
             
                itemCount: state.blogsModelResponse!.data!.length,
                itemBuilder: (context, index) {
                  return BlogsTile(
                    description:
                        state.blogsModelResponse!.data![index].content.toString(),
                    image: state.blogsModelResponse!.data![index].image!,
                    title:
                        state.blogsModelResponse!.data![index].title.toString(),
                    date: state.blogsModelResponse!.data![index].createdAt,
                    createdBy: state.blogsModelResponse!.data!.first.createdBy,
                  );
                },
              ),
          ),
    );
  }
}

class BlogsTile extends StatelessWidget {
  String? image;
  String? title;
  String? description;
  String? date;
  String? createdBy;
  BlogsTile({
    this.description,
    this.image,
    this.title,
    this.date,
    this.createdBy,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 170,
          width: double.infinity,
          child: Image.network(
            fit: BoxFit.cover,
            image!,
          )),
      LSizedBox(),
      Column(
        children: [
          Text(
            stripHtmlIfNeeded(
              title!.replaceAll('\n', '\n'),
            ),
            style: kkBoldTextStyle().copyWith(fontSize: 15),
            // textAlign: TextAlign.justify,
          ),
          sSizedBox(),
          Row(
            children: [
              Icon(
                Icons.person,
                color: primaryColor,
                size: 15,
              ),
              minWidthSpan(),
              Text(createdBy!,
                  style: kkBoldTextStyle()
                      .copyWith(fontSize: 12)
                      .copyWith(color: primaryColor)),
              maxWidthSpan(),
              maxWidthSpan(),
              Icon(
                Icons.timer_outlined,
                color: primaryColor,
                size: 15,
              ),
              minWidthSpan(),
              Text(date!,
                  style: kkBoldTextStyle()
                      .copyWith(fontSize: 12)
                      .copyWith(color: primaryColor)),
            ],
          ),
          kSizedBox(),
          Text(
            stripHtmlIfNeeded(
              description!.replaceAll('\n', '\n'),
            ),
            style: kBoldTextStyle(),
            // textAlign: TextAlign.justify,
          )
        ],
      ),
      kSizedBox(),
    ]);
  }
}
