extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() =>
      replaceAll(RegExp(' +'), ' ').split(' ').map((String str) => str.toCapitalized()).join(' ');

  String lastChars(int n) => substring(length - n);

  String returnToLine() => replaceAll('.', '. \n');

}

String getFirstWords(String sentence, int wordCounts) {
  return sentence.split(' ').sublist(0, wordCounts).join(' ');
}
