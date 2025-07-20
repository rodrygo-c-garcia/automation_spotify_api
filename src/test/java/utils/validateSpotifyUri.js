function fn(uri) {
  var spotifyUriRegex = /^spotify:user:.*$/;
  return spotifyUriRegex.test(uri);
}
