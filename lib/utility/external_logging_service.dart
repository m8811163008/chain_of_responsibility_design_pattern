import 'package:chain_of_responsibility_design_pattern/fake%20data%20provider/log_bloc.dart';
import 'package:chain_of_responsibility_design_pattern/model/log_level.dart';
import 'package:chain_of_responsibility_design_pattern/model/log_message.dart';

/// Represents an external logging service.
///
/// Instead of sending the log message to some kind of 3rd party
/// logging service (which, in fact, could be called in the
/// [logMessage()] method), it just logs the message to UI
/// through the [LogBloc]
class ExternalLoggingService {
  final LogBloc logBloc;
  ExternalLoggingService(this.logBloc);

  void logMessage(LogLevel logLevel, String message) {
    final logMessage = LogMessage(logLevel: logLevel, message: message);
    logBloc.log(logMessage);
  }
}
