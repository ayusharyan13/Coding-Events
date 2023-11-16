class EventsModel {
  final Content? content;
  final bool? status;

  EventsModel({
    this.content,
    this.status,
  });

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
      content: json['content'] != null ? Content.fromJson(json['content']) : null,
      status: json['status'],
    );
  }
}

class Content {
  final List<Data>? data;
  final Meta? meta;

  Content({
    this.data,
    this.meta,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      data: json['data'] != null ? List<Data>.from(json['data'].map((x) => Data.fromJson(x))) : null,
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
    );
  }
}

class Meta {
  final int? total;

  Meta({
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'],
    );
  }
}

class Data {
  final int? id;
  final String? title;
  final String? description;
  final String? bannerImage;
  final String? dateTime;
  final String? organiserName;
  final String? organiserIcon;
  final String? venueName;
  final String? venueCity;
  final String? venueCountry;

  Data({
    this.id,
    this.title,
    this.description,
    this.bannerImage,
    this.dateTime,
    this.organiserName,
    this.organiserIcon,
    this.venueName,
    this.venueCity,
    this.venueCountry,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      bannerImage: json['banner_image'],
      dateTime: json['date_time'],
      organiserName: json['organiser_name'],
      organiserIcon: json['organiser_icon'],
      venueName: json['venue_name'],
      venueCity: json['venue_city'],
      venueCountry: json['venue_country'],
    );
  }
}
