// Not sure why my errors no longer show on the page
class Actor {
  constructor(id, name, gender, age) {
    this.id = id
    this.name = name;
    this.gender = gender;
    this.age = age;
  }
  actorDetails() {
    $("#actorName").text(this.name);
    $("#actorGender").text(this.gender);
    $("#actorAge").text(this.age)
  }
}
