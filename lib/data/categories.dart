import 'music.dart';

//List<String> categories = ["Top Songs", "Completely Underground", "New Hip-Hop/R&B", "New Electronic", "Classics", "Old Beats", "Never Gets Old"]; //original categories
List<String> categories = ["Summer 2020", "April 2020", "Late 2019"];
//List<String> genres = ["chill", "rap", "electronic", "instrumental", "ballad", "classic", "indie pop", "none", "experimental", "r&b", "energetic", "sampling"]; //not needed (yet?)
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

List<Music> getOtherAtIndex(int index) {
  List<Music> l = getAtIndex(index);
  List<Music> rl = new List();
  for (int i = 0; i < l.length; i++) { //TODO change to 5 if wanted
    if (!l[i].getIsFeatured) {
      rl.add(l[i]);
    }
  }
  return rl;
}
