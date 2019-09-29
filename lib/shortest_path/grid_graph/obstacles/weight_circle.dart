import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_vertex.dart';
import 'package:PO_Algoritmes/shortest_path/grid_graph/obstacles/i_obstacle.dart';
import 'package:vector_math/vector_math.dart';

class WeightCircle implements IObstacle {

  final int x;
  final int y;
  final double radius;
  final double weight;

  WeightCircle({
    this.x,
    this.y,
    this.radius,
    this.weight
  });

  @override
  double obstacleCost(GridVertex vertex) {
    if(isInsideObstacle(vertex)) return weight;
    return 0;
  }

  @override
  bool isInsideObstacle(GridVertex vertex) {
    Vector2 vertexPosition = vertex.coordinatesVector;
    Vector2 center = Vector2(x.toDouble(), y.toDouble());
    double magnitude = (vertexPosition - center).length;
    if(magnitude < radius) return true;
    return false;
  }

}