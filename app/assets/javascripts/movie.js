$('document').ready(function() {
  $('#random-movie-button').on('click', function() {
    randomMovie();
  })
})

function loadCharacters(movie_id) {
  $.ajax({
    type: 'GET',
    url: `/movies/${movie_id}/`,
    dataType: 'json',
    success: function(characters) {
      $('#movie-characters-' + characters[0].movie.id).toggle(function() {
        $('#movie-characters-' + characters[0].movie.id).empty();
        characters.forEach(function(character) {
            $('#movie-characters-' + character.movie.id).append(`<li>${character.name} Played By: <a href="/actors/${character.actor.id}">${character.actor.name}</li>`)
        })
      })
    },
    error: function(request, status, error) {
      alert("There has been an error loading the characters");
    }
  })
}

function randomMovie() {
  $('#random-movie-button').on('click', function() {
    debugger;
    let newMovie = Math.floor(Math.random() * (movies.length + 1))
    $.get(`/movies/${newMovie}/.json`, function(data) {
      debugger;
    })
  })
}
