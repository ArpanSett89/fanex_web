import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fanex_web/utils/responsive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
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
              SizedBox(
                height: size.width * 0.17,
              ),
              Center(
                child:Text(
                  AppStrings.tabText2,
                  style: TextStyle(
                      fontSize:size.width>720?AppSizes.dimen60:AppSizes.dimen40,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                ),),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.width * 0.1),
                color: AppColors.black,
                height:size.width>720?size.height * 0.8:size.height * 0.35,
                child: YoutubePlayerIFrame(
                  gestureRecognizers: const <
                      Factory<OneSequenceGestureRecognizer>>{},
                  controller: controller,
                  aspectRatio: 3 / 2,
                ),
              ),
              MultiBlocProvider(
                providers: [
                  BlocProvider<IndexBloc>(
                    create: (context) => IndexBloc()..add(GetHoverIndex(0)),
                  ),
                  BlocProvider<IndexBloc>(
                    create: (context) => IndexBloc()..add(GetTapIndex(0)),
                  ),
                ],
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
                              setState(() {
                                hoverIndex = index;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                hoverIndex = selectedIndex;
                              });
                            },
                            child: BlocListener<IndexBloc, IndexState>(
                              listener: (context, state) {
                                if (state is TapIndexLoaded) {
                                  selectedIndex = state.index;
                                }
                              },
                              child: InkWell(
                                onTap: () {
                                  BlocProvider.of<IndexBloc>(context)
                                      .add(GetTapIndex(index));
                                  setState(() {
                                    onTap = false;
                                  });
                                },
                                child: Card(
                                  color: hoverIndex == index ||
                                          selectedIndex == index
                                      ? AppColors.seeGreen
                                      : AppColors.white,
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                            fontSize: AppSizes.headline4,
                                            color: hoverIndex == index ||
                                                    selectedIndex == index
                                                ? AppColors.white
                                                : AppColors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                    tablet: GridView.builder(
                        itemCount: 7,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: AppSizes.dimen24),
                        itemBuilder: (BuildContext context, int index) {
                          return MouseRegion(
                            onEnter: (event) {
                              setState(() {
                                hoverIndex = index;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                hoverIndex = selectedIndex;
                              });
                            },
                            child: BlocListener<IndexBloc, IndexState>(
                              listener: (context, state) {
                                if (state is TapIndexLoaded) {
                                  selectedIndex = state.index;
                                }
                              },
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    onTap = false;
                                  });
                                },
                                child: Card(
                                  color: hoverIndex == index ||
                                          selectedIndex == index
                                      ? AppColors.seeGreen
                                      : AppColors.white,
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: AppSizes.dimen30,
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
                                            fontSize: AppSizes.headline6,
                                            color: hoverIndex == index ||
                                                    selectedIndex == index
                                                ? AppColors.white
                                                : AppColors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
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
                              setState(() {
                                hoverIndex = index;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                hoverIndex = selectedIndex;
                              });
                            },
                            child: BlocListener<IndexBloc, IndexState>(
                              listener: (context, state) {
                                if (state is TapIndexLoaded) {
                                  selectedIndex = state.index;
                                }
                              },
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    onTap = false;
                                  });
                                },
                                child: Card(
                                  color: hoverIndex == index ||
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
                                            fontSize: AppSizes.headline6,
                                            color: hoverIndex == index ||
                                                    selectedIndex == index
                                                ? AppColors.white
                                                : AppColors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
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
                child:Text(
                  title[selectedIndex],
                  style: TextStyle(
                      fontSize:size.width>720?AppSizes.dimen60:AppSizes.dimen40,
                      fontFamily: 'Oswald',
                      color: AppColors.black,
                      fontWeight: FontWeight.bold),
                ),),
              SizedBox(
                height: size.width * 0.035,
              ),
              InkWell(
                onTap: () {
                  if (kDebugMode) {
                    print(title[selectedIndex]);
                  }
                  setState(() {
                    onTap = !onTap;
                  });
                },
                child:Column(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        padding:  const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(AppSizes.cardCornerRadius)),
                          color:
                          onTap ? AppColors.seeGreen : AppColors.white,
                        ),
                        child:ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundColor: onTap
                                ? AppColors.white
                                : AppColors.seeGreen,
                            radius:size.width>720?25:20,
                            child: CircleAvatar(
                              radius:size.width>720?11:6,
                              backgroundColor: onTap
                                  ? AppColors.seeGreen
                                  : AppColors.white,
                            ),
                          ),
                          title:Text(title[selectedIndex],
                              style: TextStyle(
                                  fontSize: AppSizes.headline5,
                                  fontFamily: 'Oswald',
                                  color: AppColors.black
                                      .withOpacity(0.8),
                                  fontWeight: FontWeight.bold)),
                          trailing:Icon(
                            onTap ? EvaIcons.minus : EvaIcons.plus,
                            size: 40,
                            color: onTap
                                ? AppColors.white
                                : AppColors.seeGreen,
                          ),
                        )
                    ),
                    Visibility(
                      visible: onTap ? true : false,
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                          padding: const EdgeInsets.all(AppSizes.dimen16),
                          color: AppColors.white,
                          width: size.width,
                          child: Html(
                            data: r"""<div><ul>
	<li>
		<span style="font-size:16px;"><span style="font-family:tahoma,geneva,sans-serif;">FanEx is the newest and simplest way to play daily fantasy for fans of cricket in India. With less than 5 taps on a mobile device, a fan can enter a contest to play for free with a chance to win real cash prizes.&nbsp;No need to find a combination of 11 players within a set limit of credits.&nbsp;Simply pick the cricket player that will have the best performance in a given statistical category.</span></span></li>
	<li>
		<span style="font-size:16px;"><span style="font-family:tahoma,geneva,sans-serif;">Choose the cricket player that will have the best performance in a given statistical category.&nbsp; Contests may have up to 5 statistical categories.&nbsp;&nbsp;Users may play in public “FANEX” contests or private “USER” created contests with friends.&nbsp;</span></span></li>
	<li>
		<span style="font-size:16px;"><span style="font-family:tahoma,geneva,sans-serif;">Sign-up to play in special contests for beginners with free FanEx Coins granted upon sign-up until you become comfortable with this unique contest structure.</span></span></li>
</ul>
<p>
	<span style="font-size:16px;"><span style="font-family:tahoma,geneva,sans-serif;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#f00;"><strong>&nbsp;×&nbsp;</strong></span> No need to pick your favorite 11 cricketers, within an allocated budget, from both teams playing in an upcoming match to form your fantasy team.</span></span></p>
<p>
	<span style="font-size:16px;"><span style="font-family:tahoma,geneva,sans-serif;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="color: rgb(255, 0, 0);"><strong>×</strong></span><span new="" times=""><span style="color: rgb(255, 0, 0);"><strong>&nbsp;</strong></span></span>&nbsp;No need to spend hours researching or reading predictions by fantasy experts on the upcoming match.</span></span></p>
<p>
	<span style="font-size:16px;"><span style="font-family:tahoma,geneva,sans-serif;"><strong>Playing daily fantasy cricket on The Fan Exchange is simple:</strong></span></span></p>
<p>
	<span style="font-size:16px;"><span style="font-family:tahoma,geneva,sans-serif;"><span style="color:#008000;">►&nbsp;</span>Pick your favorite real-life cricket players (no salary cap or choice of captains)</span></span></p>
<p>
	<span style="font-size:16px;"><span style="font-family:tahoma,geneva,sans-serif;"><span style="color:#008000;">►</span>&nbsp;Challenge friends or compete against other FanEx users</span></span></p>
<p>
	<span style="font-size:16px;"><span style="font-family:tahoma,geneva,sans-serif;"><span style="color:#008000;">►</span>&nbsp;Follow along with your live score as your players compete in real-life matches</span></span></p></div>""",
                          )),
                    ),
                  ],
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
