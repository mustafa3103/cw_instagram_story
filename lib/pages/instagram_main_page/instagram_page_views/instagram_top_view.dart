import 'package:codeway_case_study/controllers/instagram_main_page_controllers/instagram_main_page_subview_controllers/instagram_top_view_controller.dart';
import 'package:codeway_case_study/models/user_model.dart';
import 'package:codeway_case_study/routes/route_helper.dart';
import 'package:codeway_case_study/widgets/circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:codeway_case_study/helper/dependencies.dart' as dep;

// ignore: must_be_immutable
class InstagramTopView extends StatelessWidget {
  InstagramTopView({super.key});

  var topViewControllerVariable =
      InstagramTopViewController(instagramTopViewRepo: Get.find());
  var users = <UserModel>[];

  @override
  Widget build(BuildContext context) {
    topViewControllerVariable.initUsers();
    users = topViewControllerVariable.users;
    return Container(
      padding: const EdgeInsets.only(top: 60, left: 13, right: 13),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Instagram",
                  style:
                      TextStyle(fontSize: 30, fontFamily: 'Times New Roman')),
              Row(
                children: [
                  Icon(Icons.favorite_border),
                  SizedBox(width: 15),
                  Icon(Icons.message_outlined)
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: GetBuilder<InstagramTopViewController>(
                builder: (topViewController) {
              return Container(
                child: Row(children: [
                  ...List.generate(
                      users.length,
                      (index) => GestureDetector(
                          onTap: () {
                            dep.initStoryPage();

                            Get.toNamed(RouteHelper.getStoryPage(),
                                arguments: {"userIndex": index});
                          },
                          child: CircleWidget(
                            userName: users[index].userName,
                            userProfilePicturePath:
                                users[index].userProfilePicture,
                            radius: 40,
                            height: 80,
                            width: 80,
                          )))
                ]),
              );
            }),
          ),
        ],
      ),
    );
  }
}
