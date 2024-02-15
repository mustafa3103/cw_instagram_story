import 'package:codeway_case_study/controllers/instagram_main_page_controllers/instagram_main_page_controller.dart';
import 'package:codeway_case_study/controllers/instagram_main_page_controllers/instagram_main_page_subview_controllers/instagram_main_page_feed_view_controller.dart';
import 'package:codeway_case_study/controllers/instagram_main_page_controllers/instagram_main_page_subview_controllers/instagram_top_view_controller.dart';
import 'package:codeway_case_study/controllers/instagram_story_page_controllers/instagram_story_page_controller.dart';
import 'package:codeway_case_study/data/repository/instagram_main_page_feed_repo.dart';
import 'package:codeway_case_study/data/repository/instagram_main_page_repo.dart';
import 'package:codeway_case_study/data/repository/instagram_top_view_repo.dart';
import 'package:codeway_case_study/data/repository/instagram_story_page_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // -> Repos
  Get.lazyPut(() => InstagramMainPageRepo());
  Get.lazyPut(() => InstagramTopViewRepo());
  Get.lazyPut(() => InstagramMainPageFeedRepo());

  // -> Controllers
  Get.lazyPut(
      () => InstagramMainPageController(instagramMainPageRepo: Get.find()));
  Get.lazyPut(
      () => InstagramTopViewController(instagramTopViewRepo: Get.find()));
  Get.lazyPut(() => InstagramMainPageFeedViewController(
      instagramMainPageFeedRepo: Get.find()));
}

Future<void> initStoryPage() async {
  // -> Repo of story page
  Get.lazyPut(() => InstagramStoryPageRepo());

  // Controller of story page
  Get.lazyPut(
      () => InstagramStoryPageController(instagramStoryPageRepo: Get.find()));
}
