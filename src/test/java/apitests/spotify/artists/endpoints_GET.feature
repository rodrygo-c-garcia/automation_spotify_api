Feature: Obtener artista con ID inválido o inexistente

  Background:
    * header Authorization = 'Bearer ' + token
    * def invalidArtistId = '3fMbdgg4jU18AjLCKBhRSM'
    
  @get_artist
  Scenario: Intentar obtener detalles de un artista con ID inválido
    Given url baseUrl
    And path 'artists/',invalidArtistId
    When method get
    Then status 404
    And match response.error.status == 404
    And match response.error.message contains 'Resource not found'