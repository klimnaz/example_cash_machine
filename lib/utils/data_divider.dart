import '../models/nominal.dart';

List<List<Nominal>> divideData(Map<String, int> data) {
  List<Nominal> firstColumnData = [];
  List<Nominal> secondColumnData = [];
  final int tableDivider = data.length ~/ 2;
  if(tableDivider == 0){
    firstColumnData.add(Nominal(data.keys.first, data.values.first));
  } else {
    int idx = 0;
    data.forEach((k, v) {
      if (idx < tableDivider) {
        firstColumnData.add(Nominal(k, v));
      } else {
        secondColumnData.add(Nominal(k, v));
      }
      idx++;
    });
  }

  return [firstColumnData, secondColumnData];
}
