import 'dart:async';
import '../../utils/data_divider.dart';
import '../../models/nominal.dart';

class BankRepository {
  final _controller = StreamController<List<List<Nominal>>>();
  Map<String, int> _limits = {
    '5000': 5,
    '2000': 10,
    '1000': 15,
    '500': 20,
    '200': 25,
    '100': 30
  };

  Stream<List<List<Nominal>>> get bankData => _controller.stream;

  void refreshLimits() {
    _limits = {
      '5000': 5,
      '2000': 10,
      '1000': 15,
      '500': 20,
      '200': 25,
      '100': 30
    };
    _controller.add(divideData(_limits));
  }

  Map<String, int> countMoney(int sum) {
    Map<String, int> outputMoney = Map<String, int>();

    _limits.forEach((key, value) {
      if(value > 0){
        final total = sum ~/ int.parse(key);
        if (total >= 1) {

          if(total <= value){
            sum = sum - total * int.parse(key);
            outputMoney[key] = total;
          }
          else {
            sum = sum - value * int.parse(key);
            outputMoney[key] = value;
          }
        }
      }
    });

    if (outputMoney.length == 0 || sum != 0) return null;

    _limits.forEach((key, value) {
      if (outputMoney.containsKey(key)) {
        _limits[key] -= outputMoney[key];
      }
    });

    _controller.add(divideData(_limits));
    return outputMoney;
  }

  void dispose() => _controller.close();
}
