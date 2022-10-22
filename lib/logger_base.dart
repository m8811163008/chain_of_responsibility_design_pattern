import 'package:chain_of_responsibility_design_pattern/model/log_level.dart';
import 'package:flutter/foundation.dart';

/// Base class for all the specific loggers.
abstract class LoggerBase {
  @protected
  final LogLevel logLevel;

  /// A reference(successor) to the next logger in the chain.
  final LoggerBase? _nextLogger;

  const LoggerBase({
    required this.logLevel,
    LoggerBase? nextLogger,
  }) : _nextLogger = nextLogger;

  /// Logs messages using the [log()] method and passes the
  /// request along the chain.
  ///
  /// Logs the message if its log level is lower than the
  /// current logger's and then forwards he message to the
  /// successor(if there is one).
  void logMessage(LogLevel level, String message) {
    if (logLevel <= level) {
      log(message);
    }
    _nextLogger?.logMessage(level, message);
  }

  /// Log message wih log level of debug.
  void logDebug(String message) => logMessage(LogLevel.debug, message);

  /// Log message wih log level of info.
  void logInfo(String message) => logMessage(LogLevel.info, message);

  /// Log message wih log level of error.
  void logError(String message) => logMessage(LogLevel.error, message);

  void log(String message);
}
