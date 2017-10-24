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
    $('#actorSubmit').attr('data-disable-with');
    debugger;
    event.preventDefault();
    let values = $(this).serialize();

    let posting = $.post('/actors', values);
    posting.done(function(data) {
      $("#actorName").text(data.name);
      $("#actorGender").text(data.gender);
      $("#actorAge").text(data.age)
    })
    $('#actorSubmit').removeAttr('data-disable-with');
  })
})
