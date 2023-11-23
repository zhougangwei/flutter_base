import 'package:flutter/cupertino.dart';

class PageControllerProvider extends ChangeNotifier {
  PageController _pageController = PageController();
  int _currentPageIndex = 0;

  PageController get pageController => _pageController;
  int get currentPageIndex => _currentPageIndex;
  set currentPageIndex(int value) {
    _currentPageIndex = value;
  }


  void goToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _currentPageIndex = index;
    notifyListeners();
  }
}