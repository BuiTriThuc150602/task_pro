import 'package:task_your_life/common/exceptions/app_exception.dart';

class LoginFailedException extends AppException {
  LoginFailedException(String message)
      : super(message: message, code: 'LOGIN_FAILED');
}
