import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fanex_web/common/common.dart';
import 'package:fanex_web/utils/indexing_bloc/index_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../contact/ui/contact_ui.dart';
import '../../faq/ui/faq_ui.dart';
import '../../how_to_play/ui/how_to_play_ui.dart';
import '../../rules_&_regulation/ui/rules_&_regulation_ui.dart';
import '../ui/home_view.dart';


class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  IndexBloc indexBloc = IndexBloc();
  List<String> title = [
    'HOME',
    'HOW TO PLAY',
    'RULES AND SCORING',
    'CHAKRA LEADERBOARD',
    'FAQ',
    'CONTACT'
  ];

  List<Widget> pageList = [
     const HomeView(),
    const HowToPlayView(),
    const RulesRegulationView(),
    Container(
      height: 500,
      color: Colors.black,
    ),
    const FAQView(),
    const ContactView(),
  ];
  final ScrollController _scrollController = ScrollController();
  var _isVisibleForScrollView = true;
@override
void initState(){
  super.initState();
  _scrollController.addListener(() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels > 0) if (_isVisibleForScrollView)
        setState(() {
          _isVisibleForScrollView = false;
        });
    } else {
      if (!_isVisibleForScrollView)
        setState(() {
          _isVisibleForScrollView = true;
        });
    }
  });
}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider<IndexBloc>(
      create: (context) => IndexBloc()..add(GetIndex(0)),
      child: Scaffold(
        body:  SingleChildScrollView(
          controller: _scrollController,
          child: BlocBuilder<IndexBloc, IndexState>(
            builder: (context, state) {
              if (state is IndexLoaded) {
                return Stack(
                  children: [
                    Container(
                        alignment: Alignment.topCenter,
                        height: MediaQuery.of(context).size.height,
                        child: pageList[state.index],
                      ),

                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: 8),
                       alignment: Alignment.topCenter,
                      color:AppColors.white.withOpacity(0.7),
                      // margin: EdgeInsets.only(
                      //     left: size.width * 0.050,
                      //     right: size.width * 0.050,
                      //     top: size.height * 0.03),
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
                                        itemCount: title.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
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
                                              title[index],
                                              style: TextStyle(
                                                  color: index == state.index
                                                      ? AppColors.black
                                                      : AppColors.black.withOpacity(0.4),
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
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
        floatingActionButton: Visibility(
          visible: _isVisibleForScrollView,
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.dimen16,right: AppSizes.dimen30),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.white,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.amber,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 50,
                width: 50,
                child: const Icon(EvaIcons.arrowheadUpOutline,color: AppColors.white,size: 25,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// class StickyNavBar extends StatelessWidget {
//   final IndexLoaded indexLoaded;
//   const StickyNavBar({Key? key,required this.indexLoaded}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  SliverPersistentHeader(
//       floating: true,
//         pinned: true, delegate: Delegate(indexLoaded));
//   }
// }
// class Delegate extends SliverPersistentHeaderDelegate {
//  final IndexLoaded state;
//  Delegate(this.state);
//  List<String> title = [
//    'HOME',
//    'HOW TO PLAY',
//    'RULES AND SCORING',
//    'CHAKRA LEADERBOARD',
//    'FAQ',
//    'CONTACT'
//  ];
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       // margin:const EdgeInsets.symmetric(horizontal: AppSizes.dimen30,vertical: AppSizes.dimen8),
//       decoration: BoxDecoration(color: AppColors.white.withOpacity(0.5), boxShadow: [
//         BoxShadow(
//             color: AppColors.black.withOpacity(0.1),
//             blurRadius: 1,
//             spreadRadius: 2)
//       ]),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: AppSizes.dimen30,vertical: AppSizes.dimen8),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Image.asset(
//               'assets/images/fanex_logo.png',
//               width: 170,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(
//               child: MediaQuery.of(context).size.width > 720
//                   ? Align(
//                 alignment: Alignment.topRight,
//                 child: ListView.separated(
//                   itemCount: title.length,
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder:
//                       (BuildContext context, int index) {
//                     return InkWell(
//                       onTap: () {
//                         BlocProvider.of<IndexBloc>(
//                             context)
//                             .add(GetIndex(index));
//                         if (kDebugMode) {
//                           print(index);
//                         }
//                       },
//                       child: Center(
//                           child: Text(
//                             title[index],
//                             style: TextStyle(
//                                 color: index == state.index
//                                     ? AppColors.white
//                                     : AppColors.darkGrey,
//                                 fontSize: 15,
//                                 fontWeight:
//                                 index == state.index
//                                     ? FontWeight.bold
//                                     : FontWeight.normal),
//                           )),
//                     );
//                   },
//                   separatorBuilder:
//                       (BuildContext context, int index) {
//                     return const SizedBox(
//                       width: 20,
//                     );
//                   },
//                 ),
//               )
//                   : Align(
//                 alignment: Alignment.topRight,
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.menu),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   double get maxExtent => 60;
//
//   @override
//   double get minExtent => 60;
//
//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
