import '../domain/use_case/calculate_bmi_use_case.dart';
import '../main/my_app.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../domain/use_case/validate_email_use_case..dart';
import '../domain/use_case/validate_password_use_case.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: MyApp()),
  Provider.value(value: ValidateEmailUseCase()),
  Provider.value(value: ValidatePasswordUseCase()),
  Provider.value(value: CalculateBmiUseCase()),
];

List<SingleChildWidget> dependentServices = [];
