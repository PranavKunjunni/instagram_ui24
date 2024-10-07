import 'package:flutter/material.dart';

class StoryPage extends StatelessWidget {
  final int initialIndex;
  final List<String> imagePaths;

  const StoryPage(
      {super.key, required this.initialIndex, required this.imagePaths});

  String generateImage(int index) {
    List<String> images = [
        "assets/image0.jpg",
        "assets/image1.jpg",
        "assets/image2.jpg",
        "assets/image3.jpg",
        "assets/image4.jpg",
        "assets/image5.jpg",
        "assets/image6.jpg",
        "assets/image7.jpg",
        "assets/image8.jpg",
    ];

    return images[index % images.length];
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        controller: PageController(initialPage: initialIndex),
        itemBuilder: (context, index) => Container(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: CircleAvatar(
                  backgroundImage: AssetImage(generateImage(index)),
                  radius: 25,
                ),
              ),
              Positioned(
                top: 40,
                right: 16,
                child: Row(
                  children: [
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                child: Container(
                  width: screenWidth,
                  height: 100,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.comment,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "message",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.favorite,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.send_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
