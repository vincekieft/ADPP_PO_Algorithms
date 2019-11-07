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
    _rootNode = _insertInternal(_rootNode, value, value, null);
  }

  int find(int key) => _findInternal(_rootNode, key).value;

  int findMin() => _findMinInternal(_rootNode).value;

  int findMax() => _findMaxInternal(_rootNode).value;

  void remove(int key) => _removeInternal(_findInternal(_rootNode, key));

  // Private methods
  void _removeInternal(Node node){
    if(node.hasAllChildren) return _removeWithAllChildren(node);
    if(node.isLeaf) return _removeLeaf(node);
    _removeWithSingleChild(node);
  }

  void _removeWithAllChildren(Node node){
    Node rightMin = _findMinInternal(node.right);

    // Swamp
    node.key = rightMin.key;
    node.value = rightMin.value;

    if(rightMin.isLeaf) return rightMin.parent.removeChild(node);
    _removeWithSingleChild(rightMin);
  }

  void _removeLeaf(Node node){
    if(node.key == _rootNode?.key){
      _rootNode = null;
      return; }

    node.parent.removeChild(node);
  }

  void _removeWithSingleChild(Node node){
    if(node.left != null) return _removeWithSingleChildLeft(node);
    return _removeWithSingleChildRight(node);
  }

  void _removeWithSingleChildLeft(Node node){
    if(node.key == _rootNode.key) { // Is parent
      _rootNode = node.left;
      node.left.parent = null;
      return;
    }

    node.left.parent = node.parent; // Set parent of left to parent of removed node
    node.parent.overrideChild(node, node.left); // Set child of removed parent to left
  }

  void _removeWithSingleChildRight(Node node){
    if(node.key == _rootNode.key) { // Is parent
      _rootNode = node.right;
      node.right.parent = null;
      return;
    }

    node.right.parent = node.parent; // Set parent of right to parent of removed node
    node.parent.overrideChild(node, node.right); // Set child of removed parent to right
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

  Node _insertInternal(Node root, int value, int key, Node parent){
    if(root == null) return Node(value: value, key: value, parent: parent);
    if(root.key == key) return root..value = value;

    if(key < root.key) { // Go to left
      return root..left = _insertInternal(root.left, value, key, root);
    }

    if(key > root.key) { // Go to right
      return root..right = _insertInternal(root.right, value, key, root);
    }
  }

  @override
  printPrint() => _rootNode?.printPrint();

  // Getters
  Node get root => _rootNode;
}