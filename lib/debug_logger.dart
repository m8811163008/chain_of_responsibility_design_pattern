import 'package:chain_of_responsibility_design_pattern/fake%20data%20provider/log_bloc.dart';
import 'package:chain_of_responsibility_design_pattern/logger_base.dart';
import 'package:chain_of_responsibility_design_pattern/model/log_level.dart';
import 'package:chain_of_responsibility_design_pattern/model/log_message.dart';

/// Sets the log level to [LogLevel.debug] and log the message to
/// UI through the [LogBloc].
/// A specific implementation of the LoggerBase.
class DebugLogger extends LoggerBase {
  final LogBloc logBloc;

  const DebugLogger(this.logBloc, {super.nextLogger})
      : super(logLevel: LogLevel.debug);

  @override
  void log(String message) {
    final logMessage = LogMessage(logLevel: logLevel, message: message);
    logBloc.log(logMessage);
  }
}
