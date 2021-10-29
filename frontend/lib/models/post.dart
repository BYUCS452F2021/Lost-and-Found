class Post {
  final String id;
  final String founderId;
  final String name;
  final String type;
  final String photo;
  final bool isRequested;
  final String color;
  final String description;
  final String foundDate;
  final String reportedDate;

  Post(this.id, this.founderId, this.name, this.type, this.photo, this.isRequested, this.color, this.description, this.foundDate, this.reportedDate);
  
  Post.fromJson(Map<String, dynamic> json) 
    : id = json['object_id'].toString(),
      founderId = json['founder_id'],
      name = json['object_name'],
      type = json['type'],
      photo = json['photo'],
      isRequested = json['is_requested'] == 1 ? true : false,
      color = json['color'],
      description = json['description'],
      foundDate = json['found_date'],
      reportedDate = json['reported_date'];

}
