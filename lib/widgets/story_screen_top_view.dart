import 'package:codeway_case_study/widgets/circle_widget.dart';
import 'package:flutter/material.dart';

class StoryScreenTopView extends StatelessWidget {
  final String userName;
  final String userProfilePicturePath;

  const StoryScreenTopView(
      {super.key,
      required this.userName,
      required this.userProfilePicturePath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleWidget(
            userName: userName,
            userProfilePicturePath: userProfilePicturePath,
            height: 30,
            width: 30,
            radius: 15),
        DefaultTextStyle(
            style: const TextStyle(
                color: Colors.white, fontSize: 17, fontStyle: FontStyle.normal),
            child: Text(userName))
      ],
    );
  }
}
