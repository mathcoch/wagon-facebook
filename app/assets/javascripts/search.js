var profiles = instantsearch({
  appId: 'LZEMPFONKV',
  apiKey: '427c69ac1af038f71cecc79b5be449e3',
  indexName: 'Profile',
  searchFunction: function(helper) {
    var query = profiles.helper.state.query;
    posts.helper.setQuery(query);
    posts.helper.search();
    helper.search();
  }
});

var posts = instantsearch({
  appId: 'LZEMPFONKV',
  apiKey: '427c69ac1af038f71cecc79b5be449e3',
  indexName: 'Post'
});

var profilesHits = instantsearch.widgets.hits({
  container: document.querySelector('#profiles'),
  hitsPerPage: 100,
  templates: {
    item: getTemplate('profile'),
    empty: getTemplate('no-results-profiles'),
  }
});

var postsHits = instantsearch.widgets.hits({
  container: document.querySelector('#posts'),
  hitsPerPage: 100,
  templates: {
    item: getTemplate('post'),
    empty: getTemplate('no-results-posts'),
  }
});

var searchBox = instantsearch.widgets.searchBox({
  container: document.querySelector('#search-input'),
  placeholder: 'Rechercher un profile, un ragot ...',
});


profiles.addWidget(profilesHits);
profiles.addWidget(searchBox);
posts.addWidget(postsHits);
posts.start();
profiles.start();

// ---------------------
//
//  Helper functions
//
// ---------------------
function getTemplate(templateName) {
  return document.querySelector("#" + templateName + "-template").innerHTML;
};
