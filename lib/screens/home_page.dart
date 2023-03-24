import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> watchList = [
    "images/red_watch.png",
    "images/orange_watch.png",
    "images/tan_watch.png",
    "images/lightBlue_watch.png",
    "images/lightGreen_watch.png",
    "images/green_watch.png",
    "images/blue_watch.png",
  ];
  List<Color> watchChangerColorList = [
    const Color.fromRGBO(191, 63, 73, 1),
    const Color.fromRGBO(3, 16, 19, 1),
    const Color.fromRGBO(181, 157, 150, 1),
    const Color.fromRGBO(194, 195, 198, 1),
    const Color.fromRGBO(145, 143, 143, 1),
    const Color.fromRGBO(187, 175, 161, 1),
    const Color.fromRGBO(91, 97, 113, 1),
  ];

  List<String> bandList = [
    "images/red_band.png",
    "images/orange_band.png",
    "images/tan_band.png",
    "images/lightBlue_band.png",
    "images/lightGreen_band.png",
    "images/green_band.png",
    "images/blue_band.png",
  ];
  List<Color> bandChangerColorList = [
    const Color.fromRGBO(191, 63, 73, 1),
    const Color.fromRGBO(198, 126, 90, 1),
    const Color.fromRGBO(193, 179, 162, 1),
    const Color.fromRGBO(53, 54, 72, 1),
    const Color.fromRGBO(78, 81, 67, 1),
    const Color.fromRGBO(55, 64, 56, 1),
    const Color.fromRGBO(52, 56, 75, 1),
  ];

  bool liked = false;
  int piece = 0;
  final _pageViewController = PageController();
  final _pageViewController1 = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        shadowColor: Colors.transparent,
        title: SizedBox(
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.person_outline, color: Colors.black, size: 35),
              Row(
                children: const [
                  Icon(Icons.search, color: Colors.black, size: 35),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.mail_outline, color: Colors.black, size: 35)
                ],
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.55,
            padding: const EdgeInsets.only(left: 35, right: 35, bottom: 35),
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: Get.width * 0.6,
                    child: PageView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Image(image: AssetImage(bandList[index]));
                      },
                      itemCount: bandList.length,
                      physics: const BouncingScrollPhysics(),
                      controller: _pageViewController,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: Get.height * 0.265,
                    child: PageView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Image(
                          image: AssetImage(watchList[index]),
                        );
                      },
                      itemCount: watchList.length,
                      physics: const BouncingScrollPhysics(),
                      controller: _pageViewController1,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 30,
                    height: 315,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            _pageViewController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear,
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 5, top: 5),
                            width: 30,
                            height: 35,
                            decoration: BoxDecoration(
                                color: bandChangerColorList[index],
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        );
                      },
                      physics: const BouncingScrollPhysics(),
                      itemCount: bandChangerColorList.length,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 280,
                    height: 30,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            _pageViewController1.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear,
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: watchChangerColorList[index],
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        );
                      },
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: watchChangerColorList.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(
                  left: Get.width * 0.08, right: Get.width * 0.08, top: 45),
              width: Get.width,
              height: Get.height * 0.40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                  color: Colors.black),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Apple Watch",
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              liked = !liked;
                            });
                          },
                          icon: liked
                              ? const Icon(
                                  Icons.star,
                                  size: 30,
                                  color: Colors.yellow,
                                )
                              : const Icon(
                                  Icons.star_outline,
                                  size: 30,
                                  color: Colors.white,
                                ))
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscimg elit. Phasellus tincidunt et metus mattis auctor.",
                    style: TextStyle(
                        color: Color.fromRGBO(66, 66, 66, 1), fontSize: 20),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  if (piece != 0) {
                                    piece--;
                                  }
                                });
                              },
                              child: Container(
                                width: 45,
                                height: 55,
                                color: const Color.fromRGBO(23, 23, 23, 1),
                                child: const Center(
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              )),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 25, right: 25),
                              child: Text(
                                piece.toString(),
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white),
                              )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  if (piece != 9) {
                                    piece++;
                                  }
                                });
                              },
                              child: Container(
                                width: 45,
                                height: 55,
                                color: const Color.fromRGBO(23, 23, 23, 1),
                                child: const Center(
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ))
                        ],
                      ),
                      Text(
                        "${piece * 350} \$",
                        style: const TextStyle(
                            fontSize: 35,
                            color: Color.fromRGBO(188, 188, 188, 1)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
