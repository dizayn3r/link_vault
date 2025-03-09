class BackupModel {
  final String fileName;
  final String filePath; // Add this field
  final DateTime createdDate;
  final int fileSize;

  BackupModel({
    required this.fileName,
    required this.filePath, // Add this field
    required this.createdDate,
    required this.fileSize,
  });

  // Convert BackupModel to a map (for serialization)
  Map<String, dynamic> toMap() {
    return {
      'fileName': fileName,
      'filePath': filePath, // Add this field
      'createdDate': createdDate.toIso8601String(),
      'fileSize': fileSize,
    };
  }

  // Create a BackupModel from a map (for deserialization)
  factory BackupModel.fromMap(Map<String, dynamic> map) {
    return BackupModel(
      fileName: map['fileName'],
      filePath: map['filePath'], // Add this field
      createdDate: DateTime.parse(map['createdDate']),
      fileSize: map['fileSize'],
    );
  }
}
