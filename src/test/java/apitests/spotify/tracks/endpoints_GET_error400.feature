Feature: Obtener tracks sin proporcionar IDs (caso negativo)

  Background:
    * header Authorization = 'Bearer ' + token

  @get_tracks_missing_ids
  Scenario: Intentar obtener tracks sin enviar el parámetro 'ids'
    Given url baseUrl
    And path 'tracks'
    And param ids = ''
    When method get
    Then status 400
    And match response ==
    """
    {
      error: {
        status: 400,
        message: "Missing required field: ids"
      }
    }
    """
