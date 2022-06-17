import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../common/common.dart';
import '../../../common/widgets/footer/footer_ui.dart';

class HowToPlayView extends StatefulWidget {
  const HowToPlayView({Key? key}) : super(key: key);

  @override
  State<HowToPlayView> createState() => _HowToPlayViewState();
}

class _HowToPlayViewState extends State<HowToPlayView> {
  String? videoId;

  //late VideoPlayerController controller;
  late YoutubePlayerController controller;
  List<String> imageTitle = [
    'assets/images/sign_in.png',
    'assets/images/enter_a_contest.png',
    'assets/images/create_contest.png',
    'assets/images/follow_friend.png',
    'assets/images/chakra.png',
    'assets/images/withdrawls.png',
    'assets/images/other.png',
  ];
  List<String> title = [
    'SIGN UP',
    'ENTER A CONTEST',
    'CREATE CONTEST',
    'FOLLOW FRIENDS',
    'CHAKRA',
    'WITHDRAWALS',
    'OTHERS',
  ];

  //  @override
  //  void initState() {
  //    super.initState();
  //    controller = VideoPlayerController.network('https://www.youtube.com/embed/XMKJj4GXFn4');
  //    controller.addListener(() {
  //      setState(() {});
  //    });
  //    controller.setLooping(true);
  //    controller.initialize().then((_) => setState(() {}));
  //    controller.play();
  //  }
  //
  //  @override
  //  void dispose() {
  //    controller.dispose();
  //    super.dispose();
  //  }
  @override
  void initState() {
    super.initState();
    videoId = 'XMKJj4GXFn4';
    if (kDebugMode) {
      print(videoId);
    } // BBAyRBTfsOU
    controller = YoutubePlayerController(
      initialVideoId: videoId.toString(),
      params: const YoutubePlayerParams(
        color: 'red',
        showControls: true,
        autoPlay: true,
        mute: true,
        //  showFullscreenButton: true,
      ),
    );
  }

  bool showControl = false;
  int hoverIndex = 0;
  int selectedIndex = 0;
  double count = 0;
  bool onTap = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (kDebugMode) {
      print(
      size.width * 0.045,
    );
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.lightGrey.withOpacity(0.73),
              image: const DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/how_to_play_banner.png'),
                  fit: BoxFit.contain)),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: size.height * 0.43,
              ),
              Center(
                child: Text(
                  'HOW TO PLAY',
                  style: TextStyle(
                      fontSize: size.width * 0.045,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: MouseRegion(
                  onEnter: (event) {},
                  child: Container(
                    color: AppColors.black,
                    height: MediaQuery.of(context).size.width > 720
                        ? MediaQuery.of(context).size.height * 0.8
                        : MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    // child:AspectRatio(
                    //   aspectRatio: controller.value.aspectRatio,
                    //   child: Stack(
                    //     alignment: Alignment.bottomCenter,
                    //     children: <Widget>[
                    //       VideoPlayer(controller),
                    //       ClosedCaption(text: controller.value.caption.text),
                    //      // _ControlsOverlay(controller: controller),
                    //       VideoProgressIndicator(controller, allowScrubbing: true),
                    //     ],
                    //   ),
                    // ),
                    child: YoutubePlayerIFrame(
                      gestureRecognizers: const <
                          Factory<OneSequenceGestureRecognizer>>{},
                      controller: controller,
                      aspectRatio: 3 / 2,
                    ),
                    // child: Center(
                    //     child: Html(
                    //   data:
                    //       """<iframe width=1000 height="480" src="https://www.youtube.com/embed/XMKJj4GXFn4" title="FanEx How To Play - English" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>""",
                    // )),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: GridView.builder(
                    itemCount: 7,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: size.width > 1200
                            ? 7
                            : size.width > 720
                                ? 4
                                : 2,
                        crossAxisSpacing: 20.0),
                    itemBuilder: (BuildContext context, int index) {
                      return MouseRegion(
                        onEnter: (event) {
                          setState(() {
                            if (kDebugMode) {
                              print(index);
                            }
                            hoverIndex = index;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            hoverIndex = selectedIndex;
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Card(
                            color:
                                hoverIndex == index || selectedIndex == index
                                    ? AppColors.seeGreen
                                    : AppColors.white,
                            elevation: 5,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Image.asset(
                                  imageTitle[index],
                                  width: size.width * 0.050,
                                  height: size.width * 0.050,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  title[index],
                                  style: TextStyle(
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: hoverIndex == index ||
                                              selectedIndex == index
                                          ? AppColors.white
                                          : AppColors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: size.width * 0.035,
              ),
              Center(
                  child: Text(
                title[selectedIndex],
                style: TextStyle(
                    fontSize: size.width * 0.035,
                    fontFamily: 'Oswald',
                    color: AppColors.black,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: size.width * 0.035,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: InkWell(
                  onTap: () {
                    if (kDebugMode) {
                      print(title[selectedIndex]);
                    }
                    setState(() {
                      onTap = !onTap;
                    });
                  },
                  child: Card(
                      color: onTap ?AppColors.seeGreen:AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                 CircleAvatar(
                                  backgroundColor:onTap ?AppColors.white:AppColors.seeGreen,
                                  radius: 25,
                                  child: CircleAvatar(
                                    radius: 11,
                                    backgroundColor:onTap ?AppColors.seeGreen:AppColors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 60,
                                ),
                                Text(title[selectedIndex],
                                    style: TextStyle(
                                        fontSize: size.width * 0.015,
                                        fontFamily: 'Oswald',
                                        color: AppColors.black.withOpacity(0.8),
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Icon(
                              onTap ? EvaIcons.minus : EvaIcons.plus,
                              size: 40,
                              color:onTap ?AppColors.white:AppColors.seeGreen,
                            )
                          ],
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              const FooterView(),
            ],
          ),
        ),
      ),
    );
  }
}
