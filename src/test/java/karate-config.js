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
    token: 'BQDkE2TSMHtEqY-JrbGh6cWCOQ6DbJ-OlgsUne-Rz9kmQKoj167o3zwcD3ZXVkmJuhNeL2IRLAAZLZ_vVgKg85zYm5eDXShq9jDW5ZSZejvd8o1bMj5GBXbLpWFf-oIRzed9KKnNrcILYwKz95ypC6F4Q_mh6_BKFEr_2glLbPqVkRz-Nk-M3B1eJR3qXC-anF1dzB4y2y_YINvq5Swp0OBEtCeHHCz9Rg1LFVdskYunqRStFaa4t6Ii9GyXuN3p1-Urk1fxEq_uXdLZkpJ_ivQTRrFPDO2RcQypr8i5v1JoQmgOGXPVbMoVZx-3bBm69pfk0SWiAcMBTzxsOI6JWBRa5gScALY-y3ye97UD2D6nEeXBIdgQNHASauQF',
    // el token reemplaza con lo que tenemos en postman
    user_id: "312kigax2lkwdmyh4rabbqb6vjl4",
  };

  return config;
}

