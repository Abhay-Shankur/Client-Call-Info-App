import 'package:call_info/handlers/shared_preferences_helper.dart';
import 'package:flutter/material.dart';

class BlocklistProvider extends ChangeNotifier {
  Set<String>? blocklist;

  BlocklistProvider() {
    _init();
  }

  Future<void> _init() async {
    try {
      await SharedPreferencesHelper.reload();
      List<String> list = await SharedPreferencesHelper.getList("blocklist");
      blocklist = list.toSet();
      notifyListeners();
    } catch(e) {
      debugPrint("Exception: $e");
    }
  }

  void addItem(String val) {
    blocklist = blocklist ?? {};
    blocklist!.add(val);
    notifyListeners();
    updateShared();
  }

  Set<String> getList() {
    return blocklist ?? {};
  }

  void removeItem(String val) {
    blocklist = blocklist ?? {};
    blocklist!.remove(val);
    notifyListeners();
    updateShared();
  }

  Future<void> updateShared() async {
    await SharedPreferencesHelper.reload();
    await SharedPreferencesHelper.setList('blocklist', blocklist?.toList() ?? []);
  }
}