import 'package:flutter/material.dart';
import 'dart:html' as html;
import '../../../common/common.dart';
import '../../../common/widgets/footer/footer_ui.dart';
import '../../../common/widgets/header/header_ui.dart';
import '../../../common/widgets/scroll_control_button/scroll_control_button.dart';

class ContactView extends StatefulWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  List<String> imageTitle = [
    'assets/images/map.png',
    'assets/images/email.png',
    'assets/images/contact.png',
  ];
  List<String> title = [
    'ADDRESS',
    'EMAIL',
    'SOCIAL ACCOUNT',
  ];
  getIndex(int index) {
    if (index == 0) {
      return Padding(
        padding: const EdgeInsets.all(AppSizes.dimen12),
        child: Text(
            'FAN EXCHANGE PRIVATE LIMITED. 6417 Sector C. Pocket 6 Vasant Kunj, NEW DELHI 110070',
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center),
      );
    } else if (index == 1) {
      return TextButton(
          onPressed: () {
            html.window.open(' mailto:support@fanex.in', "_blank");
          },
          child: Text('support@fanex.in',
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center));
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () {
                html.window.open(
                    'https://www.facebook.com/FanEx-116543443226030/',
                    "_blank");
              },
              child: Image.asset(
                'assets/icons/facebook_icon.png',
                height: 40,
                width: 40,
              )),
          InkWell(
            onTap: () {
              html.window.open('https://twitter.com/FanExCricket', "_blank");
            },
            child: Image.asset(
              'assets/icons/twitter_icon.png',
              height: 40,
              width: 40,
            ),
          ),
          InkWell(
            onTap: () {
               html.window.open(
                  'https://www.youtube.com/channel/UCQexnUTnIsySFHK6hJLN-rA',
                  "_blank");
            },
            child: Image.asset(
              'assets/icons/youtube_icon.png',
              height: 40,
              width: 40,
            ),
          ),
          InkWell(
            onTap: () {
              html.window.open(
                  'https://www.instagram.com/fanexchangecricket/', "_blank");
            },
            child: Image.asset(
              'assets/icons/instagram_icon.png',
              height: 40,
              width: 40,
            ),
          ),
        ],
      );
    }
  }
  final ScrollController _scrollController = ScrollController();
  var _isVisibleForScrollView = false;
  @override
  void initState(){
    super.initState();
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
      body: SingleChildScrollView(
        controller:_scrollController,
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.lightGrey.withOpacity(0.78),
              image: const DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/contect_banner.png'),
                  fit: BoxFit.cover)),
          child: ListView(
            shrinkWrap: true,
            children: [
              Header(),
              SizedBox(
                height: size.width * 0.17,
              ),
              Center(
                child:Text(
                  AppStrings.tabText6,
                  style: TextStyle(
                      fontSize:size.width>720?AppSizes.dimen60:AppSizes.dimen40,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                ),),
              SizedBox(
                height: size.width * 0.025,
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.width * 0.1),
                child: GridView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding:  const EdgeInsets.all(AppSizes.dimen30),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      imageTitle[index],
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(
                                        1.0,
                                        1.0,
                                      ),
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              title[index],
                              style: const TextStyle(
                                  fontFamily: 'Oswald',
                                  fontSize: 20,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 15),
                            getIndex(index)
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:size.width>720?3:1, crossAxisSpacing: AppSizes.dimen30,mainAxisSpacing: AppSizes.dimen30),
                ),
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              const FooterView(),
            ],
          ),
        ),
      ),
      floatingActionButton: ScrollControlButton(onTap: () {
        _scrollController.animateTo(0,
            duration: const Duration(seconds: 1), curve: Curves.linear);
      }, isVisible: _isVisibleForScrollView,),
    );
  }
}
