class UserModel {
  final String userName;
  final List<StoryModel> stories;
  final String userProfilePicture;
  bool isVideo;

  UserModel(
      {required this.userName,
      required this.stories,
      required this.userProfilePicture,
      required this.isVideo});
}

class StoryModel {
  final String storyName;
  final bool isVideo;

  StoryModel({required this.storyName, required this.isVideo});
}
