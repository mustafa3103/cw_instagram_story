import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedProgressBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  VoidCallback? onCompletionCallback;
  AnimatedProgressBarController(
      {this.onCompletionCallback, required this.duration});
  var storyIndex = 0.obs;
  var progressIndex = 0.obs;
  var isIncrementStoryIndex = false.obs;
  var isDecrementStoryIndex = false.obs;
  int duration;

  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: duration),
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(controller);

    controller.addListener(() {
      if (controller.isCompleted) {
        if (storyIndex.value < progressIndex.value - 1) {
          storyIndex.value++;

          updateDuration(duration);
          restartProgress();
          forwardProgress();
        } else if (storyIndex.value == progressIndex.value - 1) {
          onCompletionCallback?.call();
          storyIndex = 0.obs;
          restartProgress();
          forwardProgress();
        }
      } else if (controller.isAnimating) {
        if (isIncrementStoryIndex.isTrue) {
          if (storyIndex.value < progressIndex.value - 1) {
            storyIndex.value++;

            restartProgress();
            forwardProgress();
            update();
          } else if (storyIndex.value == progressIndex.value - 1) {
            onCompletionCallback?.call();
            storyIndex = 0.obs;
            restartProgress();
            forwardProgress();
          }
        }

        if (isDecrementStoryIndex.isTrue) {
          if (storyIndex > 0) {
            storyIndex.value--;
            restartProgress();
            forwardProgress();
            update();
          }
        }
      }

      update();
      isIncrementStoryIndex = false.obs;
      isDecrementStoryIndex = false.obs;
    });

    controller.forward();
    update();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void stopProgress() {
    controller.stop();
    update();
  }

  void updateStoryIndex(int index) {
    storyIndex.value = index;
    update();
  }

  void forwardProgress() {
    controller.forward();
    update();
  }

  void updateDuration(int newDuration) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (newDuration != duration) {
        duration = newDuration;
        controller.duration = Duration(seconds: newDuration);
        restartProgress();
        forwardProgress();
        return;
      }
      duration = 5;

      update();
    });
  }

  void restartProgress() {
    controller.reset();
    update();
  }
}
