$(document).on('turbolinks:load', function(){
  var posts = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/posts/autocomplete?query=%QUERY',
      wildcard: '%QUERY'
    }
  });
  $('#posts_search').typeahead(null, {
    source: posts
  });
})
