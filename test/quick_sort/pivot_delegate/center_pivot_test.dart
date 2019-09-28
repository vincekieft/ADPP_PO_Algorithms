import 'package:PO_Algoritmes/quick_sort/pivot_delegate/center_pivot.dart';
import 'package:test/test.dart';

main(){

  test('Test center pivot with 3 items', (){
    List<int> array = [4,8,5];
    expect(CenterPivot().getPivotIndex(array), 1);
  });

  test('Test center pivot with even amount', (){
    List<int> array = [4,8,2,7];
    expect(CenterPivot().getPivotIndex(array), 2);
  });

  test('Test center pivot with 1 item', (){
    List<int> array = [4];
    expect(CenterPivot().getPivotIndex(array), 0);
  });

  test('Test center pivot with no items', (){
    List<int> array = [];
    expect(CenterPivot().getPivotIndex(array), 0);
  });

  test('Test with null', (){
    List<int> array = null;
    expect(() => CenterPivot().getPivotIndex(array), throwsException);
  });

}