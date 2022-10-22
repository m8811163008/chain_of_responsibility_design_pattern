import 'dart:async';
import 'dart:collection';

import 'package:chain_of_responsibility_design_pattern/model/log_message.dart';

/// Mocks the actual logging and provide log
/// entries to the UI.
///
/// Stores a list of logs and exposes
/// them through the stream.
/// A business logic component (BLoC) class to store log messages
/// and provide them to the UI through a public stream.
class LogBloc {
  final List<LogMessage> logs = [];

  final StreamController<List<LogMessage>> _logStream =
      StreamController<List<LogMessage>>();

  StreamSink<List<LogMessage>> get _inLogStream => _logStream.sink;

  Stream<List<LogMessage>> get outLogStream => _logStream.stream;

  /// Adds a new log to the list and notify
  /// [outLogStream] subscribes with an
  /// updated log entries list.how it notify?
  void log(LogMessage logMessage) {
    logs.add(logMessage);
    _inLogStream.add(UnmodifiableListView(logs));
  }

  void dispose() {
    _logStream.close();
  }
}
