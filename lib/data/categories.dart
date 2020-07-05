import 'music.dart';

List<String> categories = ["New Finds", "Top Songs", "Completely Underground", "New Hip-Hop/R&B", "New Electronic", "Classics", "Old Beats", "Never Gets Old"];
List<String> genres = ["chill", "rap", "electronic", "instrumental", "ballad", "classic", "indie", "none"];
List<List<Music>> sortedCategories = new List(categories.length);

void populateAll() {
  for (int i = 0; i < sortedCategories.length; i++) {
    sortedCategories[i] = [];
  }
  for (int i = 0; i < songs.length; i++) {
    for (int j = 0; j < categories.length; j++) {
      if (songs[i].getCategory == categories[j]) {
        sortedCategories[j].add(songs[i]);
      }
    }
  }
}

List<Music> getAtIndex(int index) {
  return sortedCategories[index];
}

List<Music> featured(List<Music> list) {
  List<Music> feat = new List();
  for (int i = 0; i < list.length; i++) {
    var temp = list[i];
    if (temp.getIsFeatured) {
      feat.add(temp);
    }
  }
  return feat;
}
