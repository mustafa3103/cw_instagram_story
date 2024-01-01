import 'package:codeway_case_study/models/user_model.dart';

class MockUserData {
  List<UserModel> users() {
    var users = [
      UserModel(
          userName: "Mustafa",
          stories: [
            StoryModel(
                storyName: "assets/image/stories/user1_picture1.jpg",
                isVideo: false),
            StoryModel(
                storyName: "assets/image/stories/user1_picture2.jpg",
                isVideo: false),
            StoryModel(
                storyName: "assets/image/stories/user1_video1.mp4",
                isVideo: true)
          ],
          userProfilePicture: "assets/image/profile_pictures/mustafa.jpg",
          isVideo: false),
      UserModel(
          userName: "Furkan",
          stories: [
            StoryModel(
                storyName: "assets/image/stories/user2_picture1.jpg",
                isVideo: false)
          ],
          userProfilePicture: "assets/image/profile_pictures/furkan.jpeg",
          isVideo: false),
      UserModel(
          userName: "Mike",
          stories: [
            StoryModel(
                storyName: "assets/image/stories/user3_picture1.jpg",
                isVideo: false),
            StoryModel(
                storyName: "assets/image/stories/user3_picture2.jpg",
                isVideo: false),
            StoryModel(
                storyName: "assets/image/stories/user3_songStory.mp4",
                isVideo: true),
          ],
          userProfilePicture: "assets/image/profile_pictures/mike.JPG",
          isVideo: false),
      UserModel(
          userName: "Ali",
          stories: [
            StoryModel(
                storyName: "assets/image/stories/user4_picture1.jpg",
                isVideo: false),
            StoryModel(
                storyName: "assets/image/stories/user4_songStory.mp4",
                isVideo: true),
          ],
          userProfilePicture: "assets/image/profile_pictures/ali.jpg",
          isVideo: false),
      UserModel(
          userName: "Veli",
          stories: [
            StoryModel(
                storyName: "assets/image/stories/user5_picture1.jpg",
                isVideo: false)
          ],
          userProfilePicture: "assets/image/profile_pictures/veli.jpg",
          isVideo: false),
      UserModel(
          userName: "Mehmet",
          stories: [
            StoryModel(
                storyName: "assets/image/stories/user6_picture1.jpg",
                isVideo: false)
          ],
          userProfilePicture: "assets/image/profile_pictures/mehmet.jpeg",
          isVideo: false)
    ];

    return users;
  }
}
