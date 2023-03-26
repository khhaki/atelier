class Client {
  String? name;
  String? phone;
  DateTime? date;
  String? command;
  Client();
  Map<String, dynamic> toJson() =>
      {'name': name, 'phone': phone, 'date': date, 'command': command};
  Client.fromSnapshot(snapshot)
      : name = snapshot.data()['name'],
        phone = snapshot.data()['phone'],
        date = snapshot.data()['date'],
        command = snapshot.data()['command'];
}
