class GridGraphUtil {

  static int coordinateToIndex(int x, int y, int xCount){
    return (y * xCount) + x;
  }

  static List<int> indexToCoordinate(int index, int xCount){
    int y = index~/xCount;
    return [
      index - (xCount * y),
      y
    ];
  }

}