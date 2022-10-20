abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // shared variables and functions that will be used in any view model

}

abstract class BaseViewModelInputs {
  void start(); //called whtn view model is init
  void dispose(); //called whtn view model is done
}

abstract class BaseViewModelOutputs {}
