enum Routes {
  splash('/'),

  main('/main/:tab'),
  products('/products'),
  product('/product/:id');

  const Routes(this.path);
  final String path;

  String withParams(Map<String, String>? params) {
    if (params == null) return path;
    var newPath = path;
    params.forEach((key, value) {
      newPath = newPath.replaceAll(':$key', value);
    });
    return newPath;
  }
}
