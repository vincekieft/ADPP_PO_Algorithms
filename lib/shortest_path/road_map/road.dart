import 'package:PO_Algoritmes/shortest_path/i_edge.dart';
import 'package:PO_Algoritmes/shortest_path/i_vertex.dart';
import 'package:PO_Algoritmes/shortest_path/road_map/city.dart';

class Road implements IEdge {

  final double cost;
  final City city;

  Road({
    this.cost,
    this.city
  }) :
      assert(cost != null),
      assert(city != null);

  @override
  IVertex get vertex => city;

}