Feature: Contiene los tests que hacen llamado a los endpoints de tipo GET para spotify

  Background:
    * header Authorization = 'Bearer ' + token
    * def userId = user_id
    
  @playlist_GET
  Scenario: Obtener los playlists del usuario autenticado
    Given url baseUrl
    And path 'users/' + userId + '/playlists'
    When method get
    Then status 200
