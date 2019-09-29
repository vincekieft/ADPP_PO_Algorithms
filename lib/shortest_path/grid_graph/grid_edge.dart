import 'dart:math';
import 'package:PO_Algoritmes/shortest_path/grid_graph/grid_vertex.dart';
import 'package:PO_Algoritmes/shortest_path/grid_graph/obstacles/i_obstacle.dart';
import 'package:PO_Algoritmes/shortest_path/i_edge.dart';

class GridEdge implements IEdge {

  final GridVertex _vertex;

  GridEdge(this._vertex);

  @override
  double get cost {
    double cost = 1.0;

    for(IObstacle obstacle in _vertex.graph.obstacles){
      double obstacleCost = obstacle.obstacleCost(_vertex);
      if(obstacleCost == null) return null;
      cost = max(cost, obstacleCost);
    }

    return cost;
  }

  @override
  GridVertex get vertex => _vertex;

}