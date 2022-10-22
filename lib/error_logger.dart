import 'package:chain_of_responsibility_design_pattern/fake%20data%20provider/log_bloc.dart';
import 'package:chain_of_responsibility_design_pattern/logger_base.dart';
import 'package:chain_of_responsibility_design_pattern/model/log_level.dart';
import 'package:chain_of_responsibility_design_pattern/utility/mail_service.dart';

class ErrorLogger extends LoggerBase {
  /// A mail service to send error logs.
  MailService mailService;

  ErrorLogger(LogBloc logBloc, {super.nextLogger})
      : mailService = MailService(logBloc),
        super(logLevel: LogLevel.error);

  @override
  void log(String message) {
    mailService.sendErrorMail(logLevel, message);
  }
}
