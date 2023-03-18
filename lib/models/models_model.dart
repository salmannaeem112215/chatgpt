class ModelsModel {
  String id;
  int created;
  String root;

  ModelsModel({
    required this.id,
    required this.created,
    required this.root,
  });

  ModelsModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        created = json['created'],
        root = json['root'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created'] = created;
    data['root'] = root;
    return data;
  }

  static List<ModelsModel> modelsFromSnapshot(List modelSnapshot) {
    return modelSnapshot.map((data) => ModelsModel.fromJson(data)).toList();
  }
}
