Feature: Contiene test tipo GET para obtener una playlist por ID de usuario
  Background:
    * header Authorization = 'Bearer ' + token
    * header Content-Type = 'application/json'
    * def userId = user_id
  Scenario: Crear una nueva playlist con body incompleto sin name
    Given url baseUrl
    # /v1/users/{{user_id}}/playlists
    And path 'users/' + userId + '/playlists'
    # "name": "Nueva Playlist",
    * def requestBody = 
    """
    {
        "description": "Playlist description para pruebas",
        "public": false
    }
    """
    And request requestBody
    When method POST
    * print response
    Then status 400

    Scenario: Crear una nueva playlist con body completo pero name vacio o espcio en blanco
    Given url baseUrl
    # /v1/users/{{user_id}}/playlists
    And path 'users/' + userId + '/playlists'
    * def requestBody = 
    """
    {
        "name": "",
        "description": "Playlist description para pruebas 2",
        "public": false
    }
    """
    And request requestBody
    When method POST
    * print response
    Then status 400
