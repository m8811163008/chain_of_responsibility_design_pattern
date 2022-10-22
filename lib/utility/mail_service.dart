import 'package:chain_of_responsibility_design_pattern/fake%20data%20provider/log_bloc.dart';
import 'package:chain_of_responsibility_design_pattern/model/log_level.dart';
import 'package:chain_of_responsibility_design_pattern/model/log_message.dart';

/// Represents the actual mail logging service.
///
/// Instead of sending the log message as an email to the user, it
/// just logs the message to UI through [LogBloc].
class MailService {
  LogBloc logBloc;
  MailService(this.logBloc);

  void sendErrorMail(LogLevel logLevel, String message) {
    final logMessage = LogMessage(logLevel: logLevel, message: message);
    // Send error main
    // Log message
    logBloc.log(logMessage);
  }
}
