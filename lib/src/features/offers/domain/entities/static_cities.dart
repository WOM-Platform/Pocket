class City {
  final String name;
  final double lat;
  final double long;
  final String imageAsset;

  City(this.name, this.lat, this.long, this.imageAsset);
}

final cities = [
  City(
    'Urbino',
    43.72786928939709,
    12.634797615325452,
    'assets/images/cities/urbino.jpeg',
  ),
  City(
    'Fano',
    43.84399540665834,
    13.017360851071802,
    'assets/images/cities/fano.webp',
  ),
  City(
    'Pesaro',
    43.9111365,
    12.9114045,
    'assets/images/cities/pesaro.jpeg',
  ),
];
