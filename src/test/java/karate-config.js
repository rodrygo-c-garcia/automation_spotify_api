function fn() {
  // get system property 'karate.env'
  let env = karate.env;
  // settings to wait a response from servers 5 seconds
  karate.configure("connectTimeout", 5000);
  karate.configure("readTimeout", 5000);
  karate.log("karate.env property was:", env);

  if (!env) {
    env = "dev";
  }

  var config = {
    env: env,
    baseUrl: "https://api.spotify.com/v1/",
    token:
      "BQCMJWC-4xtpzq87wogebbNnQnR_cPpS8K9H96sFdENj7B8MnsA9azYDZHw3CkF6Fhi4B8A1OycyFU7ED1DbkJzle2UVHGFdj_TqI9-IMRhh0GyTf4_uzy9C8rsP3iXB1zzv7bDWDH-53MnnVhTQAANkZrWLg9KCdZIMG_KZGCEqgjGnHz5MpC9IKwN6B5uXlGchonw90SsorStQeScvE4dAdE3JAKsnUiit277WoGAhFFAy2aVJPEW6ushwp88vjOh6wX5jcWYxiZXyRkzdBQv55JQ6LVyTP9HORQgm4QwXfzE_eGWvTRy_zr1NuaAvsDgvKWRB2M0aCDCKAXL0KOn8tMG5CedrjMW7yg9QWw09PLAnQO2JY2N6Y8dT",
    // el token reemplaza con lo que tenemos en postman
    user_id: "312kigax2lkwdmyh4rabbqb6vjl4",
  };

  return config;
}
