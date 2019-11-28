// Challenge
// Find the best move given the state of Towers of Hanoi board

List<List<List<int>>> possibleMoves(List<List<int>> input) {
  List<List<List<int>>> output = [];
  for (int i = 0; i < input.length; i++) {
    for (int j = 0; j < input.length; j++) {
      if (i != j) {
        if (canBeStacked(input[i], input[j])) {
          input[j].insert(0, input[i].removeAt(0));

          addToOutputList(output, input);

          input[i].insert(0, input[j].removeAt(0));
        }
      }
    }
  }
//  print(output);
  return output;
}

bool goodMove(List<List<int>> input, int i, int j) {
  input[i].insert(0, input[j].removeAt(0));
  int beforeMove = 0;
  input.forEach((tower) {
    if (tower.isEmpty) {
      beforeMove++;
    }
  });
  int afterMove = 0;
  input[j].insert(0, input[i].removeAt(0));
  input.forEach((tower) {
    if (tower.isEmpty) {
      afterMove++;
    }
  });

  return afterMove > beforeMove;
}

int totalNumberOfDisks(List<List<int>> input) {
  int diskCount = 0;
  input.forEach((tower) {
    diskCount += tower.length;
  });
  return diskCount;
}
List<List<int>> checkWinInOneMove(List<List<int>> input){
  List<List<List<int>>> allMoves = possibleMoves(input);
  for(var move in allMoves){
    if(isFinalMove(move)){
      return move;
    }
  }
  return null;
}
bool isFinalMove(List<List<int>> input) => input[0].isEmpty && input[1].isEmpty;
checkWinInTwoMoves(List<List<int>> input){
  List<List<List<int>>> allMoves = possibleMoves(input);

  for(var move in allMoves){
    if(checkWinInOneMove(move)!=null){
      return move;
    }
  }
return null;
}




void addToOutputList(List<List<List<int>>> output, List<List<int>> source) {
  List<List<int>> temp = [];
  for (List outer in source) {
    List<int> innerList = [];
    for (int i = 0; i < outer.length; i++) {
      innerList.add(outer[i]);
    }
    temp.add(innerList);
  }
  output.add(temp);
}

bool canBeStacked(List<int> tower1, List<int> tower2) =>
    (tower1.isNotEmpty && (tower2.isEmpty || tower1[0] < tower2[0]));

main() {
  print(checkWinInTwoMoves([
    [1,2,3,4],
    [],
    []
  ]));
}
