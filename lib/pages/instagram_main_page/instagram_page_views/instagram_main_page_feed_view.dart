import 'package:codeway_case_study/models/user_model.dart';
import 'package:codeway_case_study/widgets/instagram_main_page_feed_widget.dart';
import 'package:flutter/material.dart';

class InstagramMainPageFeedView extends StatelessWidget {
  final UserModel userModel;

  const InstagramMainPageFeedView({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InstagramMainPageFeedWidget(
            userName: userModel.userName,
            pictureName: userModel.stories[0].storyName,
            profilePicture: userModel.userProfilePicture,
            isVideo: userModel.isVideo),
      ),
    );
  }
}
