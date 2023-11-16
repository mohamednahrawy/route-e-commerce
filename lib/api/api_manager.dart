import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:route_e_commerce_app/home/products_tab/data/model/ProductResponsetDto.dart';
import '../../../home/home_tab/data/model/CategoryOrBrandResponseDto.dart';
import '../login/data/model/response/SignInResponseDto.dart';
import '../login/data/model/request/SigninRequest.dart';
import '../register/data/model/request/RegisterRequest.dart';
import '../register/data/model/response/register_response.dart';
import 'api_constants.dart';
import 'failures.dart';

class ApiManager {
  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager();
    return _instance!;
  }

  /*
  https://ecommerce.routemisr.com/api/v1/auth/signup
   */

  ///todo: type of the return in the future
  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    ///todo: check internet connectivity
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
      var registerRequest = RegisterRequest(
          email: email,
          name: name,
          password: password,
          rePassword: rePassword,
          phone: phone);

      var response = await http.post(url, body: registerRequest.toJson());
      var json = jsonDecode(response.body);
      var registerResponse = RegisterResponseDto.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(Failures(
            errorMessage: registerResponse.error != null
                ? registerResponse.error?.msg
                : registerResponse.message));
      }
    } else {
      return Left(Failures(errorMessage: 'Please, Check internet connection'));
    }
  }

  Future<Either<Failures, SignInResponseDto>> signIn(
      {required String email, required String password}) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return Left(Failures(errorMessage: 'Please check internet connectivity'));
    } else {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.signInApi);
      var signInRequest = SignInRequest(email: email, password: password);
      var response = await http.post(url, body: signInRequest.toJson());

      var signInResponse =
          SignInResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(signInResponse);
      } else {
        return Left(Failures(errorMessage: signInResponse.failure?.message));
      }
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getCategories() async {
    ///todo: check internet connectivity
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url =
          Uri.https(ApiConstants.baseUrl, ApiConstants.getAllCategoriesApi);

      var response = await http.get(url);
      var json = jsonDecode(response.body);

      ///todo:hold the object
      var categoryResponse = CategoryOrBrandResponseDto.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryResponse);
      } else {
        return Left(Failures(errorMessage: categoryResponse.message));
      }
    } else {
      return Left(Failures(errorMessage: 'Please, Check internet connection'));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getBrands() async {
    ///todo: check internet connectivity
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getAllBrandsApi);

      var response = await http.get(url);
      var json = jsonDecode(response.body);

      ///todo:hold the object
      var brandResponse = CategoryOrBrandResponseDto.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(brandResponse);
      } else {
        return Left(Failures(errorMessage: brandResponse.message));
      }
    } else {
      return Left(Failures(errorMessage: 'Please, Check internet connection'));
    }
  }

  Future<Either<Failures, ProductsResponseDto>> getProducts() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getAllProductsApi);
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var productResponse = ProductsResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(productResponse);
      } else {
        return Left(Failures(errorMessage: productResponse.message));
      }
    } else {
      return Left(
          Failures(errorMessage: 'please, check internet connectivity'));
    }
  }
}
