import 'dart:io';

class FirmEntity {
  final String firmId;
  final String firmName;
  final String firmAddress;
  final String firmGstNumber;
  final String firmPhoneNumber;
  final String firmEmail;
  final String firmPan;
  final String userId;
  final File? firmLogo;
  FirmEntity({
    required this.firmId,
    required this.firmName,
    required this.firmAddress,
    required this.firmGstNumber,
    required this.userId,
    required this.firmPhoneNumber,
    required this.firmEmail,
    required this.firmPan,
    required this.firmLogo,
  });
}
