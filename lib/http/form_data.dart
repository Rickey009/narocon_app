import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FormData {
  String param001;
  String param002;
  String param003;
  String param004;
  double param005;
  bool param006;
  bool param007;

  FormData({
    this.param001,
    this.param002,
    this.param003,
    this.param004,
    this.param005,
    this.param006,
    this.param007,
  });

  factory FormData.fromJson(Map<String, dynamic> json) =>
      _$FormDataFromJson(json);

  Map<String, dynamic> toJson() => _$FormDataToJson(this);
}


FormData _$FormDataFromJson(Map<String, dynamic> json) {
  return FormData(
    param001: json['param001'] as String,
    param002: json['param002'] as String,
    param003: json['param003'] as String,
    param004: json['param004'] as String,
    param005: json['param005'] as double,
    param006: json['param006'] as bool,
    param007: json['param007'] as bool,

  );
}

Map<String, dynamic> _$FormDataToJson(FormData instance) => <String, dynamic>{
  'param001': instance.param001,
  'param002': instance.param002,
  'param003': instance.param003,
  'param004': instance.param004,
  'param005': instance.param005,
  'param006': instance.param006,
  'param007': instance.param007,
};
