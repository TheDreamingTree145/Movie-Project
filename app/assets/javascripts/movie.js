$('document').ready(function() {
  $('#random-movie-button').on('click', function() {
    randomMovie();
  })
})

function loadCharacters(movie_id) {
  $.ajax({
    type: 'GET',
    url: `/movies/${movie_id}/characters`,
    dataType: 'json',
    success: function(characters) {
      $('#movie-characters-' + characters[0].movie.id).toggle(function() {
        $('#movie-characters-' + characters[0].movie.id).empty();
        characters.forEach(function(character) {
            $('#movie-characters-' + character.movie.id).append(`<li>${character.name} Played By: <a href="/actors/${character.actor.id}">${character.actor.name}</li>`)
        })
      })
    }
  })
}

function randomMovie() {
  $.ajax({
    type: 'GET',
    url: '/movies',
    dataType: 'json',
    success: function(movies) {
      $('#random-movie').empty();
      let randomId = Math.floor(Math.random() * (movies.length + 1))
      let movie = movies[randomId];
      $('#random-movie').append(`<h2><a href='/movies/${movie.id}'${movie.title}</h2>`)
    }
  })
}
