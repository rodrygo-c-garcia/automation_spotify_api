Feature: Eliminar una cancion de una playlist teniendo el uri de la cancion 
    Background:
        * header Authorization = 'Bearer ' + token
        * def userId = user_id
    
    Scenario: Eliminar una cancion de una playlist con uri completo
        Given url baseUrl
        # https://api.spotify.com/v1/playlists/:id_playlist/tracks
        * def playlistId = '62WUgcytjGReiGCHCLVkiA' 
        And path 'playlists/' + playlistId + '/tracks'
        * def requestBody = 
        """
        {
            "tracks": [
                {
                    "uri": "spotify:track:0gcZzig5VyR2MHSjCM5FbV"
                }
            ]
        }
        """
        And request requestBody
        When method DELETE
        Then status 200
        * print response