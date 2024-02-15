import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final String userName;
  final String userProfilePicturePath;
  final double radius, width, height;

  const CircleWidget(
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
                color: const Color.fromARGB(255, 183, 183, 183), // Border color
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
