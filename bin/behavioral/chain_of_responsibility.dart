void main(List<String> args) {
  AbstractLogger loggerChain = getChainOfLoggers();

  loggerChain.logMessage(AbstractLogger.INFO, "This is an information.");

  loggerChain.logMessage(
      AbstractLogger.DEBUG, "This is an debug level information.");

  loggerChain.logMessage(AbstractLogger.ERROR, "This is an error information.");
}

AbstractLogger getChainOfLoggers() {
  AbstractLogger errorLogger = ErrorLogger(AbstractLogger.ERROR);
  AbstractLogger fileLogger = FileLogger(AbstractLogger.DEBUG);
  AbstractLogger consoleLogger = ConsoleLogger(AbstractLogger.INFO);

  errorLogger.setNextLogger(fileLogger);
  fileLogger.setNextLogger(consoleLogger);

  return errorLogger;
}

abstract class AbstractLogger {
  static int INFO = 1;
  static int DEBUG = 2;
  static int ERROR = 3;

  late int level;

  //next element in chain or responsibility
  AbstractLogger? nextLogger;

  void setNextLogger(AbstractLogger nextLogger) {
    this.nextLogger = nextLogger;
  }

  void logMessage(int level, String message) {
    if (this.level <= level) {
      write(message);
    }
    if (nextLogger != null) {
      nextLogger!.logMessage(level, message);
    }
  }

  void write(String message);
}

class ConsoleLogger extends AbstractLogger {
  ConsoleLogger(int lavel) {
    level = lavel;
  }
  @override
  void write(String message) {
    print("Standard Console::Logger:  $message");
  }
}

class ErrorLogger extends AbstractLogger {
  ErrorLogger(int lavel) {
    level = lavel;
  }
  @override
  void write(String message) {
    print("Error  Console::Logger:  $message");
  }
}

class FileLogger extends AbstractLogger {
  FileLogger(int lavel) {
    level = lavel;
  }
  @override
  void write(String message) {
    print("File  ::Logger:  $message");
  }
}
