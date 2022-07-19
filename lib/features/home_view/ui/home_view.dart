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
import '../widgets/terms_of_use.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
                  const BodyWidgets(),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.13,
                        right: size.width * 0.13,
                        top: size.width * 0.06),
                    child: Column(
                      children: [
                        Text('LESS TAPS, MORE FUN !',
                            style: TextStyle(
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w700,
                              fontSize: size.width <= 800
                                  ? AppSizes.headline4
                                  : size.width * 0.030,
                              color: AppColors.black,
                            )),
                        Text(
                          'Choose the cricket player that will have the best performance in each statistical category. Contests may have from 1 to 5 statistical categories. Users may play in public or private contests with friends.',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: size.width * 0.018,
                            color: AppColors.black,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                  Responsive(
                    mobile: Container(
                      margin: EdgeInsets.all(size.width * 0.05),
                      width: size.width,
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return _listItem(
                                context, title[index], '${index + 1}', index);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: size.height * 0.04,
                            );
                          },
                          itemCount: title.length),
                    ),
                    tablet: Container(
                      margin: EdgeInsets.all(size.width * 0.05),
                      width: size.width,
                      height: size.height * 0.20,
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
                    desktop: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05),
                      width: size.width,
                      height: size.height * 0.20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _listItem(context, title[0], '${1}', 0),
                          const SizedBox(width: AppSizes.dimen24,),
                          _listItem(context, title[1], '${2}', 1),
                          const SizedBox(width: AppSizes.dimen24,),
                          _listItem(context, title[2], '${3}', 2),
                        ],
                      ),
                    ),
                  ),
                  Responsive(
                    mobile: Container(
                      margin: EdgeInsets.all(size.width * 0.05),
                      color: AppColors.black,
                      height: size.height * 0.35,
                      width: size.width,
                      child: YoutubePlayerIFrame(
                        controller: controller,
                        aspectRatio: 3 / 2,
                      ),
                    ),
                    tablet: Container(
                      margin: EdgeInsets.all(size.width * 0.05),
                      color: AppColors.black,
                      height: size.height * 0.8,
                      width: size.width,
                      child: YoutubePlayerIFrame(
                        controller: controller,
                        aspectRatio: 3 / 2,
                      ),
                    ),
                    desktop: Container(
                      margin: EdgeInsets.all(size.width * 0.05),
                      color: AppColors.black,
                      height: size.height * 0.8,
                      width: size.width,
                      child: YoutubePlayerIFrame(
                        controller: controller,
                        aspectRatio: 3 / 2,
                      ),
                    ),
                  ),
                  _downloadBloc(context),
                  const FooterView(),
                ]),
          ),
        ),
        floatingActionButton: ScrollControlButton(
          onTap: () {
            _scrollController.animateTo(0,
                duration: const Duration(seconds: 1), curve: Curves.linear);
          },
          isVisible: _isVisibleForScrollView,
        ));
  }
}

Widget _listItem(context, String title, title1, int index) {
  return SizedBox(
    width: MediaQuery
        .of(context)
        .size
        .width * 0.25,
    child: Row(
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
        Flexible(
            child: index != 2
                ? Text(
              title,
              maxLines: 2,
              style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.bold),
            )
                : RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Enter Contest in Less than a Minute (',
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const TermsOfUse()));
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
            ))
      ],
    ),
  );
}

Widget _downloadBloc(context) {
  Size size = MediaQuery
      .of(context)
      .size;
  List<String> title1 = [
    'No need to find a combination of 11 players within a set limit of credits',
    'Simply pick the cricket player that will have the best performance',
    'Free to play contests include real cash prizes',
    'Create your own contest to challenge other users or just your friends'
  ];
  return Responsive(
      mobile: Container(
        margin: EdgeInsets.all(size.width * 0.05),
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
                            height: AppSizes.dimen12,
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
        margin: EdgeInsets.all(size.width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            fontSize: AppSizes.headline1,
                            color: AppColors.black,
                          )),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Image.asset(
                        'assets/images/fanex_logo.png',
                        width: size.width * 0.15,
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
            Image.asset(
              'assets/images/mobile.png',
              fit: BoxFit.cover,
              height: size.width * 0.4,
            ),
          ],
        ),
      ),
      desktop: Container(
        margin: EdgeInsets.all(size.width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                radius: AppSizes.dimen12,
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
                                fontSize: AppSizes.headline4,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkGrey,
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
                        width: AppSizes.dimen24,
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
                            height: AppSizes.dimen12,
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
            Image.asset(
              'assets/images/mobile.png',
              fit: BoxFit.cover,
              height: 500,
            ),
          ],
        ),
      ));
}
