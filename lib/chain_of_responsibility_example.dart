import 'package:chain_of_responsibility_design_pattern/debug_logger.dart';
import 'package:chain_of_responsibility_design_pattern/error_logger.dart';
import 'package:chain_of_responsibility_design_pattern/fake%20data%20provider/log_bloc.dart';
import 'package:chain_of_responsibility_design_pattern/info_logger.dart';
import 'package:chain_of_responsibility_design_pattern/logger_base.dart';
import 'package:chain_of_responsibility_design_pattern/model/log_message.dart';
import 'package:chain_of_responsibility_design_pattern/widgets/log_message_column.dart';
import 'package:chain_of_responsibility_design_pattern/widgets/platform_button.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

/// Creates a chain of loggers and uses public methods
/// defined in [LoggerBase] to log messages.
///
/// Initialises and contains the loggers' chain object (in
/// `initState()` method).
class ChainOfResponsibilityExample extends StatefulWidget {
  const ChainOfResponsibilityExample({Key? key}) : super(key: key);

  @override
  State<ChainOfResponsibilityExample> createState() =>
      _ChainOfResponsibilityExampleState();
}

class _ChainOfResponsibilityExampleState
    extends State<ChainOfResponsibilityExample> {
  final LogBloc logBloc = LogBloc();

  late final LoggerBase logger;

  @override
  void initState() {
    super.initState();
    logger = DebugLogger(
      logBloc,
      nextLogger: InfoLogger(
        logBloc,
        nextLogger: ErrorLogger(logBloc),
      ),
    );
  }

  @override
  void dispose() {
    logBloc.dispose();
    super.dispose();
  }

  String get randomLog => faker.lorem.sentence();

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Column(
          children: <Widget>[
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: () => logger.logDebug(randomLog),
              text: 'Log debug',
            ),
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: () => logger.logInfo(randomLog),
              text: 'Log info',
            ),
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: () => logger.logError(randomLog),
              text: 'Log error',
            ),
            const Divider(),
            Row(
              children: <Widget>[
                Expanded(
                  child: StreamBuilder<List<LogMessage>>(
                    initialData: const [],
                    stream: logBloc.outLogStream,
                    builder: (context, snapshot) =>
                        LogMessagesColumn(logMessages: snapshot.data!),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
