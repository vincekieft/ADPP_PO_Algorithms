import 'package:PO_Algoritmes/shortest_path/i_edge.dart';

abstract class IVertex {
  int get identifier;
  List<IEdge> get neighbours;
}