class Images {
  Images({
    this.id,
    this.image,
    this.imageableId,
    this.imageableType,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Images.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    imageableId = json['imageable_id'];
    imageableType = json['imageable_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  dynamic id;
  dynamic image;
  dynamic imageableId;
  dynamic imageableType;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['imageable_id'] = imageableId;
    map['imageable_type'] = imageableType;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }
}
