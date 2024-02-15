import 'package:codeway_case_study/data/repository/instagram_top_view_repo.dart';
import 'package:codeway_case_study/models/user_model.dart';
import 'package:get/get.dart';

class InstagramTopViewController extends GetxController {
  final InstagramTopViewRepo instagramTopViewRepo;

  InstagramTopViewController({required this.instagramTopViewRepo});

  var users = <UserModel>[];

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  // Method to initialize users
  void loadUsers() {
    instagramTopViewRepo.loadUsers();
    users = instagramTopViewRepo.users;
  }
}
