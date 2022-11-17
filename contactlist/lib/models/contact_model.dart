class ContactModel {
  final String name;
  final String email;
  final String phoneNumber;
  final String website;
  final String address;
  final bool favorite;

  ContactModel(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.website,
      required this.address,
      this.favorite = false});
}
