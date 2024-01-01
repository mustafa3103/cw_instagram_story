import 'package:codeway_case_study/controllers/animatedProgressBarController/animated_progress_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedProgressBarWidget extends StatelessWidget {
  // -> Variables
  final RxInt progressIndex;
  final RxInt videoDuration;
  final VoidCallback? onComplete;

  const AnimatedProgressBarWidget(
      {required this.progressIndex,
      this.onComplete,
      required this.videoDuration});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AnimatedProgressBarController>();

    controller.progressIndex = progressIndex;
    controller.duration = videoDuration;

    return Obx(() => Row(
          children: List<int>.generate(progressIndex.toInt(), (index) => index)
              .map((index) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: index < controller.storyIndex.value
                    ? _completedBar()
                    : index == controller.storyIndex.value
                        ? AnimatedBuilder(
                            animation: controller.animation,
                            builder: ((context, child) {
                              return LinearProgressIndicator(
                                value: controller.animation.value,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                                backgroundColor: Colors.grey,
                              );
                            }))
                        : _emptyBar(),
              ),
            );
          }).toList(),
        ));
  }

  Widget _completedBar() {
    return Container(
      height: 5,
      color: Colors.white,
    );
  }

  Widget _emptyBar() {
    return Container(
      height: 5,
      color: Colors.white30,
    );
  }
}
