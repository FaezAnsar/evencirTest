enum SpaceType {
  residential('residential'),
  commercial('commercial'),
  street('street'),
  garage('garage'),
  driveway('driveway'),
  lot('lot'),
  other('other');

  const SpaceType(this.value);
  factory SpaceType.fromString(String value) {
    return SpaceType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => SpaceType.other,
    );
  }

  final String value;

  String getLabel() {
    switch (this) {
      case residential:
        return 'Residential';
      case commercial:
        return 'Commercial';
      case street:
        return 'Street';
      case garage:
        return 'Garage';
      case driveway:
        return 'Driveway';
      case lot:
        return 'Lot';
      case other:
        return 'Other';
    }
  }
}
