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
      "BQD1-nkIaPdXsUy8DgJ1Nrh7nDTCRWBnBT4AsAmwcxhCJJZrYLzNEA5toXBaoG685wMny1Jc_6Dx0oHYv6BxgQSx2zDt2pEG15Xx82ekzNNOIfmWgZDnjHaBkQmq1T7nrzgU64p1sZ4Yr520OArkG_A-JiH-2vJbMWcOLfvAXeDc5Cf2hVpZh050WzNqnWKOhEQCjhPmOXTLTiWk8DqdpQmUTcGNPE6HUBQqUmB_11ADzWEG4u80D3LhcjUUqIdxu1FQpKrE4e1Etu_CDDBgd2xhuHyiTiE06J_Iimmms9ouCUHU2qv1t8-ZkrcGkXmyi_aV16TgrFZLYPiwunv-EJARoHMiQ5h8cAU3CdMYCdnObEZQPEbRhe280Hjk",
    // el token reemplaza con lo que tenemos en postman
    user_id: "312kigax2lkwdmyh4rabbqb6vjl4",
  };

  return config;
}
