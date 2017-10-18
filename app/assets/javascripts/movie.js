function loadCharacters(movie_id) {
  $.ajax({
    type: 'GET',
    url: `/movies/${movie_id}/characters`,
    dataType: 'json',
    success: function(characters) {
      if ($('#movie-characters' + characters[0].movie.id).innerHTML) {
        $('#movie-characters' + characters[0].movie.id).empty();
        } else {
          characters.forEach(function(character) {
            $('#movie-characters-' + character.movie.id).append(`<li>${character.name} Played By: <a href="/actors/${character.actor.id}">${character.actor.name}</li>`)
        })
      }
    }
  })
}
