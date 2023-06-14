class UserDailyplantdataEntity {
  String? imgUrl;
  List<dynamic>? temp;
  List<dynamic>? humidity;
  List<dynamic>? co2PPM;
  List<dynamic>? waterVolumne;
  List<dynamic>? waterPh;
  List<dynamic>? waterTemp;
  String? dayId;
  UserDailyplantdataEntity(
      {this.co2PPM,
      this.dayId,
      this.humidity,
      this.imgUrl,
      this.temp,
      this.waterPh,
      this.waterTemp,
      this.waterVolumne});
}
