import 'package:flutter/material.dart';
import 'package:instagram_ui24/profilescreen.dart';
import 'package:instagram_ui24/reelscreen.dart';
import 'package:instagram_ui24/storypage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> generateImagePaths(int count) {
      return List.generate(count, (index) {
        return 'assets/image${index % 8}.jpg';
      });
    }

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

    final List<String> imagePaths = generateImagePaths(100);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20), // You can adjust this radius
            ),
          ),
          backgroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Instagram",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ),
          titleSpacing: 2,
          actions: [
            Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(width: 23),
            Icon(Icons.message_outlined, color: Colors.white, size: 30),
            SizedBox(width: 10),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imagePaths.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
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
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(width: 2, color: Colors.red)),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            backgroundImage: AssetImage(
                              generateImage(index),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "User Name ",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(width: 2, color: Colors.white),
                            ),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.red,
                              backgroundImage: AssetImage(
                                generateImage(index),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "User name $index",
                                  style: TextStyle(color: Colors.indigoAccent),
                                ),
                                Text(
                                  "Any  $index",
                                  style: TextStyle(color: Colors.indigoAccent),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height,
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                generateImage(index),
                              ),
                              fit: BoxFit.cover),
                          color: Colors.black26),
                    ),
                    SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.favorite_border, color: Colors.white),
                          SizedBox(width: 20),
                          Icon(Icons.chat_bubble_outline, color: Colors.white),
                          SizedBox(width: 20),
                          Icon(Icons.send_outlined, color: Colors.white),
                          Spacer(),
                          // SizedBox(width: 150,),
                          Icon(Icons.save_alt, color: Colors.white),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
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
                            builder: (context) => ReelsPage(),
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
      ),
    );
  }
}
