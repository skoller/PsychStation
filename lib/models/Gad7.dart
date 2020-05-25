
class Gad7 {
  final String id;
  final List<String> questions = const [
    "Feeling nervous, anxious, or on edge",
    "Not being able to stop or control worrying",
    "Worrying too much about different things",
    "Trouble relaxing",
    "Being so restless that it's hard to sit still",
    "Becoming easily annoyed or irritable",
    "Feeling afraid as if something awful might happen"
  ];
  List<int> questionScores = [0, 0, 0, 0, 0, 0, 0];
  int totalScore = 0;
  DateTime date = DateTime.now();
  final String patientID;
  final String providerID;

  Gad7(
      {this.id,
      this.questionScores,
      this.totalScore,
      this.date,
      this.patientID,
      this.providerID});
}
