import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_vertex.dart';

abstract class IObstacle {
  bool isInsideObstacle(GridVertex vertex);
  double obstacleCost(GridVertex vertex);
}