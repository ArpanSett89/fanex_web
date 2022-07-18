import 'package:fanex_web/features/chakra/widgets/player_list.dart';
import 'package:fanex_web/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import '../../../common/common.dart';
import '../../../utils/responsive.dart';
import '../bloc/chakra_body_list_bloc/body_list_bloc.dart';
import 'package:flutter_svg/svg.dart';
class ChakraBody extends StatefulWidget {
  const ChakraBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ChakraBody> createState() => _ChakraBodyState();
}

class _ChakraBodyState extends State<ChakraBody> {
  int hoverIndex = 0;
  int selectedIndex = globalSelectedIndex;
  List<String> iconTitle = [
    'assets/icons/doller_icon.png',
    'assets/icons/coin1_icon.png',
    'assets/icons/parsentage_icon.png',
    'assets/icons/chart_icon.png',
    'assets/icons/friend_icon.png',
  ];
  List<String> titleText = [
    AppStrings.cashWonText,
    AppStrings.coinsWonText,
    AppStrings.averagePercentageText,
    AppStrings.coinEarnedText,
    AppStrings.numberOfFriendsFollowingText,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.dimen30),
      child: BlocBuilder<BodyListBloc, BodyListState>(
        builder: (context, state) {
          if (state is BodyListInitial || state is BodyListLoading) {
            return SizedBox(
                height: size.height,
                width: size.width,
                child: const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.orange,
                )));
          }
          if (state is BodyListLoaded) {
            return Responsive(
              mobile: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          BorderRadius.circular(AppSizes.cardCornerRadius),
                    ),
                    width: size.width * 0.3,
                    child: ListView.builder(
                      shrinkWrap: true,
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
                              decoration: BoxDecoration(
                                color: hoverIndex == index ||
                                        selectedIndex == index
                                    ? AppColors.seeGreen
                                    : index.isEven
                                        ? AppColors.lightGrey.withOpacity(0.4)
                                        : AppColors.white,
                                borderRadius: index == 0
                                    ? const BorderRadius.vertical(
                                        top: Radius.circular(
                                            AppSizes.cardCornerRadius),
                                      )
                                    : index ==
                                            state.chakraBodyListModel.data!
                                                    .length -
                                                1
                                        ? const BorderRadius.vertical(
                                            bottom: Radius.circular(
                                                AppSizes.cardCornerRadius),
                                          )
                                        : BorderRadius.circular(0),
                              ),
                              height: size.height * 0.15,
                              // width: size.width,
                              child: Center(
                                child: _buildPlayerListTiles(context, state, index, hoverIndex, selectedIndex),
                              )
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppSizes.cardCornerRadius),
                        color: AppColors.lightGrey.withOpacity(0.78),
                        image: const DecorationImage(
                            alignment: Alignment.topCenter,
                            image: AssetImage('assets/images/chakra_body.png'),
                            fit: BoxFit.cover)),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        const SizedBox(
                          height: AppSizes.dimen60,
                        ),
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
                                    state.chakraBodyListModel
                                        .data![selectedIndex].imageUrl!,
                                    AppColors.white),
                                const SizedBox(
                                  height: AppSizes.dimen30,
                                ),
                              ],
                            ),
                            Positioned(
                                bottom: 0,
                                right: AppSizes.dimen50,
                                top: AppSizes.dimen50 * 2,
                                left: AppSizes.dimen50,
                                child: Image.asset(
                                  'assets/images/chakra.png',
                                  fit: BoxFit.contain,
                                  height: AppSizes.dimen50 * 2,
                                  width: AppSizes.dimen50 * 2,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: AppSizes.dimen24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: AppSizes.dimen24,
                              left: AppSizes.dimen24,
                              right: AppSizes.dimen24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _dateCard(
                                '${AppStrings.sinceText}${state.chakraBodyListModel.start.toString()}',
                                AppColors.seeGreen,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              _dateCard(
                                '${AppStrings.chakraEndText}${state.chakraBodyListModel.end.toString()}',
                                AppColors.orange,
                              ),
                            ],
                          ),
                        ),
                        Center(
                            child: Text(
                          state.chakraBodyListModel.data![selectedIndex]
                              .userUsername
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
                  SizedBox(
                    height: size.width * 0.02,
                  ),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          BorderRadius.circular(AppSizes.cardCornerRadius),
                    ),
                    child: ListView.separated(
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.all(AppSizes.dimen16),
                            child: _buildListTiles(context, iconTitle,
                                titleText, index, state, selectedIndex));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          height: 1,
                        );
                      },
                    ),
                  ),
                ],
              ),
              tablet: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          BorderRadius.circular(AppSizes.cardCornerRadius),
                    ),
                    width: size.width * 0.3,
                    child: ListView.builder(
                      shrinkWrap: true,
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
                              decoration: BoxDecoration(
                                color: hoverIndex == index ||
                                        selectedIndex == index
                                    ? AppColors.seeGreen
                                    : index.isEven
                                        ? AppColors.lightGrey
                                        : AppColors.white,
                                borderRadius: index == 0
                                    ? const BorderRadius.vertical(
                                        top: Radius.circular(
                                            AppSizes.cardCornerRadius),
                                      )
                                    : index ==
                                            state.chakraBodyListModel.data!
                                                    .length - 1
                                        ? const BorderRadius.vertical(
                                            bottom: Radius.circular(
                                                AppSizes.cardCornerRadius),
                                          )
                                        : BorderRadius.circular(0),
                              ),
                        child: Center(
                            child: _buildPlayerListTiles(context, state, index, hoverIndex, selectedIndex),
                            ),
                          ),
                        ));
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
                              borderRadius: BorderRadius.circular(
                                  AppSizes.cardCornerRadius),
                              color: AppColors.lightGrey.withOpacity(0.78),
                              image: const DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image: AssetImage(
                                      'assets/images/chakra_body.png'),
                                  fit: BoxFit.cover)),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: AppSizes.dimen60,
                              ),
                              ListView(
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
                                          top: AppSizes.dimen50 * 2,
                                          left: AppSizes.dimen50,
                                          child: Image.asset(
                                            'assets/images/chakra.png',
                                            fit: BoxFit.contain,
                                            height: AppSizes.dimen50 * 2,
                                            width: AppSizes.dimen50 * 2,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: AppSizes.dimen24,
                                  ),
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
                                        _dateCard(
                                          '${AppStrings.sinceText}${state.chakraBodyListModel.start.toString()}',
                                          AppColors.seeGreen,
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        _dateCard(
                                          '${AppStrings.chakraEndText}${state.chakraBodyListModel.end.toString()}',
                                          AppColors.orange,
                                        ),
                                      ],
                                    ),
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
                            borderRadius: BorderRadius.circular(
                                AppSizes.cardCornerRadius),
                          ),
                          child: ListView.separated(
                            itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                  padding:
                                      const EdgeInsets.all(AppSizes.dimen16),
                                  child: _buildListTiles(context, iconTitle,
                                      titleText, index, state, selectedIndex));
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                height: 1,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              desktop: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          BorderRadius.circular(AppSizes.cardCornerRadius),
                    ),
                    //height: size.height,
                    width: size.width * 0.3,
                    child: ListView.builder(
                      shrinkWrap: true,
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
                              decoration: BoxDecoration(
                                color: hoverIndex == index ||
                                        selectedIndex == index
                                    ? AppColors.seeGreen
                                    : index.isEven
                                        ? AppColors.lightGrey.withOpacity(0.4)
                                        : AppColors.white,
                                borderRadius: index == 0
                                    ? const BorderRadius.vertical(
                                        top: Radius.circular(
                                            AppSizes.cardCornerRadius),
                                      )
                                    : index ==
                                            state.chakraBodyListModel.data!
                                                    .length -
                                                1
                                        ? const BorderRadius.vertical(
                                            bottom: Radius.circular(
                                                AppSizes.cardCornerRadius),
                                          )
                                        : BorderRadius.circular(0),
                              ),
                              height: size.height * 0.15,
                              // width: size.width,
                              child: Center(
                                child: _buildPlayerListTiles(context, state, index, hoverIndex, selectedIndex),
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
                              borderRadius: BorderRadius.circular(
                                  AppSizes.cardCornerRadius),
                              color: AppColors.lightGrey.withOpacity(0.78),
                              image: const DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image: AssetImage(
                                      'assets/images/chakra_body.png'),
                                  fit: BoxFit.cover)),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: AppSizes.dimen60,
                              ),
                              ListView(
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
                                    "${state.chakraBodyListModel.data![selectedIndex].ranking.toString()}'${AppHelper.ordinalSuffixOf(state.chakraBodyListModel.data![selectedIndex].ranking!.toInt())}",
                                    style: const TextStyle(
                                        fontFamily: 'Oswald',
                                        fontSize: AppSizes.headline1,
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
                                          top: AppSizes.dimen50 * 2,
                                          left: AppSizes.dimen50,
                                          child: Image.asset(
                                            'assets/images/chakra.png',
                                            fit: BoxFit.contain,
                                            height: AppSizes.dimen50 * 2,
                                            width: AppSizes.dimen50 * 2,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: AppSizes.dimen24,
                                  ),
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
                                        _dateCard(
                                          '${AppStrings.sinceText}${state.chakraBodyListModel.start.toString()}',
                                          AppColors.seeGreen,
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        _dateCard(
                                          '${AppStrings.chakraEndText}${state.chakraBodyListModel.end.toString()}',
                                          AppColors.orange,
                                        ),
                                      ],
                                    ),
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
                            borderRadius: BorderRadius.circular(
                                AppSizes.cardCornerRadius),
                          ),
                          child: ListView.separated(
                            itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                  padding:
                                      const EdgeInsets.all(AppSizes.dimen16),
                                  child: _buildListTiles(context, iconTitle,
                                      titleText, index, state, selectedIndex));
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                height: 1,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return Container();
        },
      ),
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

Widget _buildListTiles(context, List<String> iconTitle, List<String> titleText,
    int index, BodyListLoaded state, int selectedIndex) {
  return ListTile(
      leading: CircleAvatar(
        radius: AppSizes.dimen40,
        backgroundColor: AppColors.shimmer,
        child: Image.asset(
          iconTitle[index],
          height: AppSizes.dimen30,
          width: AppSizes.dimen30,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        titleText[index],
        style: Theme.of(context).textTheme.headline5,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: index == 2
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: AppSizes.dimen8,
                ),
                Text(
                  AppStrings.excludesContestsText,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: AppSizes.dimen8,
                ),
                GFProgressBar(
                  percentage: state.chakraBodyListModel.data![selectedIndex]
                          .percentFinish!
                          .toInt() /
                      100,
                  lineHeight: 15,
                  alignment: MainAxisAlignment.center,
                  leading: Text(
                    '0%',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  trailing: Text(
                    '100%',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  backgroundColor: AppColors.lightGrey,
                  progressBarColor: AppColors.orange,
                  child: Center(
                    child: Text(
                      '${state.chakraBodyListModel.data![selectedIndex].percentFinish.toString()}%',
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                )
              ],
            )
          : Container(),
      trailing: SizedBox(
        width: index == 2 ? 0 : 100,
        child: index == 2
            ? Container()
            : index == 4
                ? Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      state.chakraBodyListModel.data![selectedIndex].followers
                          .toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        index != 0
                            ? 'assets/icons/coin.svg'
                            : 'assets/icons/rupee-gold-coin.svg',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: AppSizes.dimen5,
                      ),
                      Text(
                        index == 0
                            ? state
                                .chakraBodyListModel.data![selectedIndex].cash
                                .toString()
                            : index == 1
                                ? state.chakraBodyListModel.data![selectedIndex]
                                    .coins
                                    .toString()
                                : state.chakraBodyListModel.data![selectedIndex]
                                    .promotionCoins
                                    .toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
      ));
}

Widget _dateCard(String title, Color color) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(AppSizes.cardCornerRadius),
    ),
    child: Padding(
      padding: const EdgeInsets.all(AppSizes.dimen12),
      child: Center(
        child: Text(title,
            style: const TextStyle(
                fontSize: AppSizes.button,
                color: AppColors.white,
                fontWeight: FontWeight.w400)),
      ),
    ),
  );
}

Widget _buildPlayerListTiles(context,BodyListLoaded state, int index,int hoverIndex,int selectedIndex){
  return ListTile(
    leading:Stack(
      alignment: AlignmentDirectional.center,
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
            top:AppSizes.dimen30,
            left: AppSizes.dimen30,
            child: Image.asset(
              'assets/images/chakra.png',
              fit: BoxFit.contain,
              height: AppSizes.dimen70,
              width: AppSizes.dimen70,
            )),
      ],
    ),
    title:Text(state.chakraBodyListModel.data![index]
        .userUsername
        .toString(),
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.headline6,
          color: hoverIndex == index ||
              selectedIndex == index
              ? AppColors.white
              : AppColors.darkGrey,
        )),
    subtitle:Padding(
      padding: const EdgeInsets.only(top: AppSizes.dimen12),
      child: Text(
        '${AppStrings.sinceText}${state.chakraBodyListModel.start.toString()}',
        style: TextStyle(
          color: hoverIndex == index ||
              selectedIndex == index
              ? AppColors.white
              : AppColors.darkGrey,
        ),
        maxLines: 4,
      ),
    ),
    trailing: Container(
      decoration: BoxDecoration(
          color: hoverIndex == index ||
              selectedIndex == index
              ? AppColors.white
              : AppColors.seeGreen,
          borderRadius: BorderRadius.circular(
              AppSizes.cardCornerRadius)),
      height: MediaQuery.of(context).size.height * 0.05,
      width: AppSizes.dimen60,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.dimen2),
        child: Center(
          child: Text(
            "${state.chakraBodyListModel.data![index].ranking.toString()}'${AppHelper.ordinalSuffixOf(state.chakraBodyListModel.data![index].ranking!.toInt())}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppSizes.headline5,
              color: hoverIndex == index ||
                  selectedIndex == index
                  ? AppColors.seeGreen
                  : AppColors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
