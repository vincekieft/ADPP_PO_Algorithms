import 'package:PO_Algoritmes/quick_sort/pivot_delegate/i_pivot_delegate.dart';
import 'package:PO_Algoritmes/quick_sort/pivot_delegate/median_of_three_pivot.dart';

class QuickSort<T extends Comparable> {

  final IPivotDelegate _pivotDelegate;

  QuickSort({
    IPivotDelegate pivotDelegate
  }) : this._pivotDelegate = pivotDelegate ?? MedianOfThreePivot();

  List<T> sort(List<T> list){
    if(list == null) throw new Exception("Null is not subtype of: ${List<T>().runtimeType}");
    if(list.length <= 1) return list;

    final int pivotIndex = _pivotDelegate.getPivotIndex(list);
    final T pivot = list[pivotIndex];
    final List<T> left = [], right = [];

    for(int i = 0; i < list.length; i++){
      if(i == pivotIndex) continue; // Skip pivot

      // Fill left and right array
      T item = list[i];
      if(item.compareTo(pivot) <= 0) left.add(item);
      if(item.compareTo(pivot) > 0) right.add(item);
    }

    return [...sort(left), pivot, ...sort(right)]; // Merge arrays
  }

}