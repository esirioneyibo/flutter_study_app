import 'package:scoped_model/scoped_model.dart';

class BottomNavigatorModel extends Model {
  int _currentIndex;

  int get currentIndex => _currentIndex;

  void changeTab(index) {
    _currentIndex = index;
    notifyListeners();
  }
}
