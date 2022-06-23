import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../common.dart';

class ScrollControlButton extends StatelessWidget {
  final VoidCallback onTap;
   final bool isVisible;
   const ScrollControlButton({Key? key, required this.onTap,required this.isVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: InkWell(
        radius: 0,
        highlightColor: AppColors.transparent,
        hoverColor: AppColors.transparent,
        splashColor: AppColors.transparent,
        onTap: onTap,
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
    );
  }
}
