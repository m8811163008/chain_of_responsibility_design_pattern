import 'package:chain_of_responsibility_design_pattern/model/log_message.dart';
import 'package:flutter/material.dart';

class LogMessagesColumn extends StatelessWidget {
  final List<LogMessage> logMessages;

  const LogMessagesColumn({
    super.key,
    required this.logMessages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (var logMessage in logMessages)
          Row(
            children: <Widget>[
              Expanded(
                child: logMessage.getFormattedMessage(),
              ),
            ],
          )
      ],
    );
  }
}
