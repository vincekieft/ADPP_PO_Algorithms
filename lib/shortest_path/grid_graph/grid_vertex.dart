import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_edge.dart';
import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_graph.dart';
import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_graph_util.dart';
import 'package:PO_Algoritmes/shortest_path/i_edge.dart';
import 'package:PO_Algoritmes/shortest_path/i_vertex.dart';

class GridVertex implements IVertex {

  final int _identifier;
  final GridGraph _graph;

  List<GridEdge> _neighbours;

  GridVertex({
    int identifier,
    GridGraph graph
  }) :
      assert(identifier != null),
      assert(graph != null),
      _graph = graph,
      _identifier = identifier;

  @override
  int get identifier => _identifier;

  @override
  List<IEdge> get neighbours => _neighbours;


  // Private methods
  void _addNeighbourToList(int x, int y, List<GridEdge> neighbourList){
    if(x < 0 ||
       x >= _graph.xCount ||
       y < 0 ||
       y >= _graph.yCount) return;

    int index = GridGraphUtil.coordinateToIndex(x, y, _graph.xCount);
    neighbourList.add(GridEdge(_graph.findVertexById(index)));
  }

  // Public methods
  void initializeNeighbours(){
    _neighbours = List<GridEdge>();
    List<int> coordinates = GridGraphUtil.indexToCoordinate(_identifier, _graph.xCount);
    int x = coordinates[0];
    int y = coordinates[1];

    _addNeighbourToList(x - 1, y, _neighbours); // left
    _addNeighbourToList(x + 1, y, _neighbours); // right
    _addNeighbourToList(x, y + 1, _neighbours); // top
    _addNeighbourToList(x, y - 1, _neighbours); // bottom
  }

}