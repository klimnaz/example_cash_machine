part of 'cash_machine_bloc.dart';

abstract class CashMachineState extends Equatable {
  const CashMachineState();
}

class CashMachineUninitialized extends CashMachineState {
  @override
  List<Object> get props => [];
}

class CashMachineOutput extends CashMachineState {
  final List<List<Nominal>> outputMoney;

  CashMachineOutput(this.outputMoney);

  @override
  List<Object> get props => [outputMoney];

  @override
  String toString() =>
      'CashMachineOutput { outputMoney: $outputMoney }';
}

class CashMachineLoading extends CashMachineState {
  @override
  List<Object> get props => [];
}

class CashMachineError extends CashMachineState {
  final String error;

  CashMachineError(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'CashMachineError { error: $error }';
}
