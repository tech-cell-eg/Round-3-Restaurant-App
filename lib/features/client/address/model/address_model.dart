class Address {
  final String id; // Added ID for better management
  final String label;
  final String fullAddress;
  final String street;
  final String postCode;
  final String apartment;

  Address({
    required this.id,
    required this.label,
    required this.fullAddress,
    required this.street,
    required this.postCode,
    required this.apartment,
  });

  // Helper method to create a copy with updated values
  Address copyWith({
    String? id,
    String? label,
    String? fullAddress,
    String? street,
    String? postCode,
    String? apartment,
  }) {
    return Address(
      id: id ?? this.id,
      label: label ?? this.label,
      fullAddress: fullAddress ?? this.fullAddress,
      street: street ?? this.street,
      postCode: postCode ?? this.postCode,
      apartment: apartment ?? this.apartment,
    );
  }
}