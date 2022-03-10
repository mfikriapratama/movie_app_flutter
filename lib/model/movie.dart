part of 'models.dart';

class Movie extends Equatable {
  Movie({
    this.title,
    this.year,
    this.imdbID,
    this.type,
    this.poster,
  });

  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String poster;

  Movie copyWith({
    String title,
    String year,
    String imdbID,
    String type,
    String poster,
  }) =>
      Movie(
        title: title ?? this.title,
        year: year ?? this.year,
        imdbID: imdbID ?? this.imdbID,
        type: type ?? this.type,
        poster: poster ?? this.poster,
      );

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json["Title"] ?? '',
        year: json["Year"]?.trim() ?? '',
        imdbID: json["imdbID"]?.trim() ?? '',
        type: json["Type"]?.trim() ?? '',
        poster: json["Poster"]?.trim() ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbID,
        "Type": type,
        "Poster": poster,
      };

  @override
  List<Object> get props => [
        title,
        year,
        imdbID,
        type,
        poster,
      ];
}
