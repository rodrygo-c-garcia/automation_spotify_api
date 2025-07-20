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

    @get_artist_albums
    Scenario: Obtener álbumes de un artista con ID válido
        * def artistId = '3fMbdgg4jU18AjLCKBhRSm'
        Given url baseUrl
        And path 'artists', artistId, 'albums'
        And param include_groups = 'album,single'
        And param market = 'BO'
        And param limit = 3
        When method get
        Then status 200
        * assert response.items.length <= 3