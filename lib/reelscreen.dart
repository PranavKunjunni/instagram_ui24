import 'package:flutter/material.dart';
import 'package:instagram_ui24/main.dart';
import 'package:instagram_ui24/profilescreen.dart';
import 'package:instagram_ui24/storypage.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});
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
    List<String> imagePaths = [
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Reels",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 14),
            child: Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: 25,
            ),
          )
        ],
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  generateImage(index),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.1,
                left: MediaQuery.of(context).size.width * 0.03,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.1),
                        border: Border.all(width: 2, color: Colors.red),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StoryPage(
                                initialIndex: index,
                                imagePaths: imagePaths,
                              ),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.06,
                          backgroundColor: Colors.grey,
                          backgroundImage: AssetImage(
                            generateImage(index),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profile Name",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                          ),
                        ),
                        Icon(
                          Icons.music_note,
                          size: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                    ),
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Follow",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.07,
                right: MediaQuery.of(context).size.width * 0.05,
                child: Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.08,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      "Likes",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Icon(
                      Icons.comment,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.08,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Icon(
                      Icons.send_outlined,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.08,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.08,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomAppBar(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.home_filled,
                  color: Colors.white,
                  size: 35,
                ),
                Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 35,
                ),
                Icon(
                  Icons.post_add,
                  color: Colors.white,
                  size: 35,
                ),
                Builder(
                  builder: (context) => IconButton(
                    icon: Icon(
                      Icons.video_collection_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ),
                      );
                    },
                  ),
                ),
                Builder(
                  builder: (context) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Profilescreen(),
                      ));
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
