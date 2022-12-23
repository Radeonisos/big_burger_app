import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_model_api.freezed.dart';
part 'menu_model_api.g.dart';

@freezed
class MenuModelAPI with _$MenuModelAPI {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory MenuModelAPI({
    required String ref,
    required String title,
    required int price,
    String? description,
    String? thumbnail,
  }) = _MenuModelAPI;

  factory MenuModelAPI.fromJson(Map<String, dynamic> json) =>
      _$MenuModelAPIFromJson(json);
}
