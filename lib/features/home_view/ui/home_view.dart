import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../common/common.dart';
import '../widgets/body_widgets.dart';

class HomeView extends StatefulWidget {
const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  final List<String> title = [
    'Free to Play',
    'Real Cash Prizes',
    'Enter Contest in Less than a Minute ()',
  ];
  String? videoId;
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    videoId ='l_V4ufXCckA';
    if (kDebugMode) {
      print(videoId);
    } // BBAyRBTfsOU
    controller = YoutubePlayerController(
      initialVideoId: videoId.toString(),
      params: const YoutubePlayerParams(
        color: 'red',
        showControls: true,
        autoPlay: true,
        mute:true,
      //  showFullscreenButton: true,
      ),
    );
  }
ScrollController scrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey.withOpacity(0.7),
      body: SingleChildScrollView(
        controller:scrollController,
        //physics: NeverScrollableScrollPhysics(),
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
                Padding(
                  padding: const EdgeInsets.only(top: AppSizes.dimen60),
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: AppSizes.dimen30,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.width > 720
                                ? MediaQuery.of(context).size.height * 0.47
                                : MediaQuery.of(context).size.height * 0.50,
                            child: const BodyWidgets()),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text('LESS TAPS, MORE FUN !',
                        style: TextStyle(
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w700,
                          fontSize: MediaQuery.of(context).size.width * 0.030,
                          color: AppColors.black,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.11),
                      child: Center(
                        child: Text(
                          'Choose the cricket player that will have the best performance in each statistical category. Contests may have from 1 to 5 statistical categories. Users may play in public or private contests with friends.',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: MediaQuery.of(context).size.width * 0.019,
                            color: AppColors.black,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 3,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width > 720
                          ? MediaQuery.of(context).size.height * 0.09
                          : MediaQuery.of(context).size.height * 0.40,
                      child: Center(
                          child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection:
                                  MediaQuery.of(context).size.width > 720
                                      ? Axis.horizontal
                                      : Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return _listItem(context, title[index],
                                    '${index + 1}', index);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return MediaQuery.of(context).size.width > 720
                                    ? SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      )
                                    : SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                      );
                              },
                              itemCount: title.length)),
                    )
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  child: Container(
                    color: AppColors.black,
                    height: MediaQuery.of(context).size.width > 720
                        ? MediaQuery.of(context).size.height * 0.8
                        : MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    child: YoutubePlayerIFrame(
                      controller: controller,
                      aspectRatio: 3/2,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  child: _downloadBloc(context),
                ),
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  //alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                      color: AppColors.amber,
                      image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage('assets/images/footer_banner.png'),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.dimen55),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/fanex_logo.png',
                          width: 170,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Terms Of Use',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.white,
                                      ),
                                    )),
                                const Text('|',style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.white,
                                ),),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Privacy Policy',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.white,
                                      ),
                                    )),
                              ],
                            ),
                            Flexible(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: const Text(
                                  'This game involves an element of financial risk and may be addictive. Please play responsibly at your own risk. All FanEx contests are only applicable for residents of India above 18 years old. Residents located in Assam, Sikkim, Nagaland, Andra Pradesh, Odisha, Tamil Nadu, and Telangana are not eligible to participate in any contest.',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
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
          : RichText(
              overflow: TextOverflow.ellipsis,
              text:  TextSpan(
                text: 'Enter Contest in Less than a Minute',
                style:const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  const TextSpan(
                    text: '(',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Oswald',
                        fontWeight: FontWeight.bold),
                  ),
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
                        }
                  ),
                  const TextSpan(
                    text: ')',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Oswald',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              maxLines: 2,
            ),
    ],
  );
}

Widget _downloadBloc(context) {
  List<String> title1 = [
    'No need to find a combination of 11 players within a set limit of credits',
    'Simply pick the cricket player that will have the best performance',
    'Free to play contests include real cash prizes',
    'Create your own contest to challenge other users or just your friends'
  ];
  return Container(
    height: MediaQuery.of(context).size.height * 0.8,
    width: MediaQuery.of(context).size.width * 0.8,
    child: ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: MediaQuery.of(context).size.width > 720
          ? Axis.horizontal
          : Axis.vertical,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
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
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Image.asset(
                    'assets/images/fanex_logo.png',
                    width: MediaQuery.of(context).size.width > 720
                        ? 220
                        : MediaQuery.of(context).size.width * 0.40,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
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
                        width: MediaQuery.of(context).size.width * 0.02,
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
                    height: MediaQuery.of(context).size.height * 0.05,
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
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
          width: MediaQuery.of(context).size.width * 0.15,
        ),
        Image.asset(
          'assets/images/mobile.png',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width > 720
              ? MediaQuery.of(context).size.width * 0.32
              : MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.width > 720
              ? MediaQuery.of(context).size.height * 0.75
              : MediaQuery.of(context).size.height * 0.8,
        ),
      ],
    ),
  );
}
