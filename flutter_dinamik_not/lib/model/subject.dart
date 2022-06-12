class Subject{
  final String name;
  final double letter;
  final int credit;

  Subject({required this.name, required this.letter, required this.credit});

  @override
  String toString() {
    return "$name $letter $credit";
  }
}