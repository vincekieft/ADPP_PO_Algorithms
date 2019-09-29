import 'dart:collection';
import 'package:PO_Algoritmes/shortest_path/i_edge.dart';
import 'package:PO_Algoritmes/shortest_path/i_vertex.dart';
import 'package:collection/collection.dart';

class Pathfinder {

  List<IVertex> shortestPath(IVertex start, IVertex end){
    HeapPriorityQueue<_SearchTimeVertex> queue = HeapPriorityQueue<_SearchTimeVertex>();
    HashMap<int, IVertex> visited = HashMap<int, IVertex>();
    HashMap<int, _SearchTimeVertex> evaluatedNodes = HashMap<int, _SearchTimeVertex>();
    _SearchTimeVertex current = _SearchTimeVertex(vertex: start, cost: 0);

    // Add start to evaluated nodes
    queue.add(current);
    evaluatedNodes[current.vertex.identifier] = current;

    while(!queue.isEmpty) {
      current = queue.removeFirst(); // Set lowest cost node in queue to new current node

      if(current.vertex.identifier == end.identifier) return backtraceSolution(start, current, [current.vertex]); // Found solution
      visited[current.vertex.identifier] = current.vertex; // Add current node to visited map

      for(IEdge edge in current.vertex.neighbours){
        IVertex vertex = edge.vertex;

        // Visited neighbours are never visited again
        if(visited.containsKey(vertex.identifier)) continue;

        double tentativeCost = current.cost + edge.cost;

        if(!evaluatedNodes.containsKey(vertex.identifier)) {
          _SearchTimeVertex _searchTimeVertex = _SearchTimeVertex(vertex: vertex, cost: tentativeCost, parent: current);
          evaluatedNodes[vertex.identifier] = _searchTimeVertex;
          queue.add(_searchTimeVertex);
        } else if(evaluatedNodes[vertex.identifier].cost > tentativeCost) {
          evaluatedNodes[vertex.identifier].cost = tentativeCost;
          evaluatedNodes[vertex.identifier].parent = current;
          queue.remove(evaluatedNodes[vertex.identifier]);
          queue.add(evaluatedNodes[vertex.identifier]);
        }
      }
    }

    throw Exception('No path could be found from start to end node');
  }

  List<IVertex> backtraceSolution(IVertex start, _SearchTimeVertex current, List<IVertex> path){
    if(start.identifier == current.vertex.identifier) return path;
    path.insert(0, current.parent.vertex);
    return backtraceSolution(start, current.parent, path);
  }

}

class _SearchTimeVertex implements Comparable<_SearchTimeVertex>{

  double cost;
  final IVertex vertex;
  _SearchTimeVertex parent;

  _SearchTimeVertex({
    this.vertex,
    this.cost = double.infinity,
    this.parent
  });

  @override
  int compareTo(_SearchTimeVertex other) {
    if(cost < other.cost) return -1;
    if(cost == other.cost) return 0;
    return 1;
  }

}