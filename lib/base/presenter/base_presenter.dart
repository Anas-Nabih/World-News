import 'package:world_news/base/presenter/i_presenter.dart';
import 'package:world_news/base/view/i_base_view.dart';

class BasePresenter<V extends IBaseView> extends IPresenter{

  late V view;

  /// Cancel network request
  // CancelToken _cancelToken;
  //
  // BasePresenter() {
  //   _cancelToken = CancelToken();
  // }



  @override
  void deactivate() {}

  @override
  void didChangeDependencies() {}

  @override
  void didUpdateWidget<T>(T oldWidget) {}

  @override
  void dispose() {
    // if (_cancelToken.isCancelled) {
    //   _cancelToken.cancel();
    // }
  }

  @override
  void initState() {
  }

}