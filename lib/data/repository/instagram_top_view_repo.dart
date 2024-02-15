import 'package:codeway_case_study/models/mock_user_data.dart';
import 'package:codeway_case_study/models/user_model.dart';

class InstagramTopViewRepo {
  late List<UserModel> users;

  void loadUsers() {
    var data = MockUserData();
    users = data.users();
  }
}
