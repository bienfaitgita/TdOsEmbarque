class Result {
  String message;
  bool status;
  Result({
    this.message,
    this.status,
  });
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    message: json['message'] as String,
    status: json['status'] as bool,
  );
}
