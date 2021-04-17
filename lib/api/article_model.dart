class Article {
  String? id;
  bool? featured;
  String? title;
  String? url;
  String? imageUrl;
  String? newsSite;
  String? summary;
  String? publishedAt;
  List<Launches?>? launches;
  List<Events?>? events;

  Article(
      {this.id,
      this.featured,
      this.title,
      this.url,
      this.imageUrl,
      this.newsSite,
      this.summary,
      this.publishedAt,
      this.launches,
      this.events});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    featured = json['featured'];
    title = json['title'];
    url = json['url'];
    imageUrl = json['imageUrl'];
    newsSite = json['newsSite'];
    summary = json['summary'];
    publishedAt = json['publishedAt'];
    if (json['launches'] != null) {
      launches =  <Launches>[];
      json['launches']?.forEach((v) {
        launches?.add( Launches.fromJson(v));
      });
    }
    if (json['events'] != null) {
      events =  <Events>[];
      json['events'].forEach((v) {
        events?.add( Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['featured'] = this.featured;
    data['title'] = this.title;
    data['url'] = this.url;
    data['imageUrl'] = this.imageUrl;
    data['newsSite'] = this.newsSite;
    data['summary'] = this.summary;
    data['publishedAt'] = this.publishedAt;
    if (this.launches != null) {
      data['launches'] = this.launches?.map((v) => v?.toJson()).toList();
    }
    if (this.events != null) {
      data['events'] = this.events?.map((v) => v?.toJson()).toList();
    }
    return data;
  }
}

class Launches {
  String? id;
  String? provider;

  Launches({this.id, this.provider});

  Launches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['provider'] = this.provider;
    return data;
  }
}

class Events {
  String? id;
  String? provider;

  Events({this.id, this.provider});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['provider'] = this.provider;
    return data;
  }
}