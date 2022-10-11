import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_care/presentation/resources/assets_manager.dart';
import 'package:pet_care/presentation/resources/color_manager.dart';
import 'package:pet_care/presentation/resources/values_manager.dart';
import '../resources/strings_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController _pageController = PageController(initialPage: 0);
  int _curentIndex = 0;
  late final List<SliderObject> sliderList = _getSliderData();

  List<SliderObject> _getSliderData() => [
        SliderObject(
          StringManager.onboardingTitle1,
          StringManager.onboardingSubtitle1,
          ImageAssets.dogIcon,
        ),
        SliderObject(
          StringManager.onboardingTitle2,
          StringManager.onboardingSubtitle2,
          ImageAssets.scheduleIcon,
        ),
        SliderObject(StringManager.onboardingTitle3,
            StringManager.onboardingSubtitle3, ImageAssets.chartIcon),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: AppSize.s4,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: sliderList.length,
          onPageChanged: (index) => setState(() => _curentIndex = index),
          itemBuilder: (context, index) {}),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  SliderObject _sliderObject;
  OnboardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppSize.s8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSize.s8),
          child: Text(
            _sliderObject.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(height: AppSize.s60),
      ],
    );
  }
}

class SliderObject {
  String title;
  String subtitle;
  String image;

  SliderObject(this.title, this.subtitle, this.image);
}
