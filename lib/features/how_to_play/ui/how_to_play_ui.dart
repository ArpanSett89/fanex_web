import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fanex_web/utils/responsive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../common/common.dart';
import '../../../common/widgets/footer/footer_ui.dart';
import '../../../common/widgets/header/header_ui.dart';
import '../../../common/widgets/scroll_control_button/scroll_control_button.dart';
import '../../../utils/indexing_bloc/index_bloc.dart';

class HowToPlayView extends StatefulWidget {
  const HowToPlayView({Key? key}) : super(key: key);

  @override
  State<HowToPlayView> createState() => _HowToPlayViewState();
}

class _HowToPlayViewState extends State<HowToPlayView> {
  String? videoId;

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
    AppStrings.cardTitle8,
    AppStrings.cardTitle9,
    AppStrings.cardTitle10,
    AppStrings.cardTitle11,
    AppStrings.cardTitle12,
    AppStrings.cardTitle13,
    AppStrings.cardTitle14,
  ];
  List<String> tabTitle = [
    AppStrings.tabText1,
    AppStrings.tabText2,
    AppStrings.tabText3,
    AppStrings.tabText4,
    AppStrings.tabText5,
    AppStrings.tabText6,
  ];

  final ScrollController _scrollController = ScrollController();
  var _isVisibleForScrollView = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          if (_isVisibleForScrollView) {
            setState(() {
              _isVisibleForScrollView = false;
            });
          }
        }
      } else {
        if (!_isVisibleForScrollView) {
          setState(() {
            _isVisibleForScrollView = true;
          });
        }
      }
    });
    videoId = 'XMKJj4GXFn4'; // BBAyRBTfsOU
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
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
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
              Header(),
              Responsive(
                  mobile: SizedBox(
                    height: size.height * 0.2,
                  ),
                  tablet: SizedBox(
                    height: size.height * 0.43,
                  ),
                  desktop: SizedBox(
                    height: size.height * 0.43,
                  )),
              Center(
                  child: Responsive(
                mobile: Text(
                  AppStrings.tabText2,
                  style: TextStyle(
                      fontSize: size.width * 0.1,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                ),
                tablet: Text(
                  AppStrings.tabText2,
                  style: TextStyle(
                      fontSize: size.width * 0.045,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                ),
                desktop: Text(
                  AppStrings.tabText2,
                  style: TextStyle(
                      fontSize: size.width * 0.045,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.width * 0.1),
                  child: Responsive(
                    mobile: Container(
                      color: AppColors.black,
                      height: MediaQuery.of(context).size.height * 0.35,
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
                    ),
                    tablet: Container(
                      color: AppColors.black,
                      height: MediaQuery.of(context).size.height * 0.8,
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
                    ),
                    desktop: Container(
                      color: AppColors.black,
                      height: MediaQuery.of(context).size.height * 0.8,
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
                    ),
                  )),
              BlocProvider<IndexBloc>(
                create: (context) => IndexBloc()..add(GetHoverIndex(0)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Responsive(
                    mobile: GridView.builder(
                        itemCount: 7,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, crossAxisSpacing: 20.0),
                        itemBuilder: (BuildContext context, int index) {
                          return MouseRegion(
                            onEnter: (event) {
                              BlocProvider.of<IndexBloc>(context)
                                  .add(GetHoverIndex(index));
                            },
                            onExit: (event) {
                              BlocProvider.of<IndexBloc>(context)
                                  .add(GetHoverIndex(selectedIndex));
                            },
                            child: BlocBuilder<IndexBloc, IndexState>(
                              builder: (context, state) {
                                if (state is HoverIndexLoaded) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                        onTap = false;
                                      });
                                    },
                                    child: Card(
                                      color: state.index == index ||
                                              selectedIndex == index
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
                                            width: size.width * 0.12,
                                            height: size.width * 0.12,
                                            fit: BoxFit.fill,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            title[index],
                                            style: TextStyle(
                                                fontFamily: 'Oswald',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: state.index == index ||
                                                        selectedIndex == index
                                                    ? AppColors.white
                                                    : AppColors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                return Container();
                              },
                            ),
                          );
                        }),
                    tablet: GridView.builder(
                        itemCount: 7,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4, crossAxisSpacing: 20.0),
                        itemBuilder: (BuildContext context, int index) {
                          return MouseRegion(
                            onEnter: (event) {
                              BlocProvider.of<IndexBloc>(context)
                                  .add(GetHoverIndex(index));
                            },
                            onExit: (event) {
                              BlocProvider.of<IndexBloc>(context)
                                  .add(GetHoverIndex(selectedIndex));
                            },
                            child: BlocBuilder<IndexBloc, IndexState>(
                              builder: (context, state) {
                                if (state is HoverIndexLoaded) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                        onTap = false;
                                      });
                                    },
                                    child: Card(
                                      color: state.index == index ||
                                              selectedIndex == index
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
                                            width: size.width * 0.080,
                                            height: size.width * 0.080,
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
                                                fontSize: 20,
                                                color: state.index == index ||
                                                        selectedIndex == index
                                                    ? AppColors.white
                                                    : AppColors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                return Container();
                              },
                            ),
                          );
                        }),
                    desktop: GridView.builder(
                        itemCount: 7,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 7, crossAxisSpacing: 20.0),
                        itemBuilder: (BuildContext context, int index) {
                          return MouseRegion(
                            onEnter: (event) {
                              BlocProvider.of<IndexBloc>(context)
                                  .add(GetHoverIndex(index));
                            },
                            onExit: (event) {
                              BlocProvider.of<IndexBloc>(context)
                                  .add(GetHoverIndex(selectedIndex));
                            },
                            child: BlocBuilder<IndexBloc, IndexState>(
                              builder: (context, state) {
                                if (state is HoverIndexLoaded) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                        onTap = false;
                                      });
                                    },
                                    child: Card(
                                      color: state.index == index ||
                                              selectedIndex == index
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
                                                color: state.index == index ||
                                                        selectedIndex == index
                                                    ? AppColors.white
                                                    : AppColors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                return Container();
                              },
                            ),
                          );
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: size.width * 0.035,
              ),
              Center(
                  child: Responsive(
                      mobile: Text(
                        title[selectedIndex],
                        style: TextStyle(
                            fontSize: size.width * 0.08,
                            fontFamily: 'Oswald',
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      tablet: Text(
                        title[selectedIndex],
                        style: TextStyle(
                            fontSize: size.width * 0.035,
                            fontFamily: 'Oswald',
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      desktop: Text(
                        title[selectedIndex],
                        style: TextStyle(
                            fontSize: size.width * 0.035,
                            fontFamily: 'Oswald',
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ))),
              SizedBox(
                height: size.width * 0.035,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: InkWell(
                  onTap: () {
                    if (kDebugMode) {
                      print(title[selectedIndex]);
                    }
                    setState(() {
                      onTap = !onTap;
                    });
                  },
                  child: Responsive(
                      mobile: Column(
                        children: [
                          Card(
                              color:
                                  onTap ? AppColors.seeGreen : AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: onTap
                                              ? AppColors.white
                                              : AppColors.seeGreen,
                                          radius: 20,
                                          child: CircleAvatar(
                                            radius: 6,
                                            backgroundColor: onTap
                                                ? AppColors.seeGreen
                                                : AppColors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 60,
                                        ),
                                        Text(title[selectedIndex],
                                            style: TextStyle(
                                                fontSize: size.width * 0.04,
                                                fontFamily: 'Oswald',
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Icon(
                                      onTap ? EvaIcons.minus : EvaIcons.plus,
                                      size: 30,
                                      color: onTap
                                          ? AppColors.white
                                          : AppColors.seeGreen,
                                    )
                                  ],
                                ),
                              )),
                          Visibility(
                            visible: onTap ? true : false,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              color: AppColors.white,
                              height: 200,
                              width: size.width,
                            ),
                          )
                        ],
                      ),
                      tablet: Column(
                        children: [
                          Card(
                              color:
                                  onTap ? AppColors.seeGreen : AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: onTap
                                              ? AppColors.white
                                              : AppColors.seeGreen,
                                          radius: 25,
                                          child: CircleAvatar(
                                            radius: 11,
                                            backgroundColor: onTap
                                                ? AppColors.seeGreen
                                                : AppColors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 60,
                                        ),
                                        Text(title[selectedIndex],
                                            style: TextStyle(
                                                fontSize: size.width * 0.020,
                                                fontFamily: 'Oswald',
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Icon(
                                      onTap ? EvaIcons.minus : EvaIcons.plus,
                                      size: 40,
                                      color: onTap
                                          ? AppColors.white
                                          : AppColors.seeGreen,
                                    )
                                  ],
                                ),
                              )),
                          Visibility(
                            visible: onTap ? true : false,
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              color: AppColors.white,
                              height: 200,
                              width: size.width,
                            ),
                          ),
                        ],
                      ),
                      desktop: Column(
                        children: [
                          Card(
                              color:
                                  onTap ? AppColors.seeGreen : AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: onTap
                                              ? AppColors.white
                                              : AppColors.seeGreen,
                                          radius: 25,
                                          child: CircleAvatar(
                                            radius: 11,
                                            backgroundColor: onTap
                                                ? AppColors.seeGreen
                                                : AppColors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 60,
                                        ),
                                        Text(title[selectedIndex],
                                            style: TextStyle(
                                                fontSize: size.width * 0.015,
                                                fontFamily: 'Oswald',
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Icon(
                                      onTap ? EvaIcons.minus : EvaIcons.plus,
                                      size: 40,
                                      color: onTap
                                          ? AppColors.white
                                          : AppColors.seeGreen,
                                    )
                                  ],
                                ),
                              )),
                          Visibility(
                            visible: onTap ? true : false,
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              color: AppColors.white,
                              height: 200,
                              width: size.width,
                            ),
                          ),
                        ],
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
      floatingActionButton: ScrollControlButton(
        onTap: () {
          _scrollController.animateTo(0,
              duration: const Duration(seconds: 1), curve: Curves.linear);
        },
        isVisible: _isVisibleForScrollView,
      ),
    );
  }
}
