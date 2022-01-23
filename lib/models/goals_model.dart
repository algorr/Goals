class Goals {
  int? id;
  String? title;
  double? progress;
  String? text;

  Goals(this.id, this.title, this.progress, this.text);

  Goals.fromJson(Map json) {
    id = json["id"];
    title = json["title"];
    progress = json["progress"];
    text = json["text"];
  }

  Map toJson() {
    return {
      "id": id,
      "title": title,
      "progress": progress,
      "text": text,
    };
  }
}
