import 'package:get/get.dart';
import 'package:sportperformance/Models/PlannigModel.dart';
import 'package:sportperformance/apiServices/planning_services.dart';

class PlanningController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool showError = false.obs;
  late PlanningModel plan;

  getPlanning() {
    isLoading(true);
    PlanningServices().getPlanning().then((value) {
      if (value != null) {
        plan = value;
        isLoading(false);
      } else {
        isLoading(false);
        showError(true);
      }
    });
  }

  @override
  void onReady() {
    getPlanning();
    super.onReady();
  }
}