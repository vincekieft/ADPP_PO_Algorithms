import 'package:PO_Algoritmes/binary_tree/binary_tree.dart';
import 'package:test/test.dart';

void main(){

  group('Binary tree test', (){

    test('Find value in tree', (){
      BinaryTree tree = BinaryTree();
      tree.insert(5);
      tree.insert(3);
      tree.insert(7);
      tree.insert(10);
      tree.insert(23);
      tree.insert(7);

      expect(tree.find(23), 23);
    });

    test('Find missing value', (){
      BinaryTree tree = BinaryTree();
      tree.insert(5);
      tree.insert(3);
      tree.insert(7);
      tree.insert(10);
      tree.insert(23);
      tree.insert(7);

      expect(() => tree.find(100), throwsException);
    });

    test('Search through empty tree', (){
      BinaryTree tree = BinaryTree();
      expect(() => tree.find(100), throwsException);
    });

    test('Find min', (){
      BinaryTree tree = BinaryTree();
      tree.insert(5);
      tree.insert(3);
      tree.insert(7);
      tree.insert(10);
      tree.insert(23);
      tree.insert(7);
      tree.insert(1);

      expect(tree.findMin(), 1);
    });

    test('Find min in empty tree', (){
      BinaryTree tree = BinaryTree();
      expect(() => tree.findMin(), throwsException);
    });

    test('Find min in tree with one node only', (){
      BinaryTree tree = BinaryTree();
      tree.insert(5);
      expect(tree.findMin(), 5);
    });

    test('Find max', (){
      BinaryTree tree = BinaryTree();
      tree.insert(7);
      tree.insert(9);
      tree.insert(342);
      tree.insert(45);
      tree.insert(12);
      tree.insert(1);
      tree.insert(8);

      expect(tree.findMax(), 342);
    });

    test('Find max in empty tree', (){
      BinaryTree tree = BinaryTree();
      expect(() => tree.findMax(), throwsException);
    });

    test('Find max in tree with one node only', (){
      BinaryTree tree = BinaryTree();
      tree.insert(7);
      expect(tree.findMax(), 7);
    });

  });

}