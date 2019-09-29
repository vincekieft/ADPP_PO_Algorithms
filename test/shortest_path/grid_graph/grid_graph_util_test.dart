import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_graph.dart';
import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_graph_util.dart';
import 'package:test/test.dart';

void main(){

  group('Grid graph util test', (){

    test('coordinateToIndex test', (){
      GridGraph graph = GridGraph(5,5);
      expect(GridGraphUtil.coordinateToIndex(3, 3, graph.xCount), 18);
    });

    test('indexToCoordinate test 18', (){
      GridGraph graph = GridGraph(5,5);
      expect(GridGraphUtil.indexToCoordinate(18, graph.xCount), [3,3]);
    });

    test('indexToCoordinate test start index', (){
      GridGraph graph = GridGraph(5,5);
      expect(GridGraphUtil.indexToCoordinate(0, graph.xCount), [0, 0]);
    });

    test('indexToCoordinate test end index', (){
      GridGraph graph = GridGraph(5,5);
      expect(GridGraphUtil.indexToCoordinate(24, graph.xCount), [4, 4]);
    });

  });

}