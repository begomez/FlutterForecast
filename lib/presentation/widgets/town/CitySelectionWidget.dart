import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/iso/ISOCityListModel.dart';
import 'package:flutter_template/common/models/iso/ISOCityModel.dart';
import 'package:flutter_template/domain/bloc/ISOCitiesBloc.dart';
import 'package:flutter_template/domain/dto/ISOCitiesDTO.dart';
import 'package:flutter_template/network/fake/FakeISOCitiesApiImpl.dart';
import 'package:flutter_template/presentation/navigation/AppNavigator.dart';
import 'package:flutter_template/presentation/resources/AppColors.dart';
import 'package:flutter_template/presentation/resources/AppStyles.dart';
import 'package:flutter_template/presentation/widgets/base/BaseStatefulWidgetWithBloc.dart';
import 'package:flutter_template/presentation/widgets/base/BaseStatelessWidget.dart';
import 'package:flutter_template/presentation/widgets/convenient/AppLoadingWidget.dart';
import 'package:flutter_template/presentation/widgets/convenient/AppNoDataWidget.dart';
import 'package:flutter_template/presentation/widgets/factory/WidgetFactory.dart';

class CitySelectionWidget extends BaseStatefulWidgetWithBloc<ISOCitiesBloc> {
  CitySelectionWidget({Key key}) : super(key: key);

  @override
  _CitySelectionWidgetState createState() => _CitySelectionWidgetState();
}

class _CitySelectionWidgetState extends BaseStatefulWidgetWithBlocState<
    CitySelectionWidget, ISOCitiesBloc, ISOCityListModel, ISOCitiesDTO> {
  _CitySelectionWidgetState()
      : super(autocall: true, bloc: ISOCitiesBloc(FakeISOCitiesApiImpl()));

  @override
  Widget buildInitial(BuildContext cntxt) {
    return this._buildList(cntxt, const ISOCityListModel([]));
  }

  @override
  Widget buildSuccess(BuildContext cntxt, ISOCityListModel data) {
    return this._buildList(cntxt, data);
  }

  Widget _buildList(BuildContext cntxt, ISOCityListModel data) {
    if (data.isEmpty()) {
      return AppNoDataWidget();
    } else {
      return ListView.builder(
          itemCount: data.list.length,
          itemBuilder: (cntxt, index) =>
              CityItemWidget(city: data.list[index]));
    }
  }

  @override
  ISOCitiesDTO getDTO() => ISOCitiesDTO();
}

/**
 * Single city widget
 */
class CityItemWidget extends BaseStatelessWidget {
  final ISOCityModel city;

  const CityItemWidget({@required this.city, Key key})
      : assert(city != null),
        super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return InkWell(
        splashColor: AppColors.accent,
        onTap: () async {
          await AppNavigator.toMain(context, city);
        },
        child: Container(
          padding: EdgeInsets.all(_Dimens.MID_SPACING),
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height / 4,
          child: Stack(
            children: [
              Image.network(
                this.city.img,
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height / 4,
                fit: BoxFit.fitWidth,
                loadingBuilder: (cntxt, child, progress) {
                  return (progress == null) ? child : AppLoadingWidget();
                },
              ),
              Positioned(
                bottom: _Dimens.MID_SPACING,
                right: _Dimens.MID_SPACING,
                child: Text(
                  city.name,
                  style: AppStyles.title.copyWith(color: AppColors.accent),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

abstract class _Dimens {
  static const double MID_SPACING = 8.0;
}
