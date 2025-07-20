function fn(url) {
  var spotifyUserUrlRegex = /^https:\/\/open\.spotify\.com\/user\/.*$/;
  return spotifyUserUrlRegex.test(url);
}
