import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';
import '../resources/strings_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  late final List<SliderObject> _sliderList = _getSliderData();

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
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: _sliderList.length,
          onPageChanged: (index) => setState(() => _currentIndex = index),
          itemBuilder: (context, index) {
            return OnboardingPage(_sliderList[index]);
          }),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  StringManager.skip,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.accent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //backward arrow
          Padding(
            padding: const EdgeInsets.all(AppSize.s12),
            child: GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  _getPreviousIndex(),
                  duration: const Duration(milliseconds: DurationManager.d300),
                  curve: Curves.easeIn,
                );
              },
              child: const SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
          // circle indicator
          Row(
            children: [
              for (int i = 0; i < _sliderList.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppSize.s8),
                  child: _getProperCircle(i),
                )
            ],
          ),
          // forward arrow
          Padding(
            padding: const EdgeInsets.all(AppSize.s12),
            child: GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  _getNextIndex(),
                  duration: const Duration(milliseconds: DurationManager.d300),
                  curve: Curves.easeIn,
                );
              },
              child: const SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _getPreviousIndex() =>
      _currentIndex - 1 < 0 ? _sliderList.length - 1 : _currentIndex - 1;

  int _getNextIndex() =>
      _currentIndex + 1 == _sliderList.length ? 0 : _currentIndex + 1;

  Widget _getProperCircle(int index) {
    return Container(
      height: AppSize.s4,
      width: AppSize.s12,
      color: index == _currentIndex ? ColorManager.primary : ColorManager.grey,
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnboardingPage(this._sliderObject, {Key? key}) : super(key: key);

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
        SvgPicture.asset(_sliderObject.image),
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
