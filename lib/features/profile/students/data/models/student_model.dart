import '../../../../../common/educonnect_model.dart';
import '../../../../../common/functions/educonnect_date_time_helper.dart';
import '../../../../class_data/data/models/class_model.dart';

class StudentModel extends IschoolerModel {
  final DateTime? dateOfBirth;
  final String phoneNumber;
  final String address;
  final String gender;
  final String email;
  final String profilePicture;
  final ClassDataModel classModel;
  final bool paymentStatus;

  const StudentModel({
    required super.id,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.email,
    required super.name,
    required this.profilePicture,
    required this.classModel,
    required this.paymentStatus,
  });

  factory StudentModel.empty() {
    return StudentModel(
      id: '',
      name: '',
      classModel: ClassDataModel.empty(),
      dateOfBirth: null,
      phoneNumber: '',
      address: '',
      gender: '',
      email: '',
      paymentStatus: false,
      profilePicture: '',
    );
  }

  factory StudentModel.dummy() {
    return StudentModel(
      id: '',
      name: 'ziad',
      classModel: ClassDataModel.empty(),
      dateOfBirth: null,
      phoneNumber: '0123786323',
      address: 'a .main b',
      gender: 'male',
      email: 'user@mail.com',
      paymentStatus: false,
      profilePicture: '',
    );
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'] != null ? map['id'].toString() : '',
      name: map['name'] ?? '',
      dateOfBirth: IschoolerDateTimeHelper.fromMapItem(map['date_of_birth']),
      phoneNumber: map['phone_number'] ?? '',
      address: map['address'] ?? '',
      gender: map['gender'] ?? '',
      email: map['email'] ?? '',
      profilePicture: map['profile_picture'] ?? '',
      classModel: ClassDataModel.fromMap(map['class'] ?? {}),
      paymentStatus: map['payment_status'] ?? false,
    );
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Student Name': name,
      'Class': classModel.name,
      'Grade': classModel.grade.name,
    };
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date_of_birth': dateOfBirth?.toIso8601String(),
      'phone_number': phoneNumber,
      'address': address,
      'gender': gender,
      'email': email,
      'profile_picture': profilePicture,
      'class_id': classModel.id,
      'payment_status': paymentStatus,
    };
  }

  @override
  StudentModel copyWith({
    String? id,
    String? name,
    DateTime? dateOfBirth,
    ClassDataModel? classModel,
    String? phoneNumber,
    String? address,
    bool? paymentStatus,
    String? gender,
    String? email,
    String? profilePicture,
  }) {
    return StudentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      classModel: classModel ?? this.classModel,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  @override
  String toString() {
    return 'StudentModel{studentId: $id, name: $name, dateOfBirth: $dateOfBirth, '
        'classId: ${classModel.id}, phoneNumber: $phoneNumber, address: $address, '
        'paymentStatus: $paymentStatus, gender: $gender, email: $email}';
  }

  @override
  List<Object?> get props {
    return [
      id,
      dateOfBirth,
      phoneNumber,
      address,
      gender,
      email,
      name,
      profilePicture,
      classModel,
      paymentStatus,
    ];
  }
}
