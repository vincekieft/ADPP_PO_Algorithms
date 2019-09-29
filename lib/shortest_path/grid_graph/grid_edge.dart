import 'package:PO_Algoritmes/shortest_path/i_edge.dart';
import 'package:PO_Algoritmes/shortest_path/i_vertex.dart';

class GridEdge implements IEdge {

  final IVertex _vertex;

  GridEdge(this._vertex);

  @override
  double get cost => 1;

  @override
  IVertex get vertex => _vertex;

}