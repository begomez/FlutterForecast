import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/iso/ISOCityListModel.dart';
import 'package:flutter_template/common/models/iso/ISOCityModel.dart';
import 'package:flutter_template/domain/bloc/ISOCitiesBloc.dart';
import 'package:flutter_template/domain/dto/ISOCitiesDTO.dart';
import 'package:flutter_template/network/fake/FakeISOApiImpl.dart';
import 'package:flutter_template/presentation/resources/AppColors.dart';
import 'package:flutter_template/presentation/widgets/base/BaseStatefulWidgetWithBloc.dart';
import 'package:flutter_template/presentation/widgets/convenient/AppNoDataWidget.dart';

class CityDropdownWidget extends BaseStatefulWidgetWithBloc<ISOCitiesBloc> {
  final Function(ISOCityModel) selectionCallback;
  final ISOCityModel place;

  const CityDropdownWidget(
      {@required this.selectionCallback, @required this.place, Key key})
      : assert(selectionCallback != null),
        assert(place != null),
        super(key: key);

  @override
  _CityDropdownWidgetState createState() =>
      _CityDropdownWidgetState(this.place);
}

class _CityDropdownWidgetState extends BaseStatefulWidgetWithBlocState<
    CityDropdownWidget, ISOCitiesBloc, ISOCityListModel, ISOCitiesDTO> {
  ISOCityModel _selectedPlace;

  _CityDropdownWidgetState(this._selectedPlace)
      : super(autocall: true, bloc: ISOCitiesBloc(FakeISOApiImpl()));

  @override
  Widget buildInitial(BuildContext cntxt) {
    return this._buildDrop(cntxt, []);
  }

  @override
  Widget buildSuccess(BuildContext cntxt, ISOCityListModel data) {
    return this._buildDrop(cntxt, data.list);
  }

  Widget _buildDrop(BuildContext cntxt, List<ISOCityModel> data) {
    if (data.isEmpty) {
      return AppNoDataWidget();
    } else {
      return Container(
        height: _Dimens.XBIG_SPACING,
        child: DropdownButtonHideUnderline(
            child: DropdownButton<ISOCityModel>(
                onChanged: this._onSelectionChange,
                dropdownColor: AppColors.primary,
                focusColor: AppColors.textColor,
                icon: Icon(Icons.keyboard_arrow_down),
                value: this._selectedPlace,
                items: data
                    .map((ISOCityModel iso) => DropdownMenuItem<ISOCityModel>(
                        value: iso, child: Text(iso.name)))
                    .toList())),
      );
    }
  }

  @override
  ISOCitiesDTO getDTO() => ISOCitiesDTO();

  void _onSelectionChange(ISOCityModel city) {
    this.widget.selectionCallback(city);
  }
}

abstract class _Dimens {
  static const double BIG_SPACING = 32.0;
  static const double XBIG_SPACING = 64.0;
}
