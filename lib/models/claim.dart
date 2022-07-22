class Claim {
  Claim({
    required this.idCognito,
    required this.title,
    required this.type,
    required this.channel,
    required this.situation,
    required this.image,
    required this.description,
    required this.data
  });

  String idCognito;
  String title;
  String image;
  String type;
  String situation;
  String description;
  String channel;
  String data;
}