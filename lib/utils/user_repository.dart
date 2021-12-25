import 'package:flutter/cupertino.dart';
import 'package:webuni/models/user_data.dart';

class UserRepositoryData {
  final List<UserData> users;
  final void Function(int) onDeleteUser;
  final void Function(UserData) onUserAdded;

  UserRepositoryData(this.users, this.onDeleteUser, this.onUserAdded);
}

class UserRepository extends InheritedWidget {
  final UserRepositoryData _data;

  const UserRepository(this._data, {required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant UserRepository oldWidget) =>
      oldWidget._data != _data;

  static UserRepositoryData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserRepository>()!._data;
  }
}

class UserRepositoryProvider extends StatefulWidget {
  final Widget child;

  const UserRepositoryProvider({Key? key, required this.child})
      : super(key: key);

  @override
  State<UserRepositoryProvider> createState() => _UserRepositoryProviderState();
}

class _UserRepositoryProviderState extends State<UserRepositoryProvider> {
  late UserRepositoryData _repositoryData;

  @override
  void initState() {
    _repositoryData = UserRepositoryData(
      const [
        UserData(
          0,
          'Mr Arnoldo Santos',
          'arnoldo.santos@example.com',
          '(526)-768-6369',
          NetworkImage('https://randomuser.me/api/portraits/men/44.jpg'),
        ),
        UserData(
          1,
          'Miss Linnea Leino',
          'linnea.leino@example.com',
          '(336)-457-4414',
          NetworkImage('https://randomuser.me/api/portraits/women/43.jpg'),
        ),
        UserData(
          2,
          'Mr Morris Anderson',
          'morris.anderson@example.com',
          '(531)-632-1792',
          NetworkImage('https://randomuser.me/api/portraits/men/14.jpg'),
        ),
        UserData(
          3,
          'Mr Warren Roberts',
          'warren.roberts@example.com',
          '(764)-198-5462',
          NetworkImage('https://randomuser.me/api/portraits/men/5.jpg'),
        ),
      ],
      _onDelete,
      _onAddUser,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserRepository(_repositoryData, child: widget.child);
  }

  void _onDelete(int userId) => setState(() {
        _repositoryData = UserRepositoryData(
          _repositoryData.users.toList()
            ..removeWhere((element) => element.id == userId),
          _onDelete,
          _onAddUser,
        );
      });

  void _onAddUser(UserData modifiedUser) => setState(() {
        _repositoryData = UserRepositoryData(
          _repositoryData.users.toList()..add(modifiedUser),
          _onDelete,
          _onAddUser,
        );
      });
}
