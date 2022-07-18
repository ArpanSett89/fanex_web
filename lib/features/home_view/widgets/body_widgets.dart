import 'package:fanex_web/common/common.dart';
import 'package:fanex_web/utils/responsive.dart';
import 'package:flutter/material.dart';

class BodyWidgets extends StatelessWidget {
  const BodyWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Responsive(
        mobile: Padding(
          padding: const EdgeInsets.only(top: AppSizes.dimen60),
          child: Column(
            children: [
              _leftBloc(context),
              const SizedBox(height: AppSizes.dimen16,),
              _rightBloc(context),
            ],
          ),
        ),
        tablet: Container(
          margin:  EdgeInsets.only(top: AppSizes.dimen50,right: size.width*0.08,left: size.width*0.08,),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _leftBloc(context),
              _rightBloc(context),
            ],
          ),
        ),
        desktop: Container(
          margin:  EdgeInsets.only(top: AppSizes.dimen60,right: size.width*0.08,left: size.width*0.08,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _leftBloc(context),
              _rightBloc(context),
            ],
          ),
        ));
  }
}

Widget _leftBloc(context) {
  return Responsive(
      mobile: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/fanex_logo.png',
            width: MediaQuery.of(context).size.width * 0.35,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
          const SizedBox(
            height: 15,
          ),
          Text('A SIMPLER WAY TO PLAY',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.width * 0.030,
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
                  fontSize: MediaQuery.of(context).size.width * 0.030,
                  color: AppColors.white,
                  shadows: const [
                    BoxShadow(
                        offset: Offset(2, 2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        color: AppColors.black)
                  ])),
        ],
      ),
      tablet: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/fanex_logo.png',
            width: MediaQuery.of(context).size.width * 0.25,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: AppSizes.dimen16,
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
      ),
      desktop: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/fanex_logo.png',
            width: MediaQuery.of(context).size.width * 0.25,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
          const SizedBox(
            height: AppSizes.dimen16,
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
      ));
}

Widget _rightBloc(context) {
  return Responsive(
      mobile: Column(
        children: [
          Image.asset(
            'assets/images/qr_code.png',
            width: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: AppSizes.dimen16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/android_download_image.png',
                width: 120,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/images/i_phone_download_image.png',
                width: 120,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.dimen16,
          ),
          const Text(
            'Only available on Android… iOS is coming soon!',
            style: TextStyle(color: AppColors.white, shadows: [
              BoxShadow(
                  offset: Offset(2, 2),
                  spreadRadius: 1,
                  blurRadius: 10,
                  color: AppColors.black)
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/onfido.png',
                width: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                'assets/images/paytm.png',
                width: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
      tablet: Column(
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
                width: AppSizes.dimen16,
              ),
              Image.asset(
                'assets/images/i_phone_download_image.png',
                width: 150,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.dimen16,
          ),
          const Text(
            'Only available on Android… iOS is coming soon!',
            style: TextStyle(color: AppColors.white, shadows: [
              BoxShadow(
                  offset: Offset(2, 2),
                  spreadRadius: 1,
                  blurRadius: 10,
                  color: AppColors.black)
            ]),
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
                width: 5,
              ),
              Image.asset(
                'assets/images/paytm.png',
                width: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
      desktop: Column(
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
            style: TextStyle(color: AppColors.white, shadows: [
              BoxShadow(
                  offset: Offset(2, 2),
                  spreadRadius: 1,
                  blurRadius: 10,
                  color: AppColors.black)
            ]),
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
                width: 5,
              ),
              Image.asset(
                'assets/images/paytm.png',
                width: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ));
}
