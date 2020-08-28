part of 'cash_machine_bloc.dart';

abstract class CashMachineEvent extends Equatable {
  const CashMachineEvent();
}

class Refresh extends CashMachineEvent {
  @override
  List<Object> get props => [];
}

class GetMoney extends CashMachineEvent {
  final int sum;

  GetMoney(this.sum);

  @override
  List<Object> get props => [sum];

  @override
  String toString() => 'GetMoney { sum: $sum }';
}
