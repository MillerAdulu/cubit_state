
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stuff.freezed.dart';


@freezed
abstract class Stuff with _$Stuff {
  factory Stuff() = _Stuff;
	
}
