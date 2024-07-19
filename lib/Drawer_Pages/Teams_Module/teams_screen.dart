import 'package:elab/Drawer_Pages/Teams_Module/teams_state.dart';
import 'package:elab/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});
  static const String id = 'TeamsScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TeamsState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar('Teams'),
      body: state.isLoading == true
          ? Center(
              child: CircularProgressIndicator(color: primaryColor),
            )
          : Container(
              padding: kStandardPadding(),
              child: ListView.builder(
                itemCount: state.teamsResponse!.data!.length,
                itemBuilder: (context, index) {
                  return TeamsTile(
                    image: state.teamsResponse!.data![index].image,
                    name: state.teamsResponse!.data![index].name,
                    specialist: state.teamsResponse!.data![index].specialist,
                  );
                },
              ),
            ),
    );
  }
}

class TeamsTile extends StatelessWidget {
  String? name;
  String? image;
  String? specialist;
  TeamsTile({
    this.name,
    this.image,
    this.specialist,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: kPadding(),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  spreadRadius: 1.3,
                  offset: Offset(
                    2.0,
                    2.0,
                  ),
                )
              ]),
          child: Column(
            children: [
              Text(
                name!,
                style: kkTextStyle(),
              ),
              Text(
                specialist!,
                style: kkTextStyle(),
              ),
              Image.network(image!),
            ],
          ),
        ),
        kSizedBox(),
      ],
    );
  }
}
