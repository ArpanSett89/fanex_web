import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/common.dart';
import '../../../utils/responsive.dart';
import '../bloc/chakra_body_list_bloc/body_list_bloc.dart';

class ChakraBody extends StatefulWidget {
  final List<String> tabTitle;

  const ChakraBody({Key? key, required this.tabTitle}) : super(key: key);

  @override
  State<ChakraBody> createState() => _ChakraBodyState();
}

class _ChakraBodyState extends State<ChakraBody> {
  int hoverIndex = 0;
  int selectedIndex = 0;
List<String>iconTitle=[
  'assets/icons/doller_icon.png',
  'assets/icons/coin1_icon.png',
  'assets/icons/parsentage_icon.png',
  'assets/icons/chart_icon.png',
  'assets/icons/friend_icon.png',
];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.dimen30),
      child: Responsive(
          mobile: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListView.separated(
                    itemCount: widget.tabTitle.length,
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
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  hoverIndex == index || selectedIndex == index
                                      ? AppColors.seeGreen
                                      : index.isEven
                                          ? AppColors.lightGrey
                                          : AppColors.white,
                              borderRadius: index == 0
                                  ? BorderRadius.circular(15)
                                  : const BorderRadius.vertical(
                                      bottom: Radius.circular(15),
                                    ),
                            ),
                            height: size.height * 0.15,
                            width: size.width,
                            child: Center(
                              child: Text(widget.tabTitle[index]),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                //height: size.height * 0.7,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.lightGrey.withOpacity(0.78),
                    image: const DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage('assets/images/chakra_body.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: AppSizes.dimen24,
                          left: AppSizes.dimen24,
                          right: AppSizes.dimen24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            color: AppColors.seeGreen,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    AppStrings.sinceText,
                                    style: TextStyle(
                                        fontSize: 20, color: AppColors.white),
                                  ),
                                  Text(
                                    AppStrings.dateText,
                                    style: TextStyle(
                                        fontSize: 20, color: AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Card(
                            color: AppColors.orange,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: const [
                                  Text(
                                    AppStrings.chakraEndText,
                                    style: TextStyle(
                                        fontSize: 20, color: AppColors.black),
                                  ),
                                  Text(
                                    AppStrings.dateText,
                                    style: TextStyle(
                                        fontSize: 20, color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          const Center(
                              child: Text(
                            "🏆",
                            style: TextStyle(
                              //fontFamily: 'Oswald',
                              fontSize: 100,
                            ),
                          )),
                          const Center(
                              child: Text(
                            "1'st",
                            style: TextStyle(
                                fontFamily: 'Oswald',
                                fontSize: AppSizes.headline2,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold),
                          )),
                          const SizedBox(
                            height: 20,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Column(
                                children: const [
                                  CircleAvatar(
                                    backgroundColor: AppColors.white,
                                    radius: 70,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                        'assets/images/rules&scoring_banner.png',
                                      ),
                                      radius: 65,
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppSizes.dimen30,
                                  ),
                                ],
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 50,
                                  top: 100,
                                  left: 50,
                                  child: Image.asset(
                                    'assets/images/chakra.png',
                                    fit: BoxFit.contain,
                                    height: 100,
                                    width: 100,
                                  )
                                  // Transform.scale(
                                  //   //scale: 0.9,
                                  //   child:
                                  // ),
                                  ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                              child: Text(
                            widget.tabTitle[selectedIndex],
                            style: const TextStyle(
                                fontFamily: 'Oswald',
                                fontSize: 40,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold),
                          )),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.width * 0.02,
              ),
              Container(
                //height: size.height * 0.5,
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(AppSizes.dimen16),
                        child: Card(
                          color: AppColors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(AppSizes.dimen16),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColors.lightGrey,
                                  radius: 40,
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: AppColors.white,
                                    child: Image.asset(
                                      'assets/icons/doller_icon.png',
                                      fit: BoxFit.cover,
                                      height: 45,
                                      width: 45,
                                    ),
                                  ),
                                ),
                                const Text(
                                  AppStrings.cashWonText,
                                  style: TextStyle(
                                      fontFamily: 'Oswald',
                                      fontSize:AppSizes.headline2,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
          tablet: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView.separated(
                  itemCount: widget.tabTitle.length,
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
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: hoverIndex == index || selectedIndex == index
                                ? AppColors.seeGreen
                                : index.isEven
                                    ? AppColors.lightGrey
                                    : AppColors.white,
                            borderRadius: index == 0
                                ? BorderRadius.circular(15)
                                : const BorderRadius.vertical(
                                    bottom: Radius.circular(15),
                                  ),
                          ),
                          height: size.height * 0.1,
                          width: size.width,
                          child: Center(
                            child: Text(widget.tabTitle[index]),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                ),
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      //height: size.height * 0.7,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.lightGrey.withOpacity(0.78),
                          image: const DecorationImage(
                              alignment: Alignment.topCenter,
                              image:
                                  AssetImage('assets/images/chakra_body.png'),
                              fit: BoxFit.cover)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: AppSizes.dimen24,
                                left: AppSizes.dimen24,
                                right: AppSizes.dimen24),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  color: AppColors.seeGreen,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          AppStrings.sinceText,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.white),
                                        ),
                                        Text(
                                          AppStrings.dateText,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Card(
                                  color: AppColors.orange,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: const [
                                        Text(
                                          AppStrings.chakraEndText,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.black),
                                        ),
                                        Text(
                                          AppStrings.dateText,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Center(
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              children: [
                                const Center(
                                    child: Text(
                                  "🏆",
                                  style: TextStyle(
                                    //fontFamily: 'Oswald',
                                    fontSize: 100,
                                  ),
                                )),
                                const Center(
                                    child: Text(
                                  "1'st",
                                  style: TextStyle(
                                      fontFamily: 'Oswald',
                                      fontSize:AppSizes.headline2,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Column(
                                      children: const [
                                        CircleAvatar(
                                          backgroundColor: AppColors.white,
                                          radius: 70,
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                              'assets/images/rules&scoring_banner.png',
                                            ),
                                            radius: 65,
                                          ),
                                        ),
                                        SizedBox(
                                          height: AppSizes.dimen30,
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        right: 50,
                                        top: 100,
                                        left: 50,
                                        child: Image.asset(
                                          'assets/images/chakra.png',
                                          fit: BoxFit.contain,
                                          height: 100,
                                          width: 100,
                                        )
                                        // Transform.scale(
                                        //   //scale: 0.9,
                                        //   child:
                                        // ),
                                        ),
                                  ],
                                ),
                                const SizedBox(
                                  height: AppSizes.dimen24,
                                ),
                                Center(
                                    child: Text(
                                  widget.tabTitle[selectedIndex],
                                  style: const TextStyle(
                                      fontFamily: 'Oswald',
                                      fontSize: AppSizes.headline1,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                                const SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.02,
                    ),
                    Container(
                      //height: size.height * 0.5,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(AppSizes.dimen16),
                              child: Card(
                                color: AppColors.white,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(AppSizes.dimen16),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColors.lightGrey,
                                        radius: AppSizes.dimen40,
                                        child: CircleAvatar(
                                          radius: 35,
                                          backgroundColor: AppColors.white,
                                          child: Image.asset(
                                            'assets/icons/doller_icon.png',
                                            fit: BoxFit.cover,
                                            height: AppSizes.dimen40,
                                            width: AppSizes.dimen40,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        AppStrings.cashWonText,
                                        style: TextStyle(
                                            fontFamily: 'Oswald',
                                            fontSize: AppSizes.headline2,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
          desktop: BlocBuilder<BodyListBloc, BodyListState>(
            builder: (context, state) {
              if (state is BodyListInitial || state is BodyListLoading) {
                return Container(
                    height: size.height,
                    width: size.width,
                    child: const Center(child: CircularProgressIndicator(color: AppColors.orange,)));
              }
              if (state is BodyListLoaded) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: size.height * 2,
                      width: size.width * 0.3,
                      child: ListView.builder(
                        itemCount: state.chakraBodyListModel.data!.length,
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
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  color: hoverIndex == index ||
                                          selectedIndex == index
                                      ? AppColors.seeGreen
                                      : index.isEven
                                          ? AppColors.lightGrey
                                          : AppColors.white,
                                  borderRadius: index == 0
                                      ? BorderRadius.circular(15)
                                      : const BorderRadius.vertical(
                                          bottom: Radius.circular(15),
                                        ),
                                ),
                                height: size.height * 0.15,
                                // width: size.width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppSizes.dimen24),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Stack(
                                          alignment:
                                              AlignmentDirectional.center,
                                          children: [
                                            _profileContainer(
                                                AppSizes.dimen70,
                                                AppSizes.dimen70,
                                                state.chakraBodyListModel
                                                    .data![index].imageUrl!,
                                                index.isEven
                                                    ? AppColors.white
                                                    : AppColors.lightGrey),
                                            Positioned(
                                                bottom: 0,
                                                right: 0,
                                                top: AppSizes.dimen50,
                                                left: AppSizes.dimen40,
                                                child: Image.asset(
                                                  'assets/images/chakra.png',
                                                  fit: BoxFit.contain,
                                                  height: AppSizes.dimen70,
                                                  width: AppSizes.dimen70,
                                                )),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.chakraBodyListModel
                                                  .data![index].userUsername
                                                  .toString(),
                                              style: Theme.of(context).textTheme.headline6
                                            ),
                                            const SizedBox(
                                              height: AppSizes.dimen16,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  AppStrings.sinceText,
                                                  style: TextStyle(
                                                    color: hoverIndex ==
                                                                index ||
                                                            selectedIndex ==
                                                                index
                                                        ? AppColors.white
                                                        : AppColors.darkGrey,
                                                  ),
                                                ),
                                                Text(
                                                  state
                                                      .chakraBodyListModel.start
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: hoverIndex ==
                                                                index ||
                                                            selectedIndex ==
                                                                index
                                                        ? AppColors.white
                                                        : AppColors.darkGrey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          color: hoverIndex == index ||
                                                  selectedIndex == index
                                              ? AppColors.white
                                              : AppColors.seeGreen,
                                          height: size.height * 0.05,
                                          width: AppSizes.dimen60,
                                          child: Center(
                                            child: Text(
                                              state.chakraBodyListModel
                                                  .data![index].ranking
                                                  .toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: AppSizes.headline2,
                                                color: hoverIndex == index ||
                                                        selectedIndex == index
                                                    ? AppColors.seeGreen
                                                    : AppColors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.lightGrey.withOpacity(0.78),
                                image: const DecorationImage(
                                    alignment: Alignment.topCenter,
                                    image: AssetImage(
                                        'assets/images/chakra_body.png'),
                                    fit: BoxFit.cover)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: AppSizes.dimen24,
                                      left: AppSizes.dimen24,
                                      right: AppSizes.dimen24),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Card(
                                        color: AppColors.seeGreen,
                                        child: Padding(
                                          padding: const EdgeInsets.all(AppSizes.dimen12),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                               const Text(
                                                AppStrings.sinceText,
                                                style:TextStyle(
                                                    fontSize: AppSizes.button,
                                                    color: AppColors.white,
                                                    fontWeight: FontWeight.w400
                                                )),
                                              Text(
                                                state.chakraBodyListModel.start
                                                    .toString(),
                                                  style: const TextStyle(
                                                    fontSize: AppSizes.button,
                                                    color: AppColors.white,
                                                    fontWeight: FontWeight.w400
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Card(
                                        color: AppColors.orange,
                                        child: Padding(
                                          padding: const EdgeInsets.all(AppSizes.dimen12),
                                          child: Row(
                                            children: [
                                               const Text(
                                                AppStrings.chakraEndText,
                                                  style: TextStyle(
                                                      fontSize: AppSizes.button,
                                                      color: AppColors.white,
                                                      fontWeight: FontWeight.w400
                                                  )
                                              ),
                                              Text(
                                                state.chakraBodyListModel.end
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: AppSizes.button,
                                                    color: AppColors.white,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: AppSizes.dimen60,
                                ),
                                Center(
                                  child: ListView(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    children: [
                                      const Center(
                                          child: Text(
                                        "🏆",
                                        style: TextStyle(
                                          fontSize: 100,
                                        ),
                                      )),
                                      Center(
                                          child: Text(
                                        "${state.chakraBodyListModel.data![selectedIndex].ranking.toString()}'st",
                                        style: const TextStyle(
                                            fontFamily: 'Oswald',
                                            fontSize: AppSizes.headline2,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      const SizedBox(
                                        height: AppSizes.dimen24,
                                      ),
                                      Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: [
                                          Column(
                                            children: [
                                              _profileContainer(
                                                  130,
                                                  130,
                                                  state
                                                      .chakraBodyListModel
                                                      .data![selectedIndex]
                                                      .imageUrl!,
                                                  AppColors.white),
                                              const SizedBox(
                                                height: AppSizes.dimen30,
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                              bottom: 0,
                                              right: AppSizes.dimen50,
                                              top: AppSizes.dimen50*2,
                                              left: AppSizes.dimen50,
                                              child: Image.asset(
                                                'assets/images/chakra.png',
                                                fit: BoxFit.contain,
                                                height: AppSizes.dimen50*2,
                                                width: AppSizes.dimen50*2,
                                              )
                                              ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: AppSizes.dimen24,
                                      ),
                                      Center(
                                          child: Text(
                                        state.chakraBodyListModel
                                            .data![selectedIndex].userUsername
                                            .toString(),
                                        style: const TextStyle(
                                            fontFamily: 'Oswald',
                                            fontSize: AppSizes.headline1,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.width * 0.02,
                          ),
                          Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.all(AppSizes.dimen16),
                                    child: Card(
                                      color: AppColors.white,
                                      child: Padding(
                                          padding: const EdgeInsets.all(
                                              AppSizes.dimen16),
                                          child: ListTile(
                                              leading:  CircleAvatar(
                                                radius: 50,
                                                backgroundColor: AppColors.shimmer,
                                                child: Image.asset(
                                                    iconTitle[index],height: AppSizes.dimen30,width: AppSizes.dimen30,
                                                fit: BoxFit.contain,),
                                              ),
                                              title: Text(
                                                AppStrings.cashWonText,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5,
                                              ))
                                          ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }
              return Container();
            },
          )),
    );
  }
}

Widget _profileContainer(
    double height, double width, String imageTitle, Color color) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
          width: 5,
          color: color,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(imageTitle), fit: BoxFit.cover)),
    height: height,
    width: width,
    child: Container(),
  );
}
