/* global instantsearch */

app({
  appId: 'LZEMPFONKV',
  apiKey: '427c69ac1af038f71cecc79b5be449e3',
  indexName: 'Profile'
});

function app(opts) {
  // ---------------------
  //
  //  Init
  //
  // ---------------------
  const search = instantsearch({
    appId: opts.appId,
    apiKey: opts.apiKey,
    indexName: opts.indexName,
    urlSync: true,
  });

  // ---------------------
  //
  //  Default widgets
  //
  // ---------------------
  search.addWidget(
    instantsearch.widgets.searchBox({
      container: '#search-input',
      placeholder: 'Rechercher un profile, un ragot ...',
    })
  );

  search.addWidget(
    instantsearch.widgets.hits({
      container: '#hits',
      hitsPerPage: 100,
      templates: {
        item: getTemplate('hit'),
        empty: getTemplate('no-results'),
      },
      transformData: {
        item: function (item) {
          item.starsLayout = getStarsHTML(item.rating);
          return item;
        },
      },
    })
  );

  // ---------------------
  //
  //  Filtering widgets
  //
  // ---------------------
  search.start();
};

// ---------------------
//
//  Helper functions
//
// ---------------------
function getTemplate(templateName) {
  return document.querySelector(`#${templateName}-template`).innerHTML;
};

function getStarsHTML(rating, maxRating) {
  let html = '';
  maxRating = maxRating || 5;

  for (let i = 0; i < maxRating; ++i) {
    html += `<span class="ais-star-rating--star${i < rating ? '' : '__empty'}"></span>`;
  };

  return html;
};
