Feature: Obtener canciones de una playlist aleatoria del usuario

Background:
  * callonce read('classpath:apitests/spotify/playlists/GET_Playlist_by_id_user.feature')
  * def playlistId = selectedId
  * header Authorization = 'Bearer ' + token

Scenario: Obtener canciones de una playlist específica
  Given url baseUrl
  And path 'playlists', playlistId, 'tracks'
  And param market = 'ES'
  When method GET
  Then status 200
* def canciones = response.items.map(function(x) { return x.track.name })
* print 'Canciones:', canciones

# Caso de Prueba 5 TC-P05 Get playlist Cover Image - Fail 

Scenario: obtener imagen de portada de la playlist con id invalido
  Given url baseUrl
  * def invalidPlaylistId = playlistId + '1'
  And path 'playlists/' + invalidPlaylistId + '/images'
  When method GET
  Then status 404
  * print response