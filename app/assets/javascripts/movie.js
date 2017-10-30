class Movie {
  constructor(id, title, releaseDate, criticRating, awards, createdBy) {
    this.id = id;
    this.title = title;
    this.releaseDate = releaseDate;
    this.criticRating = criticRating;
    this.awards = awards;
    this.createdBy = createdBy;
  }
  renderMovieDetails() {
    $('#random-title-link')[0].href = (`/movies/${this.id}`)
    $('#random-title-link').text(this.title);
    $('.releaseDate').text(this.releaseDate); // How to do with null values in these fields
    $('.criticRating').text(this.criticRating);
    $('.awards').text(this.awards);
    $('.createdBy').text(this.createdBy);
  }
}

let moviesLength = function() {
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

        characters
          .sort(a, b) => a.name.localeCompare(b.name))
          .forEach(function(character) {
            $('#movie-characters-' + character.movie.id).append(`<li>${character.name} Played By: <a href="/actors/${character.actor.id}">${character.actor.name}</li>`)
          })
      },
      error: function(request, status, error) {
        alert("There has been an error loading the characters");
      }
    })
  }
}

function randomMovie() {
  let newMovie = Math.floor(Math.random() * (moviesLength() + 1))
  $.get(`/movies/${newMovie}.json`, function(data) {
    // not really sure of the point of this? Because I'm not creating object when instantiated in Rails or does that matter?
    let movie = new Movie(data.id, data.title, data.release_date, data.critic_rating, data.awards, data.created_by)
    movie.renderMovieDetails();
  })
}
