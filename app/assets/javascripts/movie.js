// It's like I have to click everything twice to work... Because document.ready?

let movies = function() { // Gotta be a better way to do this. I imagine this slows stuff way down
  return $('.movies_class').data('movies').length
}

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

// does flip through because I am using sample?
function randomMovie() {
  $('#random-movie-button').on('click', function() {
    let newMovie = Math.floor(Math.random() * (movies() + 1))
    $.get(`/movies/${newMovie}.json`, function(data) {
      $('.movieTitle').text(data['title']);
      $('.releaseDate').text(data['release_date']); // How to do with null values in these fields
      $('criticRating').text(data['critic_rating']);
      $('.awards').text(data['awards']);
      $('.createdBy').text(data['created_by']);
    })
  })
}
