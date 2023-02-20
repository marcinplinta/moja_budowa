class PlanTitleModel {
  const PlanTitleModel({
    required this.title,
    required this.id,
  });

  final String title;
  final int id;

  PlanTitleModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'];
}
