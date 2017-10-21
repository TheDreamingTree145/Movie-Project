// It's like I have to click everything twice to work... Because document.ready?

let movies = function() { // Gotta be a better way to do this. I imagine this slows stuff way down
  return $('.movies_class').data('movies').length
}

function loadCharacters(movie_id) {
  let movieDiv = document.getElementById('movie-characters-' + movie_id)
  if (movieDiv.hidden && movieDiv.children.length > 0) {
    movieDiv.hidden = false
  } else if (movieDiv.hidden === false && movieDiv.children.length > 0) {
    movieDiv.hidden = true
  } else {
    $.ajax({
      type: 'GET',
      url: `/movies/${movie_id}/characters.json`,
      dataType: 'json',
      success: function(characters) {
        characters.forEach(function(character) {
          $('#movie-characters-' + character.movie.id).append(`<li>${character.name} Played By: <a href="/actors/${character.actor.id}">${character.actor.name}</li>`)
        })
      },
      error: function(request, status, error) {
        alert("There has been an error loading the characters");
      }
    })
  }
}

// does flip through because I am using sample?
function randomMovie() {
  let newMovie = Math.floor(Math.random() * (movies() + 1))
  $.get(`/movies/${newMovie}.json`, function(data) {
    $('.movieTitle').text(data['title']);
    $('.releaseDate').text(data['release_date']); // How to do with null values in these fields
    $('criticRating').text(data['critic_rating']);
    $('.awards').text(data['awards']);
    $('.createdBy').text(data['created_by']);
  })
}
