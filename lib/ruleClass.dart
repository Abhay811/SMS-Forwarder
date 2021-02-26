class Rule {
  int sim = 0;
  //true: if rule is valid by default false
  bool valid = false;
  String ruleName = "Rule";
  bool any = false;
  List<String> forwardFrom = [], forwardTo = [];
  String messageContent, exclude;
  int dailyLimit;

  //todo: create function to save and delete class objects

}

class RuleCollection {
  List<Rule> rules = [];

// todo: create function to fetch class objects from disk
}
