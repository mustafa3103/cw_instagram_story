import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:codeway_case_study/controllers/animatedProgressBarController/animated_progress_bar_controller.dart';
import 'package:codeway_case_study/controllers/instagram_story_page_controllers/instagram_story_page_controller.dart';
import 'package:codeway_case_study/widgets/animated_progress_bar.dart';
import 'package:codeway_case_study/widgets/image_widget.dart';
import 'package:codeway_case_study/widgets/story_screen_top_view.dart';
import 'package:codeway_case_study/widgets/video_player_widget.dart';

class InstagramStoryPage extends StatelessWidget {
  InstagramStoryPage({super.key});

  final GlobalKey<VideoPlayerWidgetState> videoPlayerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InstagramStoryPageController>(
      builder: (storyController) {
        return GetBuilder<AnimatedProgressBarController>(
          builder: (progressController) {
            return _buildStoryPage(
                context, storyController, progressController);
          },
        );
      },
    );
  }

  Widget _buildStoryPage(
    BuildContext context,
    InstagramStoryPageController storyController,
    AnimatedProgressBarController progressController,
  ) {
    progressController.onCompletionCallback = () {
      if (storyController.users.length - 1 > storyController.userIndex.value) {
        storyController.changeUserIndex(increase: true);
      } else {
        Get.back();
      }
    };

    var isVideoCheck =
        storyController.isVideoCheck(progressController.storyIndex.toInt());

    Widget mediaWidget =
        _buildMediaWidget(storyController, progressController, isVideoCheck);

    return Stack(
      children: [
        mediaWidget,
        Positioned(
          top: 70,
          left: 5,
          right: 5,
          child:
              _buildTopContainer(context, storyController, progressController),
        ),
      ],
    );
  }

  Widget _buildMediaWidget(
    InstagramStoryPageController storyController,
    AnimatedProgressBarController progressController,
    bool isVideoCheck,
  ) {
    if (isVideoCheck) {
      return VideoPlayerWidget(
        videoUrl: storyController.users[storyController.userIndex.value]
            .stories[progressController.storyIndex.toInt()].storyName,
        onVideoDuration: (duration) {
          progressController.updateDuration(duration);
        },
        key: videoPlayerKey,
      );
    } else {
      progressController.updateDuration(5);
      return ImageWidget(
        imagePath: storyController.users[storyController.userIndex.value]
            .stories[progressController.storyIndex.toInt()].storyName,
      );
    }
  }

  Widget _buildTopContainer(
    BuildContext context,
    InstagramStoryPageController storyController,
    AnimatedProgressBarController progressController,
  ) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          AnimatedProgressBarWidget(
            progressIndex: storyController
                .users[storyController.userIndex.value].stories.length.obs,
            videoDuration: 5,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTopView(storyController),
              _buildCloseButton(),
            ],
          ),
          _buildGestureDetector(context, storyController, progressController),
        ],
      ),
    );
  }

  Widget _buildTopView(InstagramStoryPageController storyController) {
    return Row(
      children: [
        StoryScreenTopView(
          userName:
              storyController.users[storyController.userIndex.value].userName,
          userProfilePicturePath: storyController
              .users[storyController.userIndex.value].userProfilePicture,
        ),
      ],
    );
  }

  Widget _buildCloseButton() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.close, color: Colors.white),
      ),
    );
  }

  Widget _buildGestureDetector(
    BuildContext context,
    InstagramStoryPageController storyController,
    AnimatedProgressBarController progressController,
  ) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 270,
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            // Gesture detection functions
            onLongPress: () {
              progressController.stopProgress();
              videoPlayerKey.currentState?.pauseVideo();
            },
            onLongPressUp: () {
              progressController.forwardProgress();
              videoPlayerKey.currentState?.resumeVideo();
            },
            onVerticalDragUpdate: (details) {
              if (details.primaryDelta != null && details.primaryDelta! > 0) {
                if (details.primaryDelta! > 20) {
                  Get.back();
                }
              }
            },
            onTapUp: (details) {
              double x = details.globalPosition.dx;

              if (x > MediaQuery.of(context).size.width / 2) {
                progressController.isIncrementStoryIndex = true.obs;
                if (storyController.userIndex ==
                    storyController.users.length - 1) {
                  Get.back();
                }
              } else {
                if (storyController.userIndex == 0) {
                  progressController.restartProgress();
                  progressController.forwardProgress();
                } else if (storyController.userIndex > 0 &&
                    progressController.storyIndex.value == 0) {
                  storyController.changeUserIndex(increase: false);
                  progressController.restartProgress();
                  progressController.forwardProgress();
                }
                progressController.isDecrementStoryIndex = true.obs;
              }
            },
          ),
        )
      ],
    );
  }
}
