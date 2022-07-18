import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../../common/common.dart';
import '../../../common/widgets/footer/footer_ui.dart';
import '../../../common/widgets/header/header_ui.dart';
import '../../../common/widgets/scroll_control_button/scroll_control_button.dart';
import '../../../utils/responsive.dart';

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
  final ScrollController _scrollController = ScrollController();
  var _isVisibleForScrollView = false;
  int tapToVisible = 20;

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
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.lightGrey.withOpacity(0.78),
              image: const DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/faq_banner.png'),
                  fit: BoxFit.contain)),
          child: ListView(shrinkWrap: true, children: [
            Header(),
            SizedBox(
              height: size.height * 0.20,
            ),
            Center(
                child: Responsive(
              mobile: Text(
                AppStrings.tabText5,
                style: TextStyle(
                    fontSize: size.width * 0.1,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold),
              ),
              tablet: Text(
                AppStrings.tabText5,
                style: TextStyle(
                    fontSize: size.width * 0.045,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold),
              ),
              desktop: Text(
                AppStrings.tabText5,
                style: TextStyle(
                    fontSize: size.width * 0.045,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold),
              ),
            )),
            SizedBox(
              height: size.height * 0.1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.black.withOpacity(0.5),
                      )),
                  hintText: 'Search here',
                ),
              ),
            ),
            Responsive(
                mobile: SizedBox(
                  height: size.height * 0.18,
                ),
                tablet: SizedBox(
                  height: size.height * 0.28,
                ),
                desktop: SizedBox(
                  height: size.height * 0.28,
                )),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      MouseRegion(
                        onEnter: (event) {
                          setState(() {
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
                            setState(() {
                              if (onTap == index) {
                                onTap = 20;
                              } else {
                                onTap = index;
                              }
                              if (tapToVisible == index) {
                                tapToVisible = 20;
                              } else {
                                tapToVisible = index;
                              }
                            });
                          },
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                              padding:  const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(AppSizes.cardCornerRadius)),
                                color: onTap == index || hoverIndex == index
                                    ? AppColors.seeGreen
                                    : AppColors.white,
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  backgroundColor: onTap ==
                                      index ||
                                      hoverIndex == index
                                      ? AppColors.white
                                      : AppColors.seeGreen,
                                  radius:size.width>720?25:20,
                                  child: CircleAvatar(
                                    radius:size.width>720?11:6,
                                    backgroundColor: onTap ==
                                        index ||
                                        hoverIndex == index
                                        ? AppColors.seeGreen
                                        : AppColors.white,
                                  ),
                                ),
                                title:Text(title[index],
                                    style: TextStyle(
                                        fontSize: AppSizes.headline5,
                                        fontFamily: 'Oswald',
                                        color: AppColors.black
                                            .withOpacity(0.8),
                                        fontWeight: FontWeight.bold),
                                maxLines: 2,),
                                trailing:Icon(
                                    onTap == index
                                            ? EvaIcons.minus
                                            : EvaIcons.plus,
                                        size: 40,
                                        color: onTap == index ||
                                            hoverIndex == index
                                            ? AppColors.white
                                            : AppColors.seeGreen,
                                ),
                              )


                              // Row(
                              //   mainAxisAlignment:
                              //   MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Expanded(
                              //       child: Row(
                              //         mainAxisAlignment:
                              //         MainAxisAlignment.start,
                              //         children: [
                              //           CircleAvatar(

                              //             radius: 25,
                              //             child: CircleAvatar(
                              //               radius: 11,

                              //             ),
                              //           ),
                              //           const SizedBox(
                              //             width: 60,
                              //           ),
                              //           Flexible(
                              //             child: Text(
                              //               title[index],
                              //               style: TextStyle(
                              //                   fontSize:
                              //                   size.width * 0.015,
                              //                   fontFamily: 'Oswald',
                              //                   color: AppColors.black
                              //                       .withOpacity(0.8),
                              //                   fontWeight:
                              //                   FontWeight.bold),
                              //               maxLines: 2,
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     Icon(
                              //       onTap == index
                              //           ? EvaIcons.minus
                              //           : EvaIcons.plus,
                              //       size: 40,
                              //       color: onTap == index ||
                              //           hoverIndex == index
                              //           ? AppColors.white
                              //           : AppColors.seeGreen,
                              //     )
                              //   ],
                              // )
                          ),
                        ),
                      ),
                      Visibility(
                        visible: tapToVisible == index ? true : false,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                          padding: const EdgeInsets.all(AppSizes.dimen16),
                          color: AppColors.white,
                          width: size.width,
                          height: 200,
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: 12),
            SizedBox(
              height: size.height * 0.1,
            ),
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
      ),
    );
  }
}
