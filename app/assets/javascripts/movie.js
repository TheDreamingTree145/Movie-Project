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
