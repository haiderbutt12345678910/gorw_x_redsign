import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/dailyplantdata_entity.dart';

class UserdailyplantModel extends UserDailyplantdataEntity {
  UserdailyplantModel(
      {String? imgUrl,
      List<dynamic>? temp,
      List<dynamic>? humidity,
      List<dynamic>? co2PPM,
      List<dynamic>? waterVolumne,
      List<dynamic>? waterPh,
      List<dynamic>? waterTemp,
      String? dayId})
      : super(
            dayId: dayId,
            imgUrl: imgUrl,
            temp: temp,
            humidity: humidity,
            co2PPM: co2PPM,
            waterPh: waterPh,
            waterTemp: waterTemp,
            waterVolumne: waterVolumne);

  factory UserdailyplantModel.fromJson(Map<String, dynamic> map) {
    return UserdailyplantModel(
        dayId: map['dayId'],
        imgUrl: map['imgUrl'],
        temp: map['temp'],
        humidity: map['humidity'],
        co2PPM: map['co2PPM'],
        waterPh: map['waterPh'],
        waterTemp: map['waterTemp'],
        waterVolumne: map['waterVolumne']);
  }

  Map<String, dynamic> toJson() {
    return {
      'dayId': dayId,
      'imgUrl': imgUrl,
      'temp': temp?.map((item) => item.toJson()).toList(),
      'humidity': humidity?.map((item) => item.toJson()).toList(),
      'co2PPM': co2PPM?.map((item) => item.toJson()).toList(),
      'waterPh': co2PPM?.map((item) => item.toJson()).toList(),
      'waterTemp': waterTemp?.map((item) => item.toJson()).toList(),
      'waterVolumne': waterVolumne?.map((item) => item.toJson()).toList(),
    };
  }
}
