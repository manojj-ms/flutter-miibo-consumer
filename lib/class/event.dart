import 'package:intl/intl.dart';

class Event {
  final int id;
  final String date;
  final String description;
  final String name;

  Event({this.id, this.date, this.description, this.name});

  factory Event.fromJson(Map<String, dynamic> json) {
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    return Event(
        id: json['event_id'],
        date: formatter.format(DateTime.parse(json['date'])),
        description: json['description'],
        name: json['name']);
  }
}
