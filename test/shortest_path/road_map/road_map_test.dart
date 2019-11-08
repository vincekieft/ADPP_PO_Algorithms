import 'package:PO_Algoritmes/shortest_path/pathfinder.dart';
import 'package:PO_Algoritmes/shortest_path/road_map/city.dart';
import 'package:PO_Algoritmes/shortest_path/road_map/road.dart';
import 'package:test/test.dart';

void main(){

  group('Road map', (){ // Test the pathfinder with different data set

    test('Road map pathfinding test', (){
      // Create cities
      City doetinchem = City(identifier: 0, name: 'Doetinchem', neighbours: []);
      City arnhem = City(identifier: 1, name: 'Arnhem', neighbours: []);
      City doesburg = City(identifier: 3, name: 'Doesburg', neighbours: []);

      // Add roads
      doetinchem.neighbours.add(Road(city: arnhem, cost: 20));
      doetinchem.neighbours.add(Road(city: doesburg, cost: 6));

      arnhem.neighbours.add(Road(city: doetinchem, cost: 20));
      arnhem.neighbours.add(Road(city: doesburg, cost: 10));

      doesburg.neighbours.add(Road(city: doetinchem, cost: 6));
      doesburg.neighbours.add(Road(city: arnhem, cost: 10));

      List<City> path = Pathfinder().shortestPath<City>(doetinchem, arnhem);

      expect(path, [doetinchem, doesburg, arnhem]);

    });

  });

}