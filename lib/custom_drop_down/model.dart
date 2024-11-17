class TypeOfOrganization {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;

  TypeOfOrganization({
     this.id,
     this.name,
     this.email,
     this.phone,
    this.address = '',
  });

  @override
  String toString() {
    return 'TypeOfOrganization{id: $id, name: $name, email: $email, phone: $phone, address: $address}';
  }
}
