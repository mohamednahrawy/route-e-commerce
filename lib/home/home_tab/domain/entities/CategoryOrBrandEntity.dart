class CategoryOrBrandResponseEntity {
  int? results;
  List<CategoryOrBrandEntity>? data;

  CategoryOrBrandResponseEntity({
    this.results,
    this.data,
  });
}

class CategoryOrBrandEntity {
  String? id;
  String? name;
  String? slug;
  String? image;

  CategoryOrBrandEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });
}
