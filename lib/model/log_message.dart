import 'package:chain_of_responsibility_design_pattern/model/log_level.dart';
import 'package:flutter/material.dart';

/// Stores information about the log message.
class LogMessage {
  final LogLevel logLevel;
  final String message;
  String get _logLevelString =>
      logLevel.toString().split('.').last.toUpperCase();

  LogMessage({required this.logLevel, required this.message});

  /// Formats the log entry as a [Widget] object.
  Widget getFormattedMessage() {
    return Text(
      '$_logLevelString : $message',
      style: TextStyle(color: _getLogEntryColor()),
      textAlign: TextAlign.justify,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  // Returns log entry color base on log level
  Color _getLogEntryColor() {
    switch (logLevel) {
      case LogLevel.debug:
        return Colors.grey;
      case LogLevel.info:
        return Colors.blue;
      case LogLevel.error:
        return Colors.red;
      default:
        throw Exception('Log level $logLevel is not supported.');
    }
  }
}

void main() {
  final l = LogMessage(logLevel: LogLevel.error, message: 'test');
  print(l._logLevelString);
}
