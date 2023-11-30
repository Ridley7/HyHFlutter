import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension NavigationExtension<T> on BuildContext{
  Future<T?> push(Widget page){
    return Navigator.push(this, MaterialPageRoute(builder: (context) => page));
  }

  pushReplacement(Widget page) {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => page));
  }

  pop({T? result}){
    Navigator.maybePop(this, result);
  }
}