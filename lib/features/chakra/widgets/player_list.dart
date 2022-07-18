import 'package:fanex_web/features/chakra/bloc/chakra_body_list_bloc/body_list_bloc.dart';
import 'package:fanex_web/utils/indexing_bloc/index_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/common.dart';
import '../../../utils/app_helper.dart';
int globalSelectedIndex=0;
class BuildPlayerList extends StatefulWidget {
  final BodyListLoaded state;

  const BuildPlayerList(
      {Key? key,
      required this.state,})
      : super(key: key);

  @override
  State<BuildPlayerList> createState() => _BuildPlayerListState();
}

class _BuildPlayerListState extends State<BuildPlayerList> {
  int hoverIndex = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider<IndexBloc>(
      create: (context) => IndexBloc()..add(GetTapIndex(0)),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.state.chakraBodyListModel.data!.length,
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
            child: BlocListener<IndexBloc, IndexState>(
              listener: (context, state) {
                if (state is TapIndexLoaded) {
                  selectedIndex = state.index;
                  globalSelectedIndex=state.index;
                }
              },
              child: InkWell(
                onTap: () {
                  BlocProvider.of<IndexBloc>(context).add(GetTapIndex(index));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: hoverIndex == index || selectedIndex == index
                        ? AppColors.seeGreen
                        : index.isEven
                            ? AppColors.lightGrey
                            : AppColors.white,
                    borderRadius: index == 0
                        ? const BorderRadius.vertical(
                            top: Radius.circular(AppSizes.cardCornerRadius),
                          )
                        : index ==
                                widget.state.chakraBodyListModel.data!.length -
                                    1
                            ? const BorderRadius.vertical(
                                bottom:
                                    Radius.circular(AppSizes.cardCornerRadius),
                              )
                            : BorderRadius.circular(0),
                  ),
                  height: size.height * 0.15,
                  // width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.dimen24),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              _profileContainer(
                                  AppSizes.dimen70,
                                  AppSizes.dimen70,
                                  widget.state.chakraBodyListModel.data![index]
                                      .imageUrl!,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  widget.state.chakraBodyListModel.data![index]
                                      .userUsername
                                      .toString(),
                                  style: Theme.of(context).textTheme.headline6),
                              const SizedBox(
                                height: AppSizes.dimen16,
                              ),
                              Text(
                                '${AppStrings.sinceText}${widget.state.chakraBodyListModel.start.toString()}',
                                style: TextStyle(
                                  color: hoverIndex == index ||
                                          selectedIndex == index
                                      ? AppColors.white
                                      : AppColors.darkGrey,
                                ),
                                maxLines: 4,
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: hoverIndex == index ||
                                        selectedIndex == index
                                    ? AppColors.white
                                    : AppColors.seeGreen,
                                borderRadius: BorderRadius.circular(
                                    AppSizes.cardCornerRadius)),
                            height: size.height * 0.05,
                            width: AppSizes.dimen60,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSizes.dimen2),
                              child: Center(
                                child: Text(
                                  "${widget.state.chakraBodyListModel.data![index].ranking.toString()}'${AppHelper.ordinalSuffixOf(widget.state.chakraBodyListModel.data![index].ranking!.toInt())}",
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
                          )
                        ]),
                  ),
                ),
              ),
            ),
          );
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
