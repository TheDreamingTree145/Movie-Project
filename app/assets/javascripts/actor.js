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

$(function () {
  $('#new_actor').submit(function(event) {
    event.preventDefault();
    let values = $(this).serialize();

    let posting = $.post('/actors', values);
    posting.done(function(data) {
      let actorId = data.id;
      let actorName = data.name;
      let actorGender = data.gender;
      let actorAge = data.age
      let actor = new Actor(actorId, actorName, actorGender, actorAge);
      actor.actorDetails();
    })
  })
})
