import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../common/common.dart';

class FAQView extends StatefulWidget {
  const FAQView({Key? key}) : super(key: key);

  @override
  State<FAQView> createState() => _FAQViewState();
}

class _FAQViewState extends State<FAQView> {
  List<String> title = [
    'IS DAILY FANTASY CRICKET LEGAL ON THE FAN EXCHANGE (“FANEX”)?',
    'ARE DAILY FANTASY SPORTS BANNED IN ANY STATES OF INDIA?',
    'WHAT IS THE DIFFERENCE BETWEEN FANEX COIN AND CASH ENTRY FEE CONTESTS?',
    'I HAVE RUN OUT OF FANEX COINS, HOW TO GET MORE?',
    'HOW DO I WITHDRAW MY WINNINGS?',
    'CAN I LINK MORE THAN ONE PAYTM ACCOUNT ON FANEX?',
    'IS VERIFICATION NECESSARY TO JOIN CONTESTS ON THE FAN EXCHANGE?',
    'ARE CASH WINNINGS FROM THE FAN EXCHANGE TAXABLE IN INDIA?',
    'HOW MANY TIMES MAY I ENTER A CONTEST?',
    'WILL CONTESTS WINNERS RECEIVE A TAX DEDUCTED AT SOURCE (“TDS”) CERTIFICATE FROM THE FAN EXCHANGE?',
    'WHAT HAPPENDS IF A CONTEST I JOINED IS ABANDONED OR CANCELLED?',
    'CAN I MAKE CHANGES TO MY SELECTED CRICKET PLAYERS DURING A CONTEST?',
  ];
  bool showControl = false;
  int hoverIndex = 20;
  int selectedIndex = 0;
  double count = 0;
  int onTap = 20;

  @override
  Widget build(BuildContext context) {
    print( MediaQuery.of(context).size.width*0.07);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.lightGrey.withOpacity(0.78),
              image: const DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/faq_banner.png'),
                  fit: BoxFit.contain)),
          child: ListView(shrinkWrap: true, children: [
            SizedBox(
              height: size.height * 0.34,
            ),
            Center(
              child: Text(
                'FAQ',
                style: TextStyle(
                    fontSize: size.width * 0.045,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.width * 0.018,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: size.width*0.14),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor:AppColors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,size: 30,
                        color: Colors.black.withOpacity(0.5),
                      )),
                  hintText: 'Search here',
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.28,
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ListView.separated(
                  shrinkWrap: true,
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
                          hoverIndex = 20;
                        });
                      },
                      child: InkWell(
                        onTap: () {
                          print(title[selectedIndex]);
                          setState(() {
                            if (onTap == index) {
                              onTap = 20;
                            } else {
                              onTap = index;
                            }
                          });
                        },
                        child: Card(
                            color: onTap == index || hoverIndex == index
                                ? AppColors.seeGreen
                                : AppColors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: onTap == index ||
                                                hoverIndex == index
                                            ? AppColors.white
                                            : AppColors.seeGreen,
                                        radius: 25,
                                        child: CircleAvatar(
                                          radius: 11,
                                          backgroundColor: onTap == index ||
                                                  hoverIndex == index
                                              ? AppColors.seeGreen
                                              : AppColors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 60,
                                      ),
                                      Text(title[index],
                                          style: TextStyle(
                                              fontSize: size.width * 0.015,
                                              fontFamily: 'Oswald',
                                              color: AppColors.black
                                                  .withOpacity(0.8),
                                              fontWeight: FontWeight.bold),
                                      maxLines: 2,),
                                    ],
                                  ),
                                  Icon(
                                    onTap == index
                                        ? EvaIcons.minus
                                        : EvaIcons.plus,
                                    size: 40,
                                    color: onTap == index || hoverIndex == index
                                        ? AppColors.white
                                        : AppColors.seeGreen,
                                  )
                                ],
                              ),
                            )),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: 12),
            ),
            SizedBox(
              height: size.height * 0.1,
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
          ]),
        ),
      ),
    );
  }
}
