class Song {
  String title;
  String subTitle;
  String imageURL;
  String audioURL;
  bool isPlaying = false;

  @override
  String toString() {
    return 'Song{title: $title, subTitle: $subTitle, imageURL: $imageURL, audioURL: $audioURL}';
  }
}
