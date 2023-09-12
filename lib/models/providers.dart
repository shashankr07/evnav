import 'dart:ffi';

/// Provider data fields

class Provider {
  final int contactNo;
  final double latitude;
  final double longitude;
  final String chargerTyoe;
  final Float rating;
  Provider(this.contactNo, this.latitude, this.longitude, this.chargerTyoe,
      this.rating);
}
