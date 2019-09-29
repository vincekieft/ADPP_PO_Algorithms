import 'package:PO_Algoritmes/shortest_path/i_vertex.dart';

abstract class IEdge {
  IVertex get vertex;
  double get cost;
}