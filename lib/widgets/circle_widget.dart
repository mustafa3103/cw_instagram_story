import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final String userName;
  final String userProfilePicturePath;
  final double radius, width, height;

  CircleWidget(
      {Key? key,
      required this.userName,
      required this.userProfilePicturePath,
      required this.height,
      required this.width,
      required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                // Hikaye gösterildi Color.fromARGB(255, 151, 151, 151)
                // Hikaye gösterilmedi Color.fromARGB(255, 225, 75, 150)
                color: const Color.fromARGB(255, 37, 37, 37),
                width: 2,
              ),
            ),
            child: CircleAvatar(
              radius: radius,
              backgroundColor: Colors.grey.shade500,
              child: ClipOval(
                child: Image.asset(
                  userProfilePicturePath,
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          radius == 40 ? Text(userName) : Container(),
        ],
      ),
    );
  }
}
