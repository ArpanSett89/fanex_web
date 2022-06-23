import 'package:fanex_web/common/common.dart';
import 'package:fanex_web/common/widgets/header/header_ui.dart';
import 'package:fanex_web/utils/responsive.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/footer/footer_ui.dart';

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
  String dropdownValue = 'HOME';
  int hoverIndex = 0;
  int selectedIndex = 0;

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
                        flex: 4,
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
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: dropdownValue,
                          elevation: 0,
                          dropdownColor: AppColors.header.withOpacity(0.7),
                          underline: const SizedBox(
                            height: 0,
                            width: 0,
                          ),
                          icon: const Icon(
                            Icons.menu,
                            size: AppSizes.dimen30,
                            color: AppColors.white,
                          ),
                          items: tabTitle.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Center(
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              dropdownValue = newValue.toString();
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                // child:
              ),
              Body(
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

class Body extends StatefulWidget {
  final List<String> tabTitle;

  const Body({Key? key, required this.tabTitle}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int hoverIndex = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.dimen30),
      child: Responsive(
          mobile: Center(
            child: ListView(
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
                                  fontSize: 30,
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
                                      height: 30,
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
                                        fontSize: 30,
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
                                      fontSize: 30,
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
                                          height: 30,
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
                                  padding:
                                      const EdgeInsets.all(AppSizes.dimen16),
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
                                            fontSize: 30,
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
          desktop: Container(
            color: AppColors.amber,
            child: Row(
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
                                        fontSize: 30,
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
                                            height: 30,
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
                                    padding:
                                        const EdgeInsets.all(AppSizes.dimen16),
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
                                              fontSize: 30,
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
          )),
    );
  }
}
