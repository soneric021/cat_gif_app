class Cat {
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
}
