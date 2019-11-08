import 'package:PO_Algoritmes/shortest_path/i_vertex.dart';
import 'package:PO_Algoritmes/shortest_path/road_map/road.dart';

class City implements IVertex {

  final String name;
  final int identifier;
  List<Road> neighbours;

  City({
    this.name,
    this.identifier,
    this.neighbours
  }) :
        assert(name != null),
        assert(identifier != null),
        assert(neighbours != null);


  @override
  String toString() {
    return name;
  }
}