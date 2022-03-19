import 'package:equatable/equatable.dart';

class Cat extends Equatable {
  String? id;
  String? createdAt;
  List<String>? tags;
  String? url;

  Cat({this.id, this.createdAt, this.tags, this.url});

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
        id: json['id'] as String?,
        createdAt: json['created_at'] as String?,
        tags: json['tags'].cast<String>() as List<String>?,
        url: json['url'] as String?);
  }

  Cat copyWith(String? id, String? createdAt, List<String>? tags, String? url) {
    return Cat(
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        tags: tags ?? this.tags,
        url: url ?? this.url);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
