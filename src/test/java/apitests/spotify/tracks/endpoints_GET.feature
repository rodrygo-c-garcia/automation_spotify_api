Feature: Contiene los tests que hacen llamado a los endpoints de tipo GET para spotify

  Background:
    * header Authorization = 'Bearer ' + token
    * def trackId = '6gurRCQTLcBNkakApASMdi'
    * def invalidTrackId = 'invalid123'
    * def market = 'ES'

  @get_track
  Scenario: Obtener información de un track usando su ID y mercado
    Given url baseUrl
    And path 'tracks', trackId
    And param market = market
    When method get
    Then status 200
    And match response.id == trackId
    And match response.name == 'Ace Trumpets'
    And match response.track_number == 1
    And match response.artists[0].name == 'Clipse'
    And match response.artists[0].id == '2J257euzcjnDLipsyJH3F2'
    
  @get_track_invalid_id
  Scenario: Intentar obtener información de un track con un ID inválido
    Given url baseUrl
    And path 'tracks', invalidTrackId
    And param market = market
    When method get
    Then status 400 
    And match response.error.message contains 'Invalid base62 id'
