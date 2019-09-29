import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_graph.dart';
import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_vertex.dart';
import 'package:test/test.dart';

void main(){

  group('Grid graph tests', (){

    test('Grid graph find vertex', (){
      GridGraph gridGraph = GridGraph(5,5);
      GridVertex vertex = gridGraph.findVertexById(22);
      expect(vertex.identifier, 22);
    });

    test('Grid graph find out of bounds', (){
      GridGraph gridGraph = GridGraph(5,5);
      expect(() => gridGraph.findVertexById(100), throwsException);
    });

  });

}