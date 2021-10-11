import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class RegionsZipCodesEvent extends Equatable {
  const RegionsZipCodesEvent();
}

class FetchRegionsZipCodes extends RegionsZipCodesEvent {
  final String typeName;

  const FetchRegionsZipCodes({@required this.typeName});

  @override
  List<Object> get props => [];
}
