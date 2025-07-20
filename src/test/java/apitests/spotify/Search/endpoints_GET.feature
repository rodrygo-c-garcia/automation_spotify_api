Feature: Buscar música con nombre de artista inexistente

  Background:
    * header Authorization = 'Bearer ' + token
    * def market = 'BO'
    
  @search_invalid_artist
  Scenario: Buscar música con nombre de artista inexistente
    Given url baseUrl
    And path 'search'
    And param q = 'artist:askdjashdjkas'
    And param market = market
    And param type = 'track'
    And param limit = 2
    When method get
    Then status 200
    * print response
    And match response.tracks.items == []