Feature: Contiene test tipo PUT para actualizar detalles de una playlist
  Background:
    * header Authorization = 'Bearer ' + token
    * header Content-Type = 'application/json'
    * def userId = user_id

  Scenario: Actualizar una playlist con body completo
    * def id_playlist = '4IkRAlUN7W8KPgpOcSsIVi'
    Given url baseUrl
    And path 'users/' + userId + '/playlists/' + id_playlist
    * def requestBody =
    """
    {
      "name": "ChacareraUpdate",
      "description": "Actualizando desde automatizacion",
      "public": false
    }
    """
    And request requestBody
    When method PUT
    Then status 200
    * print response
