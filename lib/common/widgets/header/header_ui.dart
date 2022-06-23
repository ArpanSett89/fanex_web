import 'package:fanex_web/utils/responsive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/indexing_bloc/index_bloc.dart';
import '../../common.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);
  List<String> tabTitle = [
    'HOME',
    'HOW TO PLAY',
    'RULES AND SCORING',
    'CHAKRA LEADERBOARD',
    'FAQ',
    'CONTACT'
  ];
  int ind = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<IndexBloc, IndexState>(builder: (context, state) {
      if (state is IndexLoaded) {
        return Container(
          alignment: Alignment.topCenter,
          height: 60,
          width: size.width,
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.dimen30,
              ),
              child: Responsive(
                mobile: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/fanex_logo.png',
                      width: 170,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: _dropDownButton(context, state, tabTitle, ind),
                      ),
                    ),
                  ],
                ),
                tablet: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/fanex_logo.png',
                      width: 170,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: _dropDownButton(context, state, tabTitle, ind),
                      ),
                    ),
                  ],
                ),
                desktop: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/fanex_logo.png',
                      width: 170,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                        child: Align(
                      alignment: Alignment.topRight,
                      child: ListView.separated(
                        itemCount: tabTitle.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            hoverColor: AppColors.transparent,
                            onTap: () {
                              BlocProvider.of<IndexBloc>(context)
                                  .add(GetIndex(index));
                              if (kDebugMode) {
                                print(index);
                              }
                            },
                            child: Center(
                                child: Text(
                              tabTitle[index],
                              style: TextStyle(
                                  color: index == state.index
                                      ? AppColors.orange
                                      : AppColors.white.withOpacity(0.4),
                                  fontSize: 15,
                                  fontWeight: index == state.index
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            )),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 20,
                          );
                        },
                      ),
                    )),
                  ],
                ),
              )),
        );
      }
      return Container();
    });
  }
}

class StickyBar extends StatelessWidget {
  final ScrollController scrollController;

  const StickyBar({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true, delegate: Delegate(scrollController));
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final ScrollController scrollController;

  Delegate(this.scrollController);

  List<String> tabTitle = [
    'HOME',
    'HOW TO PLAY',
    'RULES AND SCORING',
    'CHAKRA LEADERBOARD',
    'FAQ',
    'CONTACT'
  ];
  int ind = 0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<IndexBloc, IndexState>(builder: (context, state) {
      if (state is IndexLoaded) {
        return Container(
          alignment: Alignment.topCenter,
          color: scrollController.position.pixels == 0
              ? AppColors.white
              : AppColors.white.withOpacity(0.7),
          height: 60,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.dimen30,
            ),
            child: Responsive(
              mobile: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/fanex_logo.png',
                    width: 170,
                    fit: BoxFit.cover,
                  ),
                  _dropDownButton(context, state, tabTitle, ind),
                ],
              ),
              tablet: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/fanex_logo.png',
                    width: 170,
                    fit: BoxFit.cover,
                  ),
                  _dropDownButton(context, state, tabTitle, ind),
                ],
              ),
              desktop: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/fanex_logo.png',
                    width: 170,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                      child: Align(
                    alignment: Alignment.topRight,
                    child: ListView.separated(
                      itemCount: tabTitle.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          hoverColor: AppColors.transparent,
                          onTap: () {
                            BlocProvider.of<IndexBloc>(context)
                                .add(GetIndex(index));
                            if (kDebugMode) {
                              print(index);
                            }
                          },
                          child: Center(
                              child: Text(
                            tabTitle[index],
                            style: TextStyle(
                                color: index == state.index
                                    ? AppColors.orange
                                    : AppColors.darkGrey,
                                fontSize: 15,
                                fontWeight: index == state.index
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          )),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                    ),
                  )),
                ],
              ),
            ),
          ),
        );
      }
      return Container();
    });
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

Widget _dropDownButton(
    context, IndexLoaded state, List<String> tabTitle, int ind) {
  return Center(
    child: DropdownButton(
      elevation: 0,
      dropdownColor: AppColors.header.withOpacity(0.7),
      underline: Container(
        height: 0,
      ),
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: AppColors.transparent,
            borderRadius: BorderRadius.circular(9),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  color: AppColors.black.withOpacity(0.3))
            ]),
        child: const Icon(
          Icons.menu,
          size: AppSizes.dimen30,
          color: AppColors.black,
        ),
      ),
      items: tabTitle.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(
            e,
            style: TextStyle(
                color: state.index == tabTitle.indexOf(e)
                    ? AppColors.orange
                    : AppColors.white.withOpacity(0.5),
                fontWeight: state.index == tabTitle.indexOf(e)
                    ? FontWeight.bold
                    : FontWeight.normal),
          ),
        );
      }).toList(),
      onChanged: (value) {
        ind = tabTitle.indexOf(value!);
        print('drop down index    ' + ind.toString());
        BlocProvider.of<IndexBloc>(context).add(GetIndex(ind));
      },
    ),
  );
}
