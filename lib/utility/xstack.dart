class XStack<T>{
  List<T> list = new List<T>();

  int size(){
    return list.length; 
  }

  T pop(){
    var item = list[list.length-1];
    list.removeLast();
    return item;
  }

  void push(T data){
    list.add(data);
  }

  T peek(){
    return list[list.length-1];
  }

}