import 'package:flutter_template/common/models/ErrorModel.dart';
import 'package:flutter_template/common/models/core/BaseModel.dart';

/**
 * Enum with possible result states
 */
enum ResourceState { INITIAL, LOADING, SUCCESS, ERROR }

/**
 * Wrapper around a result (which can be some data or an error)
 * Generic class receiving:
 * - TargetData: data model contained in the result obj
 */
class ResourceResult<TargetData extends BaseModel> {
  final TargetData data;
  final ErrorModel error;
  ResourceState resState;

  ResourceResult(
      {this.data, this.error, this.resState = ResourceState.INITIAL});

  bool hasData() => this.data != null;

  bool hasError() => this.error != null;

  bool isLoading() => this._isSomeState(ResourceState.LOADING);

  bool isInitial() => this._isSomeState(ResourceState.INITIAL);

  bool isError() => this._isSomeState(ResourceState.ERROR);

  bool isSuccess() => this._isSomeState(ResourceState.SUCCESS);

  bool _isSomeState(ResourceState target) => (this.resState == target);

  void setResultState(ResourceState state) => this.resState = state;
}
