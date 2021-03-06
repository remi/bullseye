class BullseyeSpecFormatter implements BullseyeSpecFormattable {

  static Map<String,String> _colors;
         bool               _colorize;
         Function           _loggingFunction;

  static Map<String,String> get colors() {
    if (_colors == null)
      _colors = {
        "white":  "\x1b\x5b;0;37m",
        "red":    "\x1b\x5b;0;31m",
        "green":  "\x1b\x5b;0;32m",
        "yellow": "\x1b\x5b;0;33m"
      };
    return _colors;
  }

  void header(){}
  void footer(){}
  void beforeDescribe(BullseyeTestFixture testFixture){}
  void afterDescribe(BullseyeTestFixture testFixture){}
  void beforeTest(BullseyeTest test){}
  void afterTest(BullseyeTest test){}

  bool printToStdout;

  String get indentString() => "  ";

  String get colorReset() => "\x1b\x5b;0;37m";

  bool get colorize() {
    if (_colorize == null) _colorize = true;
    return (_colorize == true);
  }

  set colorize(bool value) => _colorize = value;

  void logger(Function fn) {
    _loggingFunction = fn;
  }

  void write(String text, [int indent = 0, String color = null]) {
    String status = _indent(indent, text);
    if (colorize == true)
      status = _colorizeText(status, color);
    if (printToStdout != false)
      print(status);
    if (_loggingFunction != null)
      _loggingFunction(status + "\n");
  }

  void writeNewline(){ write(""); }

  String _colorizeText([String text = null, String color = null]) {
    if (color == null)
      return text;
    else
      return "${colors[color]}${text}${colorReset}";
  }

  String _indent(int indent, String text) {
    String prefix = "";
    for (int i = 0; i < indent; i++)
      prefix += indentString;
    return prefix + text;
  }
}
