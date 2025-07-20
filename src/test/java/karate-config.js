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
      "BQD6EG1GiTijXsv2S_EhzJzfLctc0UwXva5Z7n_RNK_rSee6vbBVxUYI-xPyZdzU0cNM_MnMsBoPh0oyBbLVw-JVywAw0YDVI1-l2_uMngccT6d7NsF6ZUOchG-B6IiDMaoUEDVr-uXMf3a2oXzxOtfyZ8ML61fgExuqrWFGwhbfXPKnclaGlRMk96areOIE7Gq746T5jj24PIQ2g7TCbxNusbfOuItiSPare1vX9Gssdjrr1xkFFYAeA5Eu4fjHRF3JzmuIBpudrMcPESjALaeuoVURpaVVVZTLMxduaKYp3fBuSAipArmgJv-xoyIqu9t6gRjSXF6MaM9qSGeMBpCAnF3iqm61onIkB_p42SruPznsYLYM0NCF0I37",
    // el token reemplaza con lo que tenemos en postman
    user_id: "312kigax2lkwdmyh4rabbqb6vjl4",
  };

  return config;
}
