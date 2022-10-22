# chain_of_responsibility_design_pattern

Avoid coupling the sender of a request to its receiver by giving more than one object a chance to handle the request. Chain the 
receiving objects and pass the request along the chain until an object handles it.


The Chain of Responsibility design pattern is an ordered list of
message handlers that know how to do two things - process a specific type of message or pass the message along the next message handler.

## Applicability
The Chain of Responsibility design pattern should be used when the system is expected to process different kinds of requests in various ways, but neither the request types nor the handling sequence is defined at compile time.

## Problem : custom logging workflow
We want 3 different log levels based on their importance:
* **Debug** - only needed in the local environment for development purposes.
* **Info** - we want to see those logs locally, but also they should be stored and visible in the external logging service when the application deployed.
* **Error** - those logs must be visible locally and external logging service, but also we want notify our development team by sending an e-main when such a log appears.

In this case, our request is a log message with its content and log level. To implement the wanted workflow, we could link the loggers in the following order: Debug -> Info -> Error. If the logger's log level is lower or equal to the one defined in the message, the message should be logged.
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
