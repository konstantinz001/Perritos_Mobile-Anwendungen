import 'package:flutter_application/common/services/db_service.dart';
import 'home_model.dart';
import 'home_view.dart';

class HomeImplmentation extends HomeController {
  final DatabaseService _databaseService;

  HomeImplmentation({
    required DatabaseService databaseService,
    HomeModel? model,
  })  : _databaseService = databaseService,
        super(model ??
            const HomeModel(
              screen: "screen 1"
            )      
            );

}
