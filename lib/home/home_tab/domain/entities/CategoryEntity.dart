class CategoryResponseEntity {
  int? results;
  List<CategoryEntity>? data;

  CategoryResponseEntity({
    this.results,
    this.data,
  });
}

class CategoryEntity {
  String? id;
  String? name;
  String? slug;
  String? image;

  CategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });
}
