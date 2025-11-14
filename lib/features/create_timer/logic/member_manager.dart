
import 'package:flutter/widgets.dart';

class MemberManager {
  final List<int> members = [];
  final List<TextEditingController> controllers = [];

  void addMember(VoidCallback onUpdate) {
    if (members.length >= 2) return;
    final id = DateTime.now().millisecondsSinceEpoch;
    members.add(id);
    controllers.add(TextEditingController());
    onUpdate();
  }

  void removeMember(int id, VoidCallback onUpdate) {
    final index = members.indexOf(id);
    if (index != -1) {
      controllers[index].dispose();
      controllers.removeAt(index);
    }
    members.remove(id);
    onUpdate;
  }

  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
  }
}