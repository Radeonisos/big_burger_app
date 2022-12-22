// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuModelAPI _$$_MenuModelAPIFromJson(Map<String, dynamic> json) =>
    _$_MenuModelAPI(
      ref: json['ref'] as String,
      title: json['title'] as String,
      price: json['price'] as int,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$$_MenuModelAPIToJson(_$_MenuModelAPI instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
    };
