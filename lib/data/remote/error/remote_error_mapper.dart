class RemoteErrorMapper{
  static Exception getException(dynamic error){
    if(error is Exception){
      return error;
    }else{
      throw Exception(error.toString());
    }
  }
}