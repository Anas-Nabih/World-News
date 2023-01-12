abstract class ILifecycle{

  void initState();

  void didChangeDependencies();

  void didUpdateWidget<T>(T oldWidget);

  void deactivate();

  void dispose();
}