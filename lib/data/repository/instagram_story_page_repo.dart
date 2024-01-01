import 'package:codeway_case_study/models/mock_user_data.dart';

class InstagramStoryPageRepo {
  var userIndex = 0;
  var users = MockUserData().users();

  void changeStoryIndex(bool increase) {
    if (increase) {
      if (userIndex < users.length - 1) {
        userIndex += 1;
      }
    } else {
      if (userIndex > 0) {
        userIndex -= 1;
      }
    }
  }

  void setUserIndex(int index) {
    userIndex = index;
  }
}
