import 'package:codeway_case_study/controllers/animatedProgressBarController/animated_progress_bar_controller.dart';
import 'package:codeway_case_study/controllers/instagram_story_page_controllers/instagram_story_page_controller.dart';
import 'package:codeway_case_study/models/mock_user_data.dart';
import 'package:codeway_case_study/widgets/circle_widget.dart';
import 'package:codeway_case_study/widgets/animated_progress_bar.dart';
import 'package:codeway_case_study/widgets/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class InstagramStoryPage extends StatefulWidget {
  const InstagramStoryPage({Key? key});

  @override
  State<InstagramStoryPage> createState() => _InstagramStoryPageState();
}

class _InstagramStoryPageState extends State<InstagramStoryPage> {
  var users = MockUserData().users();
  var storyControllerVariable =
      InstagramStoryPageViewController(instagramStoryPageRepo: Get.find());
  var progressControllerVariable =
      AnimatedProgressBarController(duration: 5.obs);
  var videoDuration = 0.obs;

  late CarouselSliderController _sliderController;
  final GlobalKey<VideoPlayerWidgetState> videoPlayerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Get.put(AnimatedProgressBarController(duration: 5.obs));
    _sliderController = CarouselSliderController();
  }

  void goToNextStory(int storyIndex) {
    var sliderIndex = storyControllerVariable.sliderIndex.value;
    var usersCount = users.length;
    var currentUserStoryCount = users[sliderIndex.toInt()].stories.length;

    if (sliderIndex < usersCount - 1) {
      if (storyIndex < currentUserStoryCount - 1) {
        progressControllerVariable.isIncrementStoryIndex = true.obs;
      } else if (sliderIndex < usersCount - 1) {
        _sliderController.nextPage();
        progressControllerVariable.storyIndex.value = 0;
        storyControllerVariable.sliderIndex.value++;
      }
    } else {
      Get.back();
    }
  }

  void goToPreviousStory(int storyIndex) {
    var sliderIndex = storyControllerVariable.sliderIndex.value;
    if (storyIndex > 0) {
      progressControllerVariable.isDecrementStoryIndex = true.obs;
    } else if (sliderIndex > 0) {
      _sliderController.previousPage();
    }
  }

  void onProgressComplete() {
    _sliderController.nextPage();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    int userIndex = arguments['userIndex'] ?? -1;
    storyControllerVariable.setUserIndex(userIndex);

    return GetBuilder<InstagramStoryPageViewController>(
      builder: (storyController) {
        return GetBuilder<AnimatedProgressBarController>(
            builder: (progressController) {
          progressController.onCompletionCallback = onProgressComplete;
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: CarouselSlider.builder(
              unlimitedMode: false,
              controller: _sliderController,
              onSlideChanged: (value) {
                progressController.storyIndex.value = 0;
                progressController.restartProgress();
              },
              onSlideEnd: () {
                progressController.progressIndex.value =
                    users[storyControllerVariable.sliderIndex.value]
                        .stories
                        .length;
                progressController.forwardProgress();
              },
              onSlideStart: () {
                progressController.storyIndex.value = 0;
                progressController.progressIndex.value =
                    users[storyControllerVariable.sliderIndex.value]
                        .stories
                        .length;
                progressController.stopProgress();
                if (users.length ==
                    storyControllerVariable.sliderIndex.value + 1) {
                  Get.back();
                }
              },
              slideBuilder: (index) {
                storyControllerVariable.sliderIndex.value = index;
                var isVideo = users[storyControllerVariable.sliderIndex.value]
                    .stories[progressController.storyIndex.value]
                    .isVideo;

                Widget mediaWidget;
                if (isVideo) {
                  var videoUrl =
                      users[storyControllerVariable.sliderIndex.value]
                          .stories[progressController.storyIndex.value]
                          .storyName;

                  mediaWidget = VideoPlayerWidget(
                    key: videoPlayerKey,
                    videoUrl: videoUrl,
                    onVideoDuration: (duration) {
                      progressController.updateDuration(duration);
                    },
                  );
                } else {
                  progressController.updateDuration(5);
                  mediaWidget = Image.asset(
                    users[storyControllerVariable.sliderIndex.value]
                        .stories[progressController.storyIndex.value]
                        .storyName,
                    key: ValueKey(progressController.storyIndex.value),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  );
                }
                return Stack(
                  children: [
                    mediaWidget,
                    Positioned(
                      top: 70,
                      left: 5,
                      right: 5,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            AnimatedProgressBarWidget(
                                progressIndex: RxInt(users[
                                        storyControllerVariable
                                            .sliderIndex.value]
                                    .stories
                                    .length),
                                videoDuration: videoDuration),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleWidget(
                                        userName: users[index].userName,
                                        userProfilePicturePath:
                                            users[index].userProfilePicture,
                                        height: 30,
                                        width: 30,
                                        radius: 15),
                                    DefaultTextStyle(
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      child: Text(users[storyControllerVariable
                                              .sliderIndex.value]
                                          .userName),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 270,
                                  width: MediaQuery.of(context).size.width,
                                  child: GestureDetector(
                                    onLongPress: () {
                                      videoPlayerKey.currentState?.pauseVideo();
                                      progressController.stopProgress();
                                    },
                                    onLongPressUp: () {
                                      progressController.forwardProgress();
                                      videoPlayerKey.currentState
                                          ?.resumeVideo();
                                    },
                                    onTapUp: (details) {
                                      double x = details.globalPosition.dx;

                                      if (x >
                                          MediaQuery.of(context).size.width /
                                              2) {
                                        progressController
                                            .isIncrementStoryIndex = true.obs;
                                        if (storyController.sliderIndex.value ==
                                            users.length - 1) {
                                          Get.back();
                                        }

                                        goToNextStory(progressController
                                            .storyIndex
                                            .toInt());
                                      } else {
                                        if (progressController.storyIndex
                                                .toInt() ==
                                            0) {
                                          progressController.controller.value =
                                              0.0;
                                          progressController.restartProgress();
                                        }
                                        progressController
                                            .isDecrementStoryIndex = true.obs;
                                        goToPreviousStory(progressController
                                            .storyIndex
                                            .toInt());
                                      }
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              slideTransform: const CubeTransform(),
              itemCount: users.length,
              initialPage:
                  storyControllerVariable.instagramStoryPageRepo.userIndex,
              enableAutoSlider: false,
            ),
          );
        });
      },
    );
  }
}
