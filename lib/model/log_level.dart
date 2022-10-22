/// Defines possible log levels.
enum LogLevel { debug, info, error }

extension LogLevelOperator on LogLevel {
  /// Whether this log level's order is before the other.
  /// If this is order before other returns true.
  bool operator <=(LogLevel other) => index <= other.index;
}
