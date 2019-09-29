import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_graph.dart';
import 'package:PO_Algoritmes/shortest_path/grid_graph/obstacles/weight_circle.dart';
import 'package:PO_Algoritmes/shortest_path/i_vertex.dart';
import 'package:PO_Algoritmes/shortest_path/pathfinder.dart';
import 'package:test/test.dart';

void main(){

  test('Test weighted circle in 10x10 grid', (){
    GridGraph graph = GridGraph(10,10, [
      WeightCircle(x: 5, y: 5, radius: 4, weight: 100)
    ]);
    Pathfinder pathfinder = Pathfinder();
    List<IVertex> path = pathfinder.shortestPath(graph.findVertexById(0), graph.findVertexById(99));
    List<int> identifiers = path.map<int>((IVertex vertex) => vertex.identifier).toList();
    expect(identifiers, [0, 1, 2, 3, 4, 5, 6, 7, 8, 18, 28, 29, 39, 49, 59, 69, 79, 89, 99]);
  });

}