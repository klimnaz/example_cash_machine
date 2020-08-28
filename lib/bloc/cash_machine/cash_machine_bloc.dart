import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../configs/consts.dart';
import '../../repositories/bank_repository/bank_repository.dart';
import '../../models/nominal.dart';
import '../../utils/data_divider.dart';
import 'package:meta/meta.dart';

part 'cash_machine_event.dart';
part 'cash_machine_state.dart';

class CashMachineBloc extends Bloc<CashMachineEvent, CashMachineState> {
  final BankRepository bankRepository;
  CashMachineBloc({@required this.bankRepository})
      : super(CashMachineUninitialized());

  @override
  Stream<CashMachineState> mapEventToState(
    CashMachineEvent event,
  ) async* {
    if (event is GetMoney) {
      yield CashMachineLoading();
      final result = bankRepository.countMoney(event.sum);
      if (result != null) {
        yield CashMachineOutput(divideData(result));
      } else
        yield CashMachineError(defaultError);
    }

    //макет получения данных
    if (event is Refresh) {
      bankRepository.refreshLimits();
      yield CashMachineOutput(null);
    }
  }
}
