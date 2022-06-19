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
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return  BlocBuilder<IndexBloc,IndexState>(builder:(context, state){
      if(state is IndexLoaded){
        return  Container(
          alignment: Alignment.topCenter,
          height:60,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.dimen30,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/fanex_logo.png',
                  width: 170,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  child: size.width > 720
                      ? Align(
                    alignment: Alignment.topRight,
                    child: ListView.separated(
                      itemCount: tabTitle.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder:
                          (BuildContext context, int index) {
                        return InkWell(
                          hoverColor: AppColors.transparent,
                          onTap: () {
                            BlocProvider.of<IndexBloc>(
                                context)
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
                                        ? AppColors.white
                                        : AppColors.white.withOpacity(0.4),
                                    fontSize: 15,
                                    fontWeight:
                                    index == state.index
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              )),
                        );
                      },
                      separatorBuilder:
                          (BuildContext context, int index) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                    ),
                  )
                      : Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return Container();
    } );
  }
}

// class StickyBar extends StatelessWidget {
//   const StickyBar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverPersistentHeader(floating:true,delegate: Delegate());
//   }
// }
//
// class Delegate extends SliverPersistentHeaderDelegate {
//   List<String> tabTitle = [
//     'HOME',
//     'HOW TO PLAY',
//     'RULES AND SCORING',
//     'CHAKRA LEADERBOARD',
//     'FAQ',
//     'CONTACT'
//   ];
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     Size size =MediaQuery.of(context).size;
//     return BlocBuilder<IndexBloc,IndexState>(builder:(context, state){
//       if(state is IndexLoaded){
//         return  Container(
//           alignment: Alignment.topCenter,
//           color:AppColors.white.withOpacity(0.7),
//           height:60,
//           width: size.width,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: AppSizes.dimen30,),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Image.asset(
//                   'assets/images/fanex_logo.png',
//                   width: 170,
//                   fit: BoxFit.cover,
//                 ),
//                 SizedBox(
//                   child: size.width > 720
//                       ? Align(
//                     alignment: Alignment.topRight,
//                     child: ListView.separated(
//                       itemCount: tabTitle.length,
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder:
//                           (BuildContext context, int index) {
//                         return InkWell(
//                           onTap: () {
//                             BlocProvider.of<IndexBloc>(
//                                 context)
//                                 .add(GetIndex(index));
//                             if (kDebugMode) {
//                               print(index);
//                             }
//                           },
//                           child: Center(
//                               child: Text(
//                                 tabTitle[index],
//                                 style: TextStyle(
//                                     color: index == state.index
//                                         ? AppColors.black
//                                         : AppColors.black.withOpacity(0.4),
//                                     fontSize: 15,
//                                     fontWeight:
//                                     index == state.index
//                                         ? FontWeight.bold
//                                         : FontWeight.normal),
//                               )),
//                         );
//                       },
//                       separatorBuilder:
//                           (BuildContext context, int index) {
//                         return const SizedBox(
//                           width: 20,
//                         );
//                       },
//                     ),
//                   )
//                       : Align(
//                     alignment: Alignment.topRight,
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.menu),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }
//       return Container();
//     } );
//
//   }
//
//   @override
//   double get maxExtent => 60;
//
//   @override
//   double get minExtent => 48;
//
//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
