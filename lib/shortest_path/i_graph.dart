import 'package:PO_Algoritmes/shortest_path/i_vertex.dart';

abstract class IGraph {

  // Public methods
  IVertex findVertexById(int id);


  // Getters
  int get vertexCount;

}