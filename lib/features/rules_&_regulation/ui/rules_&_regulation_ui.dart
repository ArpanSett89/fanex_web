import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../../common/common.dart';
import '../../../common/widgets/footer/footer_ui.dart';
import '../../../common/widgets/header/header_ui.dart';
import '../../../common/widgets/scroll_control_button/scroll_control_button.dart';
import '../../../utils/indexing_bloc/index_bloc.dart';
import '../../../utils/responsive.dart';

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
    AppStrings.cardTitle1,
    AppStrings.cardTitle2,
    AppStrings.cardTitle3,
    AppStrings.cardTitle4,
    AppStrings.cardTitle5,
    AppStrings.cardTitle6,
    AppStrings.cardTitle7,
  ];
  int hoverIndex = 0;
  int selectedIndex = 0;
  double count=0;
  bool onTap=false;
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
              color: AppColors.lightGrey.withOpacity(0.73),
              image: const DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/rules&scoring_banner.png'),
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
                    AppStrings.tabText3,
                    style: TextStyle(
                        fontSize:size.width>720?AppSizes.dimen60:AppSizes.dimen40,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold),
                  ),),
              SizedBox(
                height: size.height * 0.1,
              ),
              BlocProvider<IndexBloc>(
                create: (context) => IndexBloc()..add(GetHoverIndex(0)),
                child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
                                BlocProvider.of<IndexBloc>(context)
                                    .add(GetHoverIndex(index));
                              },
                              onExit: (event) {
                                BlocProvider.of<IndexBloc>(context)
                                    .add(GetHoverIndex(selectedIndex));
                              },
                              child: BlocBuilder<IndexBloc, IndexState>(
                                builder: (context, state) {
                                  if (state is HoverIndexLoaded) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                          onTap=false;
                                        });
                                      },
                                      child: Card(
                                        color: state.index == index ||
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
                                                  fontSize: 15,
                                                  color: state.index == index ||
                                                      selectedIndex == index
                                                      ? AppColors.white
                                                      : AppColors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                  return Container();
                                },
                              ),
                            );
                          }),
                      tablet: GridView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, crossAxisSpacing: 20.0),
                          itemBuilder: (BuildContext context, int index) {
                            return MouseRegion(
                              onEnter: (event) {
                                BlocProvider.of<IndexBloc>(context)
                                    .add(GetHoverIndex(index));
                              },
                              onExit: (event) {
                                BlocProvider.of<IndexBloc>(context)
                                    .add(GetHoverIndex(selectedIndex));
                              },
                              child: BlocBuilder<IndexBloc, IndexState>(
                                builder: (context, state) {
                                  if (state is HoverIndexLoaded) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                          onTap=false;
                                        });
                                      },
                                      child: Card(
                                        color: state.index == index ||
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
                                                  fontSize: 15,
                                                  color: state.index == index ||
                                                      selectedIndex == index
                                                      ? AppColors.white
                                                      : AppColors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                  return Container();
                                },
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
                                BlocProvider.of<IndexBloc>(context)
                                    .add(GetHoverIndex(index));
                              },
                              onExit: (event) {
                                BlocProvider.of<IndexBloc>(context)
                                    .add(GetHoverIndex(selectedIndex));
                              },
                              child: BlocBuilder<IndexBloc, IndexState>(
                                builder: (context, state) {
                                  if (state is HoverIndexLoaded) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                          onTap=false;
                                        });
                                      },
                                      child: Card(
                                        color: state.index == index ||
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
                                                  fontSize: 15,
                                                  color: state.index == index ||
                                                      selectedIndex == index
                                                      ? AppColors.white
                                                      : AppColors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                  return Container();
                                },
                              ),
                            );
                          }),
                    )),
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
                child: Column(
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
                        child: ListTile(
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
                        )),
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
                height: size.height*0.1,
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
