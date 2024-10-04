import 'package:custom_nav_bar/core/cache/cache_helper.dart';
import 'package:custom_nav_bar/core/global/cubit/global_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/service_locator.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  //bool isArabic = false ;
  String langCode = 'ar';
  bool get isArabic => langCode == 'ar'; // تحديد إذا كانت اللغة عربية

  void changeLang(String codeLang) async {
    emit(ChangeLangLoading());
    //isArabic = !isArabic;
    langCode = codeLang;
    await getIt<CacheHelper>().cacheLanguage(codeLang);
    emit(ChangeLangSuccess());
  }

  void getCachedLang() {
    emit(ChangeLangLoading());

    final cachedLang = getIt<CacheHelper>().getCachedLanguage();
    langCode = cachedLang;
    emit(ChangeLangSuccess());
  }
}
