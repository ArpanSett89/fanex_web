import 'package:fanex_web/utils/responsive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/indexing_bloc/index_bloc.dart';
import '../../common.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);
  final List<String> tabTitle = [
    'HOME',
    'HOW TO PLAY',
    'RULES AND SCORING',
    'CHAKRA LEADERBOARD',
    'FAQ',
    'CONTACT'
  ];
  final int ind = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<IndexBloc, IndexState>(builder: (context, state) {
      if (state is IndexLoaded) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.dimen30,
          ),
          alignment: Alignment.topCenter,
          height: AppSizes.dimen60,
          width: size.width,
          child: Responsive(
            mobile: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/fanex_logo.png',
                  width: 170,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
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
                  filterQuality: FilterQuality.high,
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
                              fontSize: AppSizes.bodyText1,
                              fontWeight: index == state.index
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        )),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: AppSizes.dimen24,
                      );
                    },
                  ),
                )),
              ],
            ),
          ),
        );
      }
      return Container();
    });
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
        width: AppSizes.dimen40,
        height: AppSizes.dimen40,
        decoration: BoxDecoration(
            color: AppColors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.cardCornerRadius),
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
        if (kDebugMode) {
          print('drop down index------$ind');
        }
        BlocProvider.of<IndexBloc>(context).add(GetIndex(ind));
      },
    ),
  );
}
