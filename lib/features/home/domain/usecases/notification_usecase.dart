import 'package:student_project1/features/home/domain/entities/notifincatins_user.dart';
import '../repositories/home_repository.dart';

class NotifincationUsecase {
  final HomeRepository repository;

  NotifincationUsecase(this.repository);

  Future<NotifincationUser> call(NotifincationUser notifincationuser) {
    return  repository.notifincation(notifincationuser);
  }
}