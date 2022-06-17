import 'package:fanex_web/common/common.dart';
import 'package:flutter/material.dart';

class BodyWidgets extends StatelessWidget {
  const BodyWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: MediaQuery.of(context).size.width > 720
          ? Axis.horizontal
          : Axis.vertical,
      children: [
        _leftBloc(context),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.20,
        ),
        _rightBloc(context),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
      ],
    );
  }
}
Widget _leftBloc(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        'assets/images/fanex_logo.png',
        width: MediaQuery.of(context).size.width * 0.25,
        fit: BoxFit.cover,
      ),
      const SizedBox(
        height: 15,
      ),
      Text('A SIMPLER WAY TO PLAY',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: MediaQuery.of(context).size.width * 0.025,
              color: AppColors.white,
              shadows: const [
                BoxShadow(
                    offset: Offset(2, 2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    color: AppColors.black)
              ])),
      SizedBox(
        height: MediaQuery.of(context).size.width * 0.009,
      ),
      Text('FANTASY CRICKET',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: MediaQuery.of(context).size.width * 0.025,
              color: AppColors.white,
              shadows: const [
                BoxShadow(
                    offset: Offset(2, 2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    color: AppColors.black)
              ])),
    ],
  );
}

Widget _rightBloc(context) {
  return Column(
    children: [
      Image.asset(
        'assets/images/qr_code.png',
        width: 70,
        fit: BoxFit.cover,
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/android_download_image.png',
            width: 150,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            'assets/images/i_phone_download_image.png',
            width: 150,
            fit: BoxFit.cover,
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      const Text(
        'Only available on Android… iOS is coming soon!',
        style: TextStyle(color: AppColors.white),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/onfido.png',
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width:5,
          ),
          Image.asset(
            'assets/images/paytm.png',
            width: 100,
            fit: BoxFit.cover,
          ),
        ],
      ),
    ],
  );
}