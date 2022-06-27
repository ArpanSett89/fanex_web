import 'package:fanex_web/common/common.dart';
import 'package:fanex_web/common/widgets/header/header_ui.dart';
import 'package:fanex_web/features/chakra/bloc/chakra_body_list_bloc/body_list_bloc.dart';
import 'package:fanex_web/features/chakra/bloc/chakra_end_list_bloc/end_list_bloc.dart';
import 'package:fanex_web/features/chakra/model/chakra_end_date_list_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/widgets/footer/footer_ui.dart';
import '../widgets/chakra_body.dart';

class ChakraView extends StatefulWidget {
  const ChakraView({Key? key}) : super(key: key);

  @override
  State<ChakraView> createState() => _ChakraViewState();
}

class _ChakraViewState extends State<ChakraView> {
  List<String> tabTitle = [
    AppStrings.tabText1,
    AppStrings.tabText2,
    AppStrings.tabText3,
    AppStrings.tabText4,
    AppStrings.tabText5,
    AppStrings.tabText6,
  ];
  String dropdownValue = '';
  int dropdownValueIndex = 0;
  int hoverIndex = 0;
  int selectedIndex = 0;
  List<String> date = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.lightGrey.withOpacity(0.78),
              image: const DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/chakra_banner.png'),
                  fit: BoxFit.cover)),
          child: ListView(
            shrinkWrap: true,
            children: [
              Header(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.dimen30, vertical: AppSizes.dimen30),
                child: Container(
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Center(
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                color: AppColors.white,
                              ))),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            hintText: AppStrings.SearchText,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      BlocBuilder<EndListBloc, EndListState>(
                        builder: (context, state) {
                          if (state is EndListLoaded) {
                            BlocProvider.of<BodyListBloc>(context).add(
                                GetBodyList(state.chakraEndDateListResponseModel
                                    .data![dropdownValueIndex].id
                                    .toString()));
                            return DropdownButtonHideUnderline(
                              child: DropdownButton<Data>(
                                value: state.chakraEndDateListResponseModel
                                    .data![dropdownValueIndex],
                                elevation: 0,
                                dropdownColor:
                                    AppColors.header.withOpacity(0.7),
                                underline: const SizedBox(
                                  height: 0,
                                  width: 0,
                                ),
                                icon: const Icon(
                                  Icons.menu,
                                  size: AppSizes.dimen30,
                                  color: AppColors.white,
                                ),
                                items: state
                                    .chakraEndDateListResponseModel.data!
                                    .map((e) {
                                  return DropdownMenuItem<Data>(
                                    value: e,
                                    child: Center(
                                      child: Text(
                                        e.date.toString(),
                                        style:  TextStyle(
                                            color:dropdownValueIndex==state.chakraEndDateListResponseModel.data!.indexOf(e)?AppColors.white:AppColors.orange,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (Data? newValue) {
                                  setState(() {
                                    dropdownValueIndex = state
                                        .chakraEndDateListResponseModel.data!
                                        .indexOf(newValue!);
                                    print(
                                        "dropdownValueIndex $dropdownValueIndex");
                                  });
                                  BlocProvider.of<BodyListBloc>(context).add(
                                      GetBodyList(state
                                          .chakraEndDateListResponseModel
                                          .data![dropdownValueIndex]
                                          .id
                                          .toString()));
                                },
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                // child:
              ),
              ChakraBody(
                tabTitle: tabTitle,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const FooterView(),
            ],
          ),
        ),
      ),
    );
  }
}


