BookModel bookModelFromJson(var data) => BookModel.fromJson(data);

class BookModel {
  int _totalItems;
  List<dynamic> _items;

  int get totalItems => _totalItems;

  List<Items> get items => _items;

  BookModel(this._totalItems, this._items);

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
        json['totalItems'] == null ? null : json['totalItems'],
        json["items"] == null
            ? null
            : List<Items>.from(json["items"].map((x) => Items.fromJson(x))));
  }
}

class Items {
  VolumeInfo _volumeInfo;
  String _id;

  VolumeInfo get volumeInfo => _volumeInfo;

  String get id => _id;

  Items(this._volumeInfo, this._id);

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
        VolumeInfo.fromJson(json['volumeInfo'] == null ? null : json['volumeInfo'],),
        json['id'] == null ? null : json['id']
    );
  }
}

class VolumeInfo {
  String _title;
  String _description;
  dynamic _averageRating;
  List<dynamic> _authors;
  ImageLinks _imageLinks;

  String get title => _title;

  dynamic get averageRating => _averageRating;

  ImageLinks get imageLinks => _imageLinks;

  String get description => _description;

  List<String> get authors => _authors;

  VolumeInfo(
    this._title,
    this._description,
    this._authors,
    this._imageLinks,
    this._averageRating
  );

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
      json['title'] == null ? null : json['title'],
      json['description'] == null ? null : json['description'],
      json['authors'] == null ? null : json['authors'].cast<String>(),
      json['imageLinks'] == null ? null : ImageLinks.fromJson(json['imageLinks']),
      json['averageRating'] == null ? null : json['averageRating']
    );
  }
}

class ImageLinks {
  String _thumbnail;

  String get thumbnail => _thumbnail;

  ImageLinks(this._thumbnail);

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(json['thumbnail'] == null ? null : json['thumbnail']);
  }
}
