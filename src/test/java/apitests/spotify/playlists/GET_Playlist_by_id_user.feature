Feature: Contiene test tipo GET para obtener una playlist por ID de usuario
  Background:
    * header Authorization = 'Bearer ' + token
    * def userId = user_id
  Scenario: Obtener listas de reproducción de un usuario específico
    Given url baseUrl
    # El endpoint es /v1/users/{{user_id}}/playlists
    And path 'users/' + userId + '/playlists'
    When method GET
    Then status 200
    * print response

    * def playlists = response.items
    #* def playlistNames = playlists.map(function(p) { return p.name; })
    * def playlistIds = playlists.map(function(p) { return p.id; })
    * def randomIndex = Math.floor(Math.random() * playlistIds.length)
    * def selectedId = playlistIds[randomIndex]
    * print 'Playlists disponibles:', playlistIds
    * print 'Seleccionada aleatoriamente:', selectedId
