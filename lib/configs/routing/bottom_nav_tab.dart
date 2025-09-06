enum BottomNavTab {
  products(0),
  categories(1),
  favorites(2),
  profile(3);

  const BottomNavTab(this.navigationIndex);

  final int navigationIndex;

  static BottomNavTab fromIndex(int index) {
    return BottomNavTab.values.firstWhere(
      (tab) => tab.navigationIndex == index,
      orElse: () => BottomNavTab.products,
    );
  }

  @override
  String toString() {
    return navigationIndex.toString();
  }
}
