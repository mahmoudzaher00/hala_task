import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/app_colors.dart';
import '../../widgets/custom_text.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<String>typeViewList=['assets/images/Single-view-icon.png','assets/images/grid-view-icon.png','assets/images/List-view-icon.png'];

  List<String>mealImages=['assets/images/04.png','assets/images/02.png','assets/images/03.png','assets/images/02.png','assets/images/04.png','assets/images/03.png'];

  List<String>mealNamesList=['Slow-Cooked Volcanic Terrier','Pickled Vinegar Cockles','Shallow-Fried Herbs & Chicken','Stewed Fennel & Orange Pie','Shallow-Fried Herbs & Chicken','Stewed Fennel & Orange Pie'];

  var selectList;
  List<bool> selectFavouriteMeal =List.filled(6, false) ;


  void typeDisplayCategories (int value){
    emit(UnSelectedIndexList());
    selectList=value;
    emit(SelectedIndexList());
  }

  void favouriteMeal (int value){
    emit(UnFavouriteMeal());
    selectFavouriteMeal[value] = !selectFavouriteMeal[value];

    emit(FavouriteMeal());
  }
  IconData mealState (index){
    if(selectFavouriteMeal[index] == false ){
      return Icons.favorite_border;
    }else{
      return Icons.favorite;
    }
  }
  Widget addMealState (index){
    if(selectFavouriteMeal[index] == false ){
     return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primaryColorGreen)
        ),
        child: const Icon(Icons.add,size: 15,color: AppColors.primaryColorGreen,),
      );
    }else{
      return   Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: AppColors.primaryColorGreen,
            borderRadius: BorderRadius.circular(12)
        ),
        child:const CustomText(
          text: 'Added',
          fontWeight: FontWeight.normal,
          fontSize: 9,
          color: Colors.white,
          textAlign: TextAlign.center,
        ),
      );
    }
  }

}
