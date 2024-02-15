import 'package:codeway_case_study/widgets/video_player_widget.dart';
import 'package:flutter/material.dart';

class InstagramMainPageFeedWidget extends StatelessWidget {
  final String userName;
  final String pictureName;
  final String profilePicture;
  final bool isVideo;
  const InstagramMainPageFeedWidget(
      {super.key,
      required this.userName,
      required this.pictureName,
      required this.profilePicture,
      required this.isVideo});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: ClipOval(
                        child: Image.asset(
                          profilePicture,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      userName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const Text(" • 3h")
                  ],
                ),
                const Text("•••"),
              ],
            ),
            const SizedBox(height: 10),
            isVideo
                ? SizedBox(
                    height: 350,
                    child: VideoPlayerWidget(
                      videoUrl: pictureName,
                      onVideoDuration: (duration) {},
                    ))
                : Image.asset(pictureName,
                    width: 370, height: 320, fit: BoxFit.cover),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.favorite_border),
                    SizedBox(width: 10),
                    Icon(Icons.comment),
                    SizedBox(width: 10),
                    Icon(Icons.send_outlined)
                  ],
                ),
                Icon(Icons.save_alt_outlined)
              ],
            )
          ],
        ));
  }
}
