import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ListMapProvider extends ChangeNotifier{
  List<Map<String,dynamic>> _mData=[];


  ///events
  void addData(Map<String,dynamic> data){
    _mData.add(data);
    notifyListeners();

  }

  //update data
  void updateData(Map<String,dynamic>updatedData ,int index ){//index to identify
    _mData[index]=updatedData;
    notifyListeners();

  }
  void deleteData(int index){
    _mData.removeAt(index);
    notifyListeners();
  }
  List<Map<String,dynamic>>getData()=>_mData;


}