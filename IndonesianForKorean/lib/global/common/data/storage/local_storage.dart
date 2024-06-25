import 'package:shared_preferences/shared_preferences.dart';


/*initializeLocalStorage

이 함수는 LocalStorage 클래스의 인스턴스를 초기화하는 역할을 합니다.
앱 시작 시 한 번만 호출하여 SharedPreferences 인스턴스를 생성하고 이를 LocalStorage 인스턴스에 설정합니다.
clear

clear 메서드는 SharedPreferences의 모든 데이터를 삭제합니다.
이 메서드는 앱의 모든 로컬 저장 데이터를 초기화해야 할 때 사용됩니다.
_internal

_internal은 LocalStorage 클래스의 프라이빗 생성자입니다.
싱글톤 패턴을 구현하기 위해 사용되며, 클래스 외부에서는 접근할 수 없습니다.
이는 LocalStorage 인스턴스가 한 번만 생성되도록 보장합니다*/

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();
  late SharedPreferences _prefs;

  LocalStorage._internal();

  static LocalStorage get instance => _instance;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> write({required String key, required String value}) async {
    await _prefs.setString(key, value);
  }

  Future<String?> read({required String key}) async {
    String value = _prefs.getString(key) ?? '등록 대기 중';
    return value;
  }

  Future<void> delete({required String key}) async {
    await _prefs.remove(key);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }

  Future<void> writeMultiple(Map<String, String> data) async {
    for (var entry in data.entries) {
      await _prefs.setString(entry.key, entry.value);
    }
  }
}

Future<void> initializeLocalStorage() async {
  await LocalStorage.instance.init();
}


