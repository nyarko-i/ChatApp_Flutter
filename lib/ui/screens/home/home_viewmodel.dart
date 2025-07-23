import 'package:chat_app/core/enums/enums.dart';
import 'package:chat_app/core/models/user_models.dart';
import 'package:chat_app/core/other/base_viewmodel.dart';
import 'package:chat_app/core/services/database_service.dart';

class HomeViewmodel extends BaseViewmodel {
  final DatabaseService _db;
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  HomeViewmodel(this._db, String uid) {
    setState(ViewState.loading);
    fetchUserData(uid);
  }

  fetchUserData(String uid) async {
    final res = await _db.loadUser(uid);

    if (res != null) _currentUser = UserModel.fromMap(res);
    setState(ViewState.idle);
  }
}
