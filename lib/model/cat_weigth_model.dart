class WeightModel {
    final String imperial;
    final String metric;

    WeightModel({
        required this.imperial,
        required this.metric,
    });

    factory WeightModel.fromJson(Map<String, dynamic> json) => WeightModel(
        imperial:toStringMap(json["imperial"]),
        metric:toStringMap(json["metric"]),
    );

    Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
    };

    static String toStringMap(value) => value.toString();
}