class Comand {
  String? title;
  String? description;
  String? image;
  String? ran;
  String? sndid;
  bool frstq;
  bool scndq;
  bool thrdq;

  Comand(
      {required this.title,
      required this.description,
      required this.image,
      required this.frstq,
      required this.scndq,
      required this.thrdq,
      required this.ran,
      required this.sndid});

  changef() {
    frstq = !frstq;
  }

  changes() {
    scndq = !scndq;
  }

  changet() {
    thrdq = !thrdq;
  }
}
