
class DeepLinkModel {
  final String link;
  final Uri uri;

  DeepLinkModel({this.link, this.uri});

  @override
  String toString() {
    return "link: " + link + "\nuri: " + uri.toString();
  }
}
