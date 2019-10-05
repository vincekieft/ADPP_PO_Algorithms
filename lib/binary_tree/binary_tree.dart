import 'package:PO_Algoritmes/binary_tree/i_printable.dart';
import 'package:PO_Algoritmes/binary_tree/node.dart';

class BinaryTree implements IPrintable{

  Node _rootNode;

  BinaryTree({
    Node rootNode
  }) :
        this._rootNode = rootNode;

  // Public methods
  void insert(int value) {
    _rootNode = _insertInternal(_rootNode, value, value);
  }

  int find(int key) => _findInternal(_rootNode, key).value;

  int findMin() => _findMinInternal(_rootNode).value;

  int findMax() => _findMaxInternal(_rootNode).value;

  void remove(int key) => _removeInternal(_findInternal(_rootNode, key));

  // Private methods
  Node _removeInternal(Node node){
    if(node.isLeaf) return null;
  }

  Node _findMinInternal(Node root){
    if(root == null) throw Exception("Can not search through null root node");
    if(root.left == null) return root; // Found minimal
    return _findMinInternal(root.left);
  }

  Node _findMaxInternal(Node root){
    if(root == null) throw Exception("Can not search through null root node");
    if(root.right == null) return root; // Found maximal
    return _findMaxInternal(root.right);
  }

  Node _findInternal(Node root, int key){
    if(root == null) throw Exception("Could not find key: ${key}");
    if(root.key == key) return root;

    if(key < root.key)
      return _findInternal(root.left, key);

    if(key > root.key)
      return _findInternal(root.right, key);
  }

  Node _insertInternal(Node root, int value, int key){
    if(root == null) return Node(value: value, key: value, parent: root);
    if(root.key == key) return root..value = value;

    if(key < root.key) { // Go to left
      return root..left = _insertInternal(root.left, value, key);
    }

    if(key > root.key) { // Go to right
      return root..right = _insertInternal(root.right, value, key);
    }
  }

  @override
  printPrint() => _rootNode?.printPrint();

}