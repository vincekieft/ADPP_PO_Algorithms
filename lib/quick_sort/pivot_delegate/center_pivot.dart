import 'package:PO_Algoritmes/quick_sort/pivot_delegate/i_pivot_delegate.dart';

class CenterPivot implements IPivotDelegate {

  @override
  int getPivotIndex(List<Comparable> list) {
    if(list == null) throw Exception('Cannot get index of null');
    return list.length~/2;
  }

}