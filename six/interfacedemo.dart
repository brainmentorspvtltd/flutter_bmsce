class Player {
  void kick() {}
  void punch() {}
}

class AddOnFeatures {
  void hide() {}
  void show() {}
}

class Ryu implements Player, AddOnFeatures {
  @override
  void kick() {
    print("kick High");
    // TODO: implement kick
  }

  @override
  void punch() {
    print("punch low");
    // TODO: implement punch
  }

  @override
  void hide() {
    // TODO: implement hide
  }

  @override
  void show() {
    // TODO: implement show
  }
}

class Ken implements Player {
  @override
  void kick() {
    // TODO: implement kick
    print("Kick Low");
  }

  @override
  void punch() {
    print("Punch High");
    // TODO: implement punch
  }
}
