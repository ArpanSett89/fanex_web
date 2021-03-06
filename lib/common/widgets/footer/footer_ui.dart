import 'package:fanex_web/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import '../../common.dart';

class FooterView extends StatelessWidget {
  const FooterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
      height: 180,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: AppColors.amber,
          image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage('assets/images/footer_banner.png'),
              fit: BoxFit.cover)),
      child: Responsive(
        mobile: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/fanex_logo.png',
              width: 140,
              fit: BoxFit.cover,
            ),
            Flexible(
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
                              fontSize: 15,
                              color: AppColors.white,
                            ),
                          )),
                      const Text(
                        '|',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Privacy Policy',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.white,
                            ),
                          )),
                    ],
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(top: AppSizes.dimen16),
                      width: MediaQuery.of(context).size.width,
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
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Follow FanEx:',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.black,
                    )),
                InkWell(
                    onTap: () {
                      html.window.open(
                          'https://www.facebook.com/FanEx-116543443226030/',
                          "_blank");
                    },
                    child: Image.asset(
                      'assets/icons/facebook_icon.png',
                      height: 30,
                      width: 30,
                    )),
                InkWell(
                  onTap: () {
                    html.window
                        .open('https://twitter.com/FanExCricket', "_blank");
                  },
                  child: Image.asset('assets/icons/twitter_icon.png',
                      height: 30, width: 30),
                ),
                InkWell(
                  onTap: () {
                    html.window.open(
                        'https://www.youtube.com/channel/UCQexnUTnIsySFHK6hJLN-rA',
                        "_blank");
                  },
                  child: Image.asset(
                    'assets/icons/youtube_icon.png',
                    height: 30,
                    width: 30,
                  ),
                ),
                InkWell(
                  onTap: () {
                    html.window.open(
                        'https://www.instagram.com/fanexchangecricket/',
                        "_blank");
                  },
                  child: Image.asset(
                    'assets/icons/instagram_icon.png',
                    height: 30,
                    width: 30,
                  ),
                ),
              ],
            )
          ],
        ),
        tablet: Row(
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
                    margin: const EdgeInsets.only(top: AppSizes.dimen16),
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
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Follow FanEx',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.black,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Row(
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
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        html.window
                            .open('https://twitter.com/FanExCricket', "_blank");
                      },
                      child: Image.asset(
                        'assets/icons/twitter_icon.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
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
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        html.window.open(
                            'https://www.instagram.com/fanexchangecricket/',
                            "_blank");
                      },
                      child: Image.asset(
                        'assets/icons/instagram_icon.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        desktop: Row(
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
                    margin: const EdgeInsets.only(top: AppSizes.dimen16),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Follow FanEx:',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.black,
                    )),
                const SizedBox(
                  width: 10,
                ),
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
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    html.window
                        .open('https://twitter.com/FanExCricket', "_blank");
                  },
                  child: Image.asset(
                    'assets/icons/twitter_icon.png',
                    height: 40,
                    width: 40,
                  ),
                ),
                const SizedBox(
                  width: 10,
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
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    html.window.open(
                        'https://www.instagram.com/fanexchangecricket/',
                        "_blank");
                  },
                  child: Image.asset(
                    'assets/icons/instagram_icon.png',
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
