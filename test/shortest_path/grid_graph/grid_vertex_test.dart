import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_graph.dart';
import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_vertex.dart';
import 'package:PO_Algoritmes/shortest_path/i_edge.dart';
import 'package:PO_Algoritmes/shortest_path/i_vertex.dart';
import 'package:test/test.dart';

void main(){

  group('Grid vertex tests', (){

    test('4 neighbours length test', (){
      GridGraph graph = GridGraph(5,5);
      GridVertex vertex = GridVertex(identifier: 12, graph: graph);
      vertex.initializeNeighbours();
      expect(vertex.neighbours.length, 4);
    });

    test('neighbours vertex not null test', (){
      GridGraph graph = GridGraph(5,5);

      for(int i = 0; i < graph.vertexCount; i++){
        IVertex vertex = graph.findVertexById(i);
        List<IEdge> neighbours = vertex.neighbours;
        
        for(IEdge edge in neighbours){
          expect(edge.vertex, isNotNull);
        }
      }
    });

    test('top left corner neighbours length test', (){
      GridGraph graph = GridGraph(5,5);
      GridVertex vertex = GridVertex(identifier: 0, graph: graph);
      vertex.initializeNeighbours();
      expect(vertex.neighbours.length, 2);
    });

    test('bottom right corner neighbours length test', (){
      GridGraph graph = GridGraph(5,5);
      GridVertex vertex = GridVertex(identifier: 24, graph: graph);
      vertex.initializeNeighbours();
      expect(vertex.neighbours.length, 2);
    });

    test('4 neighbours identifier test', (){
      GridGraph graph = GridGraph(3,3);
      GridVertex vertex = GridVertex(identifier: 4, graph: graph);
      vertex.initializeNeighbours();
      List<int> identifiers = vertex.neighbours.map<int>((IEdge edge){
        return edge.vertex.identifier;
      }).toList();

      expect(identifiers, [3, 5, 7, 1]);
    });

  });

}