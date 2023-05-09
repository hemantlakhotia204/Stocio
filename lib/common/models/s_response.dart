class SResponse {
  final String msg;
  final dynamic data;

  SResponse({required this.msg, this.data});

  factory SResponse.fromJson(Map<String, dynamic> json) => SResponse(msg: json['msg'], data: json['data']);

  Map<String, dynamic> toJson() => {'msg': msg, 'data': data};
}
