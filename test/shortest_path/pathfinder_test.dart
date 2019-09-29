import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_graph.dart';
import 'package:PO_Algoritmes/shortest_path/i_vertex.dart';
import 'package:PO_Algoritmes/shortest_path/pathfinder.dart';
import 'package:test/test.dart';

void main(){

  group('Pathfinder tests', (){

    test('Pathfinder search path test 3x3', (){
      GridGraph gridGraph = GridGraph(3,3);
      Pathfinder pathfinder = Pathfinder();
      List<IVertex> path = pathfinder.shortestPath(gridGraph.findVertexById(0), gridGraph.findVertexById(8));
      List<int> identifiers = path.map<int>((IVertex vertex) => vertex.identifier).toList();
      expect(identifiers, [0,3,6,7,8]);
    });

    test('Pathfinder search path test 10x10, edge search', (){
      GridGraph gridGraph = GridGraph(10,10);
      Pathfinder pathfinder = Pathfinder();
      List<IVertex> path = pathfinder.shortestPath(gridGraph.findVertexById(0), gridGraph.findVertexById(8));
      List<int> identifiers = path.map<int>((IVertex vertex) => vertex.identifier).toList();
      expect(identifiers, [0, 1, 2, 3, 4, 5, 6, 7, 8]);
    });

    test('Pathfinder search path test 20x20', (){
      GridGraph gridGraph = GridGraph(20,20);
      Pathfinder pathfinder = Pathfinder();
      List<IVertex> path = pathfinder.shortestPath(gridGraph.findVertexById(0), gridGraph.findVertexById(252));
      List<int> identifiers = path.map<int>((IVertex vertex) => vertex.identifier).toList();
      expect(identifiers, [0,20,40,60,80,100,101,102,103,123,143,144,145,165,166,167,168,169,170,190,210,211,212,232,252]);
    });

    test('No path found test', (){
      GridGraph gridGraph = GridGraph(5,5);
      Pathfinder pathfinder = Pathfinder();
      expect(() => pathfinder.shortestPath(gridGraph.findVertexById(0), gridGraph.findVertexById(100)), throwsException);
    });

  });

}