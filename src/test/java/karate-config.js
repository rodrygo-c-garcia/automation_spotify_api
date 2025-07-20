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
      "BQDzUTpuQoXFwLbLh8-aJe5nRoVZH_ever0xjeUnvScuHnLNNXr3RKs_vOhFz7Pk3WfpCoW-KVdmwGf_CYR3CYpEgwZtfbCy1FvRu757Q8vlYsHkXtlU-qF99lljZ5RUIqEmZFUNLMBOHx_CzIxjKfLt3FOBxMRrOKgcHIg1ct7fXq6UakzcnXXIEKXtwYfoNbFdTeJDiQ4fgr8s-mRyeM-Dy7reuImVAA-2OMoAR8VrgGR9ihpS1Qdh1chaP2mCbm5BIdflG9ZtA1KVcBAYVL-kfX6cuhZ0fJdszvwhFXk873sY01PLs30RssZ7jByaQeeNAzS_s83xaeBRhJWdT5W1OcooLtmy_0aZIMSSFd-BJe874OzeWqJUMk0s",
    // obten el nuevo token desde el postman
    user_id: "312kigax2lkwdmyh4rabbqb6vjl4",
  };

  return config;
}
