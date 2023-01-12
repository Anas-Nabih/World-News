import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:world_news/base/presenter/base_presenter.dart';
import 'package:world_news/base/view/i_base_view.dart';
import 'package:world_news/res/colors.dart';

abstract class BaseState<T extends StatefulWidget, P extends BasePresenter>
    extends State<T> implements IBaseView {
  late P mPresenter;

  BaseState() {
    mPresenter = createPresenter();
    mPresenter.view = this;
  }

  P createPresenter();

  @override
  BuildContext getContext() {
    return context;
  }

  @override
  void showProgress({bool isDismiss = true}) {
    if (mounted && !_isShowDialog) {
      _isShowDialog = true;
      try {
        showDialog(
            context: context,
            builder: (context) {
              return WillPopScope(
                onWillPop: () async => false,
                child: SpinKitFoldingCube(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven
                            ? MColors.kPrimaryColor
                            : MColors.kSecondaryColor,
                      ),
                    );
                  },
                ),
              );
            },
            barrierDismissible: false);
      } catch (e) {
        print(e);
      }
    }
  }

  void showDialogMessage({required String title, Message}) {
    if (mounted && !_isShowDialog) {
      _isShowDialog = true;
      try {
        print("show dialog here");
        // showTransparentDialog(
        //     context: context,
        //     barrierDismissible: true,
        //     builder: (_) {
        //       return WillPopScope(
        //         onWillPop: () async {
        //           _isShowDialog = false;
        //           return Future.value(true);
        //         },
        //         child: GestureDetector(
        //           onTap: () {},
        //           // child: ProgressDialog(),
        //         ),
        //       );
        //     });
      } catch (e) {
        print(e);
      }
    }
  }

  bool _isShowDialog = false;

  @override
  void closeProgress() {
    if (mounted && _isShowDialog) {
      _isShowDialog = false;
      // NavigatorUtils.goBack(context);
    }
  }

  @override
  void showToasts(String msg) {
    Fluttertoast.showToast(msg: msg,gravity: ToastGravity.BOTTOM);
  }

  @override
  void initState() {
    super.initState();
    mPresenter.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mPresenter.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    mPresenter?.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    mPresenter.deactivate();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    didUpdateWidgets<T>(oldWidget);
  }

  void didUpdateWidgets<W>(W oldWidget) {
    mPresenter?.didUpdateWidget<W>(oldWidget);
  }
}
