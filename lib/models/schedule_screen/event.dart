class Event{
  final String title;

  Event({required this.title});

  factory Event.fromJson(Map<String, dynamic> json) {

    return Event(
      title: json["title"],
    );
  }

}