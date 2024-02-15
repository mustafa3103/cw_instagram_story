import 'package:codeway_case_study/controllers/animatedProgressBarController/animated_progress_bar_controller.dart';
import 'package:codeway_case_study/data/repository/instagram_story_page_repo.dart';
import 'package:codeway_case_study/models/user_model.dart';
import 'package:get/get.dart';

class InstagramStoryPageController extends GetxController {
  final InstagramStoryPageRepo instagramStoryPageRepo;
  final RxList<UserModel> users = <UserModel>[].obs;
  final RxInt userIndex = 0.obs;
  final RxBool isVideo = false.obs;

  InstagramStoryPageController({required this.instagramStoryPageRepo});

  @override
  void onInit() {
    super.onInit();
    initializeUsers();
    Get.put(AnimatedProgressBarController(duration: 5));
  }

  void initializeUsers() {
    instagramStoryPageRepo.loadUsers();
    users.value = instagramStoryPageRepo.users;
    Map<String, dynamic> arguments = Get.arguments ?? {};
    userIndex.value = arguments['userIndex'] ?? 0;
  }

  void changeUserIndex({required bool increase}) {
    if (increase) {
      userIndex.value++;
    } else {
      userIndex.value--;
    }
    update();
  }

  bool isVideoCheck(int storyIndex) {
    return users[userIndex.value].stories[storyIndex].isVideo;
  }
}
