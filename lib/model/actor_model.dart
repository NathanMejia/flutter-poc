import 'dart:convert';

List<ActorModel> actorModelFromJson(String str) => List<ActorModel>.from(json.decode(str).map((x) => ActorModel.fromJson(x)));

String actorModelToJson(List<ActorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActorModel {
    ActorModel({
        required this.charId,
        required this.name,
        required this.img,
        required this.nickname,
    });

    int charId;
    String name;
    String img;
    String nickname;

    factory ActorModel.fromJson(Map<String, dynamic> json) => ActorModel(
        charId: json["char_id"],
        name: json["name"],
        img: json["img"],
        nickname: json["nickname"],
    );

    Map<String, dynamic> toJson() => {
        "char_id": charId,
        "name": name,
        "img": img,
        "nickname": nickname,
    };
}



