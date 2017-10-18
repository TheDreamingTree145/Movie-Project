function loadActors(movie_id) {
    debugger;
      $.ajax({
        type: 'GET',
        url: `/movies/${movie_id}/characters`,
        dataType: 'json',
        success: function(characters) {
          debugger;
        }
      })
}
