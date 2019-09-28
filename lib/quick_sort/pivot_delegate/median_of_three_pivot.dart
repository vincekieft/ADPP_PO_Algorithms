import 'package:PO_Algoritmes/quick_sort/pivot_delegate/center_pivot.dart';
import 'package:PO_Algoritmes/quick_sort/pivot_delegate/i_pivot_delegate.dart';
import 'package:PO_Algoritmes/quick_sort/quick_sort.dart';

class MedianOfThreePivot<T extends Comparable> implements IPivotDelegate<T> {

  @override
  int getPivotIndex(List<T> list) {
    if(list == null) throw Exception('Cannot get index of null');
    if(list.length == 0) return 0; // Guard for empty list

    List<_IndexValueTuple<T>> tuples = [
      _IndexValueTuple<T>(index: 0, value: list.first),
      _IndexValueTuple<T>(index: list.length~/2, value: list[list.length~/2]),
      _IndexValueTuple<T>(index: list.length -1, value: list.last)
    ];

    return QuickSort<_IndexValueTuple<T>>(
      pivotDelegate: CenterPivot()
    ).sort(tuples)[1].index;
  }

}

class _IndexValueTuple<T extends Comparable> implements Comparable<_IndexValueTuple<T>> {
  int index;
  T value;

  _IndexValueTuple({this.index, this.value});

  @override
  int compareTo(_IndexValueTuple<T> other) {
    return value.compareTo(other.value);
  }

}