class PlanModel {
  const PlanModel({
    required this.content,
    required this.title,
    required this.id,
    required this.planId,
  });

  final String content;
  final String title;
  final int id;
  final int planId;

  PlanModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        planId = json['plan_id'],
        title = json['title'],
        content = json['content'];
}
