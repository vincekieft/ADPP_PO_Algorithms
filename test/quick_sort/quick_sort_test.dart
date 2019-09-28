import 'package:PO_Algoritmes/quick_sort/quick_sort.dart';
import 'package:test/test.dart';

void main() {

  test('Sort int array', (){
    QuickSort<int> sorter = QuickSort<int>();
    List<int> array = [5,8,4,2,5,7,5,3,5,9,12,44,66,8,43];
    expect(sorter.sort(array), [2,3,4,5,5,5,5,7,8,8,9,12,43,44,66]);
  });

  test('Sort string array', (){
    QuickSort<String> sorter = QuickSort<String>();
    List<String> array = ['hallo', 'appel', 'koe','kaas'];
    expect(sorter.sort(array), ['appel', 'hallo', 'kaas', 'koe']);
  });

  test('Null input', (){
    expect(() => QuickSort<int>().sort(null), throwsException);
  });

  test('Sort with uneven small amount of items', (){
    QuickSort<int> sorter = QuickSort<int>();
    List<int> array = [5,8,4];
    expect(sorter.sort(array), [4,5,8]);
  });

  test('Sort with even small amount of items', (){
    QuickSort<int> sorter = QuickSort<int>();
    List<int> array = [8,4];
    expect(sorter.sort(array), [4,8]);
  });

  test('Sort with single item', (){
    QuickSort<int> sorter = QuickSort<int>();
    List<int> array = [4];
    expect(sorter.sort(array), [4]);
  });

  test('Sort with empty array', (){
    QuickSort<int> sorter = QuickSort<int>();
    List<int> array = [];
    expect(sorter.sort(array), []);
  });
}