class UserSinglePlantEntity {
  String? plantName;
  String? plantId;
  String? plantCat;
  String? plantationDate;
  String? nutrientsList;
  String? imgUrl;
  String? status;

  UserSinglePlantEntity(
      {this.imgUrl,
      this.nutrientsList,
      this.plantCat,
      this.plantId,
      this.plantName,
      this.plantationDate,
      this.status});
}
