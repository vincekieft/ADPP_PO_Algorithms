import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_edge.dart';
import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_graph.dart';
import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_graph_util.dart';
import 'package:PO_Algoritmes/shortest_path/i_edge.dart';
import 'package:PO_Algoritmes/shortest_path/i_vertex.dart';
import 'package:vector_math/vector_math.dart';

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
    GridEdge edge = GridEdge(_graph.findVertexById(index));

    if(edge.cost == null) return; // Obstacle in the way

    neighbourList.add(edge);
  }

  // Public methods
  void initializeNeighbours(){
    _neighbours = List<GridEdge>();
    List<int> coords = coordinates;
    int x = coords[0];
    int y = coords[1];

    _addNeighbourToList(x - 1, y, _neighbours); // left
    _addNeighbourToList(x + 1, y, _neighbours); // right
    _addNeighbourToList(x, y + 1, _neighbours); // top
    _addNeighbourToList(x, y - 1, _neighbours); // bottom
  }

  List<int> get coordinates => GridGraphUtil.indexToCoordinate(_identifier, _graph.xCount);
  Vector2 get coordinatesVector => Vector2(coordinates[0].toDouble(), coordinates[1].toDouble());
  GridGraph get graph => _graph;
}