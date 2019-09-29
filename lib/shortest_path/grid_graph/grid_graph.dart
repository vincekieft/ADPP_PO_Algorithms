import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_graph_util.dart';
import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_vertex.dart';
import 'package:PO_Algoritmes/shortest_path/grid_graph/obstacles/i_obstacle.dart';
import 'package:PO_Algoritmes/shortest_path/i_graph.dart';
import 'package:PO_Algoritmes/shortest_path/i_vertex.dart';

class GridGraph implements IGraph {

  final int _xCount;
  final int _yCount;
  final List<IObstacle> _obstacles;
  List<GridVertex> _grid;

  GridGraph(this._xCount, this._yCount, [this._obstacles = const []]){
    generateGraph();
  }

  // IGraph implementation
  @override
  IVertex findVertexById(int id) {
    if(id < 0 || id >= vertexCount) throw Exception("${id} is out of the boundaries of the graph");
    return _grid[id];
  }

  @override
  int get vertexCount => _xCount * _yCount;

  // Private methods
  void generateGraph(){
    _grid = List<GridVertex>(vertexCount);

    for(int i = 0; i < vertexCount; i++){ // Fill grid
      _grid[i] = GridVertex(
        graph: this,
        identifier: i
      );
    }

    _grid.forEach((GridVertex vertex) => vertex.initializeNeighbours()); // Initialize neighbours
  }

  // Getters
  int get xCount => _xCount;
  int get yCount => _yCount;
  List<IObstacle> get obstacles => _obstacles;

  @override
  String toString({ List<IVertex> path = const [] }) {
    List<String> rows = [];
    List<int> pathIdentifiers = path.map<int>((IVertex vertex) => vertex.identifier).toList();

    for(int y = 0; y < yCount; y++){
      List<String> vertices = List.generate(xCount, (int xIndex){
        int index = GridGraphUtil.coordinateToIndex(xIndex, y, xCount);
        if(pathIdentifiers.contains(index)) return '*';
        for(IObstacle obstacle in obstacles) if(obstacle.isInsideObstacle(findVertexById(index))) return '?';
        return '.';
      });

      rows.add(vertices.join(' '));
    }

    return rows.join('\n');
  }
}