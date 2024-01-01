import 'package:codeway_case_study/controllers/instagram_main_page_controllers/instagram_main_page_controller.dart';
import 'package:codeway_case_study/models/mock_user_data.dart';
import 'package:codeway_case_study/pages/instagram_main_page/instagram_page_views/instagram_bottom_navigation_bar_view.dart';
import 'package:codeway_case_study/pages/instagram_main_page/instagram_page_views/instagram_main_page_feed_view.dart';
import 'package:codeway_case_study/pages/instagram_main_page/instagram_page_views/instagram_top_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class InstagramMainPageView extends StatelessWidget {
  InstagramMainPageView({Key? key}) : super(key: key);

  var users = MockUserData().users();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<InstagramMainPageController>(builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InstagramTopView(),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return InstagramMainPageFeedView(
                    userModel: users[index],
                  );
                },
              ),
            ),
          ],
        );
      }),
      bottomNavigationBar: const InstagramBottomNavigationBarView(),
    );
  }
}
