import 'package:codeway_case_study/data/repository/instagram_story_page_repo.dart';
import 'package:codeway_case_study/models/user_model.dart';
import 'package:get/get.dart';

class InstagramStoryPageViewController extends GetxController {
  final InstagramStoryPageRepo instagramStoryPageRepo;
  bool isProgressPaused = false;
  InstagramStoryPageViewController({required this.instagramStoryPageRepo});
  var isRestartProgress = false;
  var sliderIndex = 0.obs;

  UserModel changeUserIndex(bool increase) {
    var selectedUser =
        instagramStoryPageRepo.users[instagramStoryPageRepo.userIndex];

    if (increase) {
      if (instagramStoryPageRepo.users.length >
          instagramStoryPageRepo.userIndex) {
        instagramStoryPageRepo.changeStoryIndex(true);
      } else {
        // -> Throw error
      }
    } else {
      if (instagramStoryPageRepo.userIndex > 0) {
        instagramStoryPageRepo.changeStoryIndex(false);
      } else {
        // -> Throw error
      }
    }
    update();
    return selectedUser;
  }

  void setUserIndex(int index) {
    instagramStoryPageRepo.userIndex = index;
    update();
  }

  void updateProgressBar(bool state, int progress) {
    if (state) {
      isProgressPaused = true;
    } else {
      isProgressPaused = false;
    }
    update();
  }
}
