/// EV data fields

class EVCars {
  final double batterySizekWh;
  final String carId;
  final double chargerRatingkW;
  final double chargerTimeHrs;
  final String company;
  final double drivingRangeKm;
  final String model;
  final String type;

  EVCars(
      this.batterySizekWh,
      this.carId,
      this.chargerRatingkW,
      this.chargerTimeHrs,
      this.company,
      this.drivingRangeKm,
      this.model,
      this.type);
}
