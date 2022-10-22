import 'package:chain_of_responsibility_design_pattern/fake%20data%20provider/log_bloc.dart';
import 'package:chain_of_responsibility_design_pattern/logger_base.dart';
import 'package:chain_of_responsibility_design_pattern/model/log_level.dart';
import 'package:chain_of_responsibility_design_pattern/utility/external_logging_service.dart';

/// Sets the log level to [LogLevel.info] and uses
/// [ExternalLoggingService] to log message.
class InfoLogger extends LoggerBase {
  /// A service to log messages.
  ExternalLoggingService externalLoggingService;
  InfoLogger(LogBloc logBloc, {super.nextLogger})
      : externalLoggingService = ExternalLoggingService(logBloc),
        super(logLevel: LogLevel.info);

  @override
  void log(String message) {
    externalLoggingService.logMessage(logLevel, message);
  }
}
