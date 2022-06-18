part of'home_widgets_imports.dart';
class BuildFilterSearch extends StatelessWidget {
  const BuildFilterSearch({
    Key? key,
    required this.mediaQuery,
  }) : super(key: key);

  final Size mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){
          showDialog(
              context: context,
              builder: (_) => const BuildFilterDialog());
        },
        child: Container(
            width: mediaQuery.width*.2-16,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.white,
            ),
            child:const Icon(Icons.filter_alt,color: AppColors.mainColorIndigo,size: 20,)
        ),
      ),
    );
  }
}