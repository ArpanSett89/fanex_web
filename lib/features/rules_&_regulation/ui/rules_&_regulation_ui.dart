import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../common/common.dart';

class RulesRegulationView extends StatefulWidget {
  const RulesRegulationView({Key? key}) : super(key: key);

  @override
  State<RulesRegulationView> createState() => _RulesRegulationViewState();
}

class _RulesRegulationViewState extends State<RulesRegulationView> {
  List<String> imageTitle = [
    'assets/images/introduction_icon.png',
    'assets/images/eligibility_icon.png',
    'assets/images/account_creation.png',
    'assets/images/making_picks.png',
    'assets/images/scoring_system.png',
    'assets/images/confirmed_player.png',
    'assets/images/cancellation.png',
  ];
  List<String> title = [
    'INTRODUCTION',
    'ELIGIBILITY',
    'ACCOUNT CREATION',
    'MAKING PICKS',
    'SCORING SYSTEM',
    'CONFIRMED PLAYERS',
    'CANCELLATIONS',
  ];
  int hoverIndex = 0;
  int selectedIndex = 0;
  double count=0;
  bool onTap=false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(
      size.width * 0.045,
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.lightGrey.withOpacity(0.73),
              image: const DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/rules&scoring_banner.png'),
                  fit: BoxFit.cover)),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: size.height * 0.43,
              ),
              Center(
                child: Text(
                  'RULES AND SCORING',
                  style: TextStyle(
                      fontSize: size.width * 0.045,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: GridView.builder(
                    itemCount: 7,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: size.width>1200?7:size.width>720?4:2, crossAxisSpacing: 20.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Theme(
                        data: ThemeData(hoverColor: AppColors.seeGreen),
                        child: MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              print(index);
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
                                    width: size.width*0.050,
                                    height: size.width*0.050,
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
                  onTap: (){
                    print(title[selectedIndex]);
                    setState((){
                      onTap=!onTap;
                    });
                  },
                  child: Card(
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: AppColors.seeGreen,
                                  radius: 25,
                                  child: CircleAvatar(
                                    radius: 11,
                                    backgroundColor: AppColors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 60,
                                ),
                                Text(title[selectedIndex],style: TextStyle(
                                    fontSize: size.width * 0.015,
                                    fontFamily: 'Oswald',
                                    color: AppColors.black.withOpacity(0.8),
                                    fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Icon(
                              onTap?EvaIcons.minus:EvaIcons.plus,
                              size: 40,
                              color: AppColors.seeGreen,
                            )
                          ],
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: size.height*0.1,
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
            ],
          ),
        ),
      ),
    );
  }
}
