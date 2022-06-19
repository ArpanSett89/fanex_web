import 'package:fanex_web/common/common.dart';
import 'package:fanex_web/common/widgets/header/header_ui.dart';
import 'package:flutter/material.dart';

class ChakraView extends StatefulWidget {
  const ChakraView({Key? key}) : super(key: key);

  @override
  State<ChakraView> createState() => _ChakraViewState();
}

class _ChakraViewState extends State<ChakraView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: ListView(
        shrinkWrap: true,
        children: [
          Header(),
        ],
      ),
    );
  }
}
