import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDarkMode=false;

  bool getThemeValue()=>_isDarkMode;//we define function for encapsulation ..to make variable accessble as it is in private

  void updateTheme({required bool value}){
    _isDarkMode=value;
    notifyListeners();

  }
}