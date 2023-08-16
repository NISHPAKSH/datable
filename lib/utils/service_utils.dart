
class ServiceUtils {

  ServiceUtils._internal();
  static ServiceUtils instance = ServiceUtils._internal();
  factory ServiceUtils(){
    return instance;
  }

  static dynamic userImpersonateId;
  static setUserImpersonateId(dynamic value){
    userImpersonateId = value;
  }

  static dynamic userId;
  static setUserId(dynamic value){
    userId = value;
  }


}