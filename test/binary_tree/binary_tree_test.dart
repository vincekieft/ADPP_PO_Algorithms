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

    test('Remove left leaf', (){
      BinaryTree tree = BinaryTree();
      tree.insert(6);
      tree.insert(5);

      expect(tree.find(5), 5);

      tree.remove(5);

      expect(() => tree.find(5), throwsException);
      expect(tree.root.key, 6);
      expect(tree.root.left, null);
    });

    test('Remove node with single child', (){
      BinaryTree tree = BinaryTree();
      tree.insert(6);
      tree.insert(5);
      tree.insert(4);

      tree.remove(5);

      expect(() => tree.find(5), throwsException);
      expect(tree.findMin(), 4);
      expect(tree.root.left.key, 4);
    });

    test('Remove root with single child', (){
      BinaryTree tree = BinaryTree();
      tree.insert(6);
      tree.insert(5);

      tree.remove(6);

      expect(tree.findMax(), 5);
    });

    test('Remove root with multiple childs', (){
      BinaryTree tree = BinaryTree();
      tree.insert(10);
      tree.insert(11);
      tree.insert(9);

      tree.remove(10);

      expect(tree.root.key, 11);
      expect(() => tree.find(10), throwsException);

    });

    test('Remove node with multiple childs', (){
      BinaryTree tree = BinaryTree();
      tree.insert(6);
      tree.insert(8);
      tree.insert(10);
      tree.insert(7);

      tree.remove(8);

      expect(tree.root.right.key, 10);
      expect(() => tree.find(8), throwsException);
    });

    test('Remove root only leaft', (){
      BinaryTree tree = BinaryTree();

      tree.insert(10);
      tree.remove(10);

      expect(tree.root, null);
    });

    test('Remove unknown node', (){
      BinaryTree tree = BinaryTree();
      expect(() => tree.remove(10), throwsException);
    });

  });

}