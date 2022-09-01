import 'package:equatable/equatable.dart';

class Error extends Equatable {
  final int? statusCode;
  final String message;
  final dynamic? data;

  const Error({required this.statusCode, required this.message, this.data});

  @override
  List<Object?> get props => [statusCode, message, data];
}
