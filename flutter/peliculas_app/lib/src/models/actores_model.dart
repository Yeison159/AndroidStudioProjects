// Generated by https://quicktype.io

class Cast {
  List<Actor> items = new List();

  Cast();

  Cast.fromJsonList(List<dynamic> jsonList){

    if (jsonList == null) return;

    for(var item in jsonList){
      final actor = new Actor.fromJsonMap(item);
      items.add(actor);
    }

  }

}

class Actor{
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'] ;
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  getPhoto(){
    if (profilePath == null) {
      return 'https://www.slotcharter.net/wp-content/uploads/2020/02/no-avatar.png';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}

// key https://api.themoviedb.org/3/movie/456740/credits?api_key=b1cbfce5515fe9dc2a96b8a711a1c6fe
