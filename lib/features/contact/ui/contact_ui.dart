import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:html' as html;
import '../../../common/common.dart';

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
      return Text(
          'FAN EXCHANGE PRIVATE LIMITED. 6417 Sector C. Pocket 6 Vasant Kunj, NEW DELHI 110070',
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center);
    } else if (index == 1) {
      return TextButton(
          onPressed: () {

            html.window.open(' mailto:support@fanex.in',"_blank");
          },
          child: Text('support@fanex.in',
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center));
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: (){
              print('facebook click');
              html.window.open('https://www.facebook.com/FanEx-116543443226030/',"_blank");
            },
              child: Image.asset(
            'assets/icons/facebook_icon.png',
            height: 40,
            width: 40,
          )),
          InkWell(
            onTap: (){
              print('facebook click');
              html.window.open('https://twitter.com/FanExCricket',"_blank");
            },
            child: Image.asset(
              'assets/icons/twitter_icon.png',
              height: 40,
              width: 40,
            ),
          ),
          InkWell(
            onTap: (){
              print('facebook click');

              html.window.open('https://www.youtube.com/channel/UCQexnUTnIsySFHK6hJLN-rA',"_blank");
            },
            child: Image.asset(
              'assets/icons/youtube_icon.png',
              height: 40,
              width: 40,
            ),
          ),
          InkWell(
            onTap: (){
              print('facebook click');

              html.window.open('https://www.instagram.com/fanexchangecricket/',"_blank");
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: AppColors.lightGrey.withOpacity(0.78),
            image: const DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('assets/images/contect_banner.png'),
                fit: BoxFit.cover)),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: size.height * 0.30,
            ),
            Center(
              child: Text(
                'CONTACT',
                style: TextStyle(
                    fontSize: size.width * 0.045,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.width * 0.025,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 125),
              child: Container(
                // color: AppColors.black,
                width: size.width,
                height: size.height * 0.5,
                child: Center(
                  child: ListView.separated(
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    //gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3,crossAxisSpacing: 20.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // height: 250,
                        width: 250,
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    imageTitle[index],
                                  ),
                                  fit: BoxFit.cover,
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
                              height: 180,
                              width: 180,
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: getIndex(index),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 30,
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSizes.dimen55),
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
                            const Text(
                              '|',
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.white,
                              ),
                            ),
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
          ],
        ),
      ),
    );
  }
}
