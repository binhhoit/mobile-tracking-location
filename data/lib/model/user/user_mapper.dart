import 'package:data/model/user/user_dto.dart';
import 'package:domain/model/user/user.dart';
import 'package:smartstruct/smartstruct.dart';

part 'user_mapper.mapper.g.dart';

@Mapper(useInjection: true)
abstract class UserMapper {
  User fromModel(UserDTO model);
}