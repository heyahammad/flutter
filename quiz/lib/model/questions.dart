class Questions {
  const Questions(this.ques, this.options);
  final String ques;
  final List<String> options;

  List<String> shuffledOptions() {
    List<String> listofShuffle = List.of(options);
    listofShuffle.shuffle();

    return listofShuffle;
  }
}
