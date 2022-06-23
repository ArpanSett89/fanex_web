import 'package:fanex_web/utils/responsive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../common/common.dart';
import '../../../common/widgets/footer/footer_ui.dart';
import '../../../common/widgets/header/header_ui.dart';
import '../../../common/widgets/scroll_control_button/scroll_control_button.dart';
import '../widgets/body_widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> tabTitle = [
    AppStrings.tabText1,
    AppStrings.tabText2,
    AppStrings.tabText3,
    AppStrings.tabText4,
    AppStrings.tabText5,
    AppStrings.tabText6,
  ];
  final List<String> title = [
    'Free to Play',
    'Real Cash Prizes',
    'Enter Contest in Less than a Minute ()',
  ];
  String? videoId;
  var _isVisibleForScrollView = false;
  late YoutubePlayerController controller;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    videoId = 'l_V4ufXCckA';
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
      ),
    );
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          if (_isVisibleForScrollView)
          {
            setState(() {
              _isVisibleForScrollView = false;
            });
          }
        }
      } else {
        if (!_isVisibleForScrollView)
        {
          setState(() {
            _isVisibleForScrollView = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightGrey.withOpacity(0.7),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/home_banner.png'),
                  fit: BoxFit.contain)),
          child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                Header(),
                Padding(
                  padding: const EdgeInsets.only(top: AppSizes.dimen60),
                  child: Center(
                    child: Column(
                      children: const [
                        SizedBox(
                          height: AppSizes.dimen30,
                        ),
                        BodyWidgets(),
                      ],
                    ),
                  ),
                ),
                Responsive(
                  mobile: Column(
                    children: [
                      Text('LESS TAPS, MORE FUN !',
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w700,
                            fontSize: size.width * 0.040,
                            color: AppColors.black,
                          )),
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02),
                          child: Text(
                            'Choose the cricket player that will have the best performance in each statistical category. Contests may have from 1 to 5 statistical categories. Users may play in public or private contests with friends.',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: size.width * 0.025,
                              color: AppColors.black,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                    ],
                  ),
                  tablet: Column(
                    children: [
                      Text('LESS TAPS, MORE FUN !',
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w700,
                            fontSize: size.width * 0.030,
                            color: AppColors.black,
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.11),
                        child: Center(
                          child: Text(
                            'Choose the cricket player that will have the best performance in each statistical category. Contests may have from 1 to 5 statistical categories. Users may play in public or private contests with friends.',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: size.width * 0.013,
                              color: AppColors.black,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                    ],
                  ),
                  desktop: Column(
                    children: [
                      Text('LESS TAPS, MORE FUN !',
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w700,
                            fontSize: size.width * 0.030,
                            color: AppColors.black,
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.11),
                        child: Center(
                          child: Text(
                            'Choose the cricket player that will have the best performance in each statistical category. Contests may have from 1 to 5 statistical categories. Users may play in public or private contests with friends.',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: size.width * 0.013,
                              color: AppColors.black,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                    ],
                  ),
                ),
                Responsive(
                  mobile: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: size.width,
                      //height: size.height * 0.09,
                      child: Center(
                          child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return _listItem(context, title[index],
                                    '${index + 1}', index);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: size.height * 0.04,
                                );
                              },
                              itemCount: title.length)),
                    ),
                  ),
                  tablet: Container(
                    width: size.width,
                    height: size.height * 0.20,
                    child: Center(
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return _listItem(
                                context, title[index], '${index + 1}', index);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: size.width * 0.04,
                            );
                          },
                          itemCount: title.length),
                    ),
                  ),
                  desktop: SizedBox(
                    width: size.width,
                    height: size.height * 0.20,
                    child: Center(
                        child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return _listItem(context, title[index],
                                  '${index + 1}', index);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return size.width > 720
                                  ? SizedBox(
                                width: size.width * 0.04,
                              )
                                  : SizedBox(
                                height: size.height * 0.04,
                              );
                            },
                            itemCount: title.length)),
                  ),
                ),
                Responsive(
                  mobile: Padding(
                    padding: EdgeInsets.all(size.width * 0.05),
                    child: Container(
                      color: AppColors.black,
                      height: size.height * 0.35,
                      width: size.width,
                      child: YoutubePlayerIFrame(
                        controller: controller,
                        aspectRatio: 3 / 2,
                      ),
                    ),
                  ),
                  tablet: Padding(
                    padding: EdgeInsets.all(size.width * 0.05),
                    child: Container(
                      color: AppColors.black,
                      height: size.height * 0.8,
                      width: size.width,
                      child: YoutubePlayerIFrame(
                        controller: controller,
                        aspectRatio: 3 / 2,
                      ),
                    ),
                  ),
                  desktop: Padding(
                    padding: EdgeInsets.all(size.width * 0.05),
                    child: Container(
                      color: AppColors.black,
                      height: size.height * 0.8,
                      width: size.width,
                      child: YoutubePlayerIFrame(
                        controller: controller,
                        aspectRatio: 3 / 2,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.05),
                  child: _downloadBloc(context),
                ),
                const FooterView(),
              ]),
        ),
      ),
      floatingActionButton:ScrollControlButton(onTap: () {
        _scrollController.animateTo(0,
            duration: const Duration(seconds: 1), curve: Curves.linear);
      }, isVisible: _isVisibleForScrollView,)
    );
  }
}

Widget _listItem(context, String title, title1, int index) {
  return Row(
    children: [
      CircleAvatar(
        backgroundColor: AppColors.seeGreen,
        radius: 26,
        child: Text(
          title1,
          style: const TextStyle(
              fontFamily: 'Oswald', fontSize: 35, color: AppColors.white),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      index != 2
          ? Text(
              title,
              maxLines: 2,
              style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.bold),
            )
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                const Text(
                  'Enter Contest in Less than a Minute',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: TextSpan(
                    text: '(',
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Oswald',
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'TERMS APPLY',
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.bold,
                              color: AppColors.twitter),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Privacy Policy"');
                            }),
                      const TextSpan(
                        text: ')',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            )
    ],
  );
}

Widget _downloadBloc(context) {
  Size size = MediaQuery.of(context).size;
  List<String> title1 = [
    'No need to find a combination of 11 players within a set limit of credits',
    'Simply pick the cricket player that will have the best performance',
    'Free to play contests include real cash prizes',
    'Create your own contest to challenge other users or just your friends'
  ];
  return Responsive(
      mobile: Container(
        // height: size.height * 0.8,
        width: size.width * 0.8,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              width: size.width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('DOWNLOAD',
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: AppColors.black,
                          )),
                      Image.asset(
                        'assets/images/fanex_logo.png',
                        width: size.width * 0.35,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: index == 0
                                  ? AppColors.youtube
                                  : AppColors.seeGreen,
                              radius: 20,
                              child: CircleAvatar(
                                backgroundColor: AppColors.transparent,
                                radius: 12,
                                backgroundImage: index == 0
                                    ? const AssetImage(
                                        'assets/icons/cross.png',
                                      )
                                    : const AssetImage(
                                        'assets/icons/check.png',
                                      ),
                              )),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Flexible(
                            child: Text(
                              title1[index],
                              style: TextStyle(
                                fontFamily: 'Oswald',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black.withOpacity(0.7),
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: size.height * 0.05,
                      );
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/qr_code.png',
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/android_download_image.png',
                            width: 120,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            'assets/images/i_phone_download_image.png',
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.width * 0.10,
            ),
            Image.asset(
              'assets/images/mobile.png',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
      tablet: Container(
        height: size.height,
        width: size.width * 0.8,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: size.width > 720 ? Axis.horizontal : Axis.vertical,
          children: [
            SizedBox(
              width: size.width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text('DOWNLOAD',
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: AppColors.black,
                          )),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Image.asset(
                        'assets/images/fanex_logo.png',
                        width: size.width * 0.20,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: index == 0
                                  ? AppColors.youtube
                                  : AppColors.seeGreen,
                              radius: 15,
                              child: CircleAvatar(
                                backgroundColor: AppColors.transparent,
                                radius: 8,
                                backgroundImage: index == 0
                                    ? const AssetImage(
                                        'assets/icons/cross.png',
                                      )
                                    : const AssetImage(
                                        'assets/icons/check.png',
                                      ),
                              )),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Flexible(
                            child: Text(
                              title1[index],
                              style: const TextStyle(
                                fontFamily: 'Oswald',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                              maxLines: 3,
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: size.height * 0.03,
                      );
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/qr_code.png',
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/android_download_image.png',
                            width: 120,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            'assets/images/i_phone_download_image.png',
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.07,
            ),
            FittedBox(
              child: Image.asset(
                'assets/images/mobile.png',
                fit: BoxFit.contain,
                height: 180,
                width: 130,
              ),
            ),
          ],
        ),
      ),
      desktop: SizedBox(
        height: size.height * 0.8,
        width: size.width * 0.8,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(
              width: size.width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text('DOWNLOAD',
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.bold,
                            fontSize: 42,
                            color: AppColors.black,
                          )),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Image.asset(
                        'assets/images/fanex_logo.png',
                        width: size.width > 720 ? 220 : size.width * 0.40,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: index == 0
                                  ? AppColors.youtube
                                  : AppColors.seeGreen,
                              radius: 20,
                              child: CircleAvatar(
                                backgroundColor: AppColors.transparent,
                                radius: 12,
                                backgroundImage: index == 0
                                    ? const AssetImage(
                                        'assets/icons/cross.png',
                                      )
                                    : const AssetImage(
                                        'assets/icons/check.png',
                                      ),
                              )),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Flexible(
                            child: Text(
                              title1[index],
                              style: const TextStyle(
                                fontFamily: 'Oswald',
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: size.height * 0.05,
                      );
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/qr_code.png',
                        width: 110,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/android_download_image.png',
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            'assets/images/i_phone_download_image.png',
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.15,
            ),
            Image.asset(
              'assets/images/mobile.png',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ));
}
