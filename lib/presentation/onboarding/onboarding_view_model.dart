import '../base/base_view_model.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutputs {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }
}

//
abstract class OnboardingViewModelInputs {
  void goNext(); // click the right arrow or swipe right
  void goPrevious(); // click the left arrow or swipe left
  void onPageChanged(int index);
}

abstract class OnboardingViewModelOutputs {}
