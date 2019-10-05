import 'package:PO_Algoritmes/binary_tree/i_printable.dart';

class Node implements IPrintable{

  final int key;
  int value;
  Node left;
  Node right;
  Node parent;

  Node({
    this.key,
    this.value,
    this.left,
    this.right,
    this.parent
  });

  @override
  printPrint() {
    // Print self
    List<String> keys = [];
    if(key != null) keys.add("parent: ${key.toString()}");
    if(left != null) keys.add("left: ${left.key.toString()}");
    if(right != null) keys.add("right: ${right.key.toString()}");

    print(keys.join(' , '));

    // Print children
    left?.printPrint();
    right?.printPrint();
  }

  // Getters
  bool get isLeaf => left == null && right == null;
}