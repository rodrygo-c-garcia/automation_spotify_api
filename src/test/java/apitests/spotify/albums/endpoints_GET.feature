Feature: Contiene el test que hace un llamado al endpoint de Albums con el metodo de tipo GET para spotify

  Background:
    * header Authorization = 'Bearer ' + token
    * def albumId = '17ScNnJ0lSWajodZaRpHdQ'

  @album_contains_GET
  Scenario: Verificar si el álbum está en la biblioteca de favoritos del usuario
    Given url baseUrl
    And path 'me', 'albums', 'contains'
    And param ids = albumId
    When method get
    Then status 200
    And match response == [true]
