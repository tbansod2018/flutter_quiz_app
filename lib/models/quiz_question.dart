class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAns() {
    final shuffeldList = List.of(answers);
    shuffeldList.shuffle();
    return shuffeldList;
  }
}
