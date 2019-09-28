import 'package:PO_Algoritmes/quick_sort/pivot_delegate/median_of_three_pivot.dart';
import 'package:test/test.dart';

main(){

  test('Test with 5 items', (){
    List<int> array = [3,7,9,2,1];
    expect(MedianOfThreePivot().getPivotIndex(array), 0);
  });

  test('Test with even items', (){
    List<int> array = [1,7,9,2];
    expect(MedianOfThreePivot().getPivotIndex(array), 3);
  });

  test('Test with no items', (){
    List<int> array = [];
    expect(MedianOfThreePivot().getPivotIndex(array), 0);
  });

  test('Test with one item', (){
    List<int> array = [6];
    expect(MedianOfThreePivot().getPivotIndex(array), 0);
  });

  test('Test with two items', (){
    List<int> array = [6,1];
    expect(MedianOfThreePivot().getPivotIndex(array), 1);
  });

  test('Test with null', (){
    List<int> array = null;
    expect(() => MedianOfThreePivot().getPivotIndex(array), throwsException);
  });

}