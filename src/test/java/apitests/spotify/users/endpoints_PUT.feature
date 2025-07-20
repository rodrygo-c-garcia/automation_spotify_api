@follow_playlist_PUT
Feature: Contiene los tests que hacen llamado a los endpoints de tipo PUT para spotify

  Background:
    * header Authorization = 'Bearer ' + token
    * def userId = user_id
    * def playlistId = '0ewRU6vDrDDzQxivxglltI'

  @follow_playlist_PUT_public
  Scenario: Seguir un playlist como público
    Given url baseUrl
    And path 'playlists/' + playlistId + '/followers'
    And request { "public": true }
    And header Content-Type = 'application/json'
    When method put
    Then status 200
    # Verificar que no hay contenido en la respuesta (expected behavior)
    And match response == ''

    # Validación adicional: Verificar que el usuario ahora sigue el playlist
    * header Authorization = 'Bearer ' + token
    Given url baseUrl
    And path 'playlists/' + playlistId + '/followers/contains'
    And param ids = userId
    When method get
    Then status 200
    And match response[0] == true

    # Validación adicional: Dejar de seguir el playlist
    * header Authorization = 'Bearer ' + token
    Given url baseUrl
    And path 'playlists/' + playlistId + '/followers'
    When method delete
    Then status 200
    # Verificar que no hay contenido en la respuesta
    And match response == ''

  @follow_playlist_PUT_private
  Scenario: Seguir un playlist como privado
    Given url baseUrl
    And path 'playlists/' + playlistId + '/followers'
    And request { "public": false }
    And header Content-Type = 'application/json'
    When method put
    Then status 200
    # Verificar que no hay contenido en la respuesta
    And match response == ''

    # Validación adicional: Verificar que el usuario ahora sigue el playlist
    * header Authorization = 'Bearer ' + token
    Given url baseUrl
    And path 'playlists/' + playlistId + '/followers/contains'
    And param ids = userId
    When method get
    Then status 200
    And match response[0] == true

    # Validación adicional: Dejar de seguir el playlist
    * header Authorization = 'Bearer ' + token
    Given url baseUrl
    And path 'playlists/' + playlistId + '/followers'
    When method delete
    Then status 200
    # Verificar que no hay contenido en la respuesta
    And match response == ''

  @follow_playlist_PUT_default
  Scenario: Seguir un playlist sin especificar public (default true)
    Given url baseUrl
    And path 'playlists/' + playlistId + '/followers'
    And request {}
    And header Content-Type = 'application/json'
    When method put
    Then status 200
    # Verificar que no hay contenido en la respuesta
    And match response == ''

    # Validación adicional: Verificar que el usuario ahora sigue el playlist
    * header Authorization = 'Bearer ' + token
    Given url baseUrl
    And path 'playlists/' + playlistId + '/followers/contains'
    And param ids = userId
    When method get
    Then status 200
    And match response[0] == true

    # Validación adicional: Dejar de seguir el playlist
    * header Authorization = 'Bearer ' + token
    Given url baseUrl
    And path 'playlists/' + playlistId + '/followers'
    When method delete
    Then status 200
    # Verificar que no hay contenido en la respuesta
    And match response == ''

  @follow_playlist_PUT_no_body
  Scenario: Seguir un playlist sin body (debería usar default public=true)
    Given url baseUrl
    And path 'playlists/' + playlistId + '/followers'
    And request ""
    When method put
    Then status 200
    # Verificar que no hay contenido en la respuesta
    And match response == ''