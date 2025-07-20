function fn(email) {
  var emailRegex = /^[\w.%+-]+@[\w.-]+\.[a-zA-Z]{2,}$/;
  return emailRegex.test(email);
}
