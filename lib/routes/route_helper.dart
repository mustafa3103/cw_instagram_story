import 'package:codeway_case_study/pages/instagram_main_page/instagram_main_page_view.dart';
import 'package:codeway_case_study/pages/instagram_story_page/instagram_story_page_view.dart';
import 'package:get/route_manager.dart';

class RouteHelper {
  static const String initial = "/";
  static const String storyPage = "/storyPage";

  static String getInitial() => initial;
  static String getStoryPage() => storyPage;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => InstagramMainPageView()),
    GetPage(
        name: storyPage,
        page: () => InstagramStoryPage(),
        transition: Transition.circularReveal)
  ];
}
