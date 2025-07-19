Feature: Contiene los tests que hacen llamado a los endpoints de tipo GET para spotify

  Background:
    * header Authorization = 'Bearer ' + token
    * def userId = user_id

  @me_GET
  Scenario: Ver la informacion del usuario autenticado
    Given url baseUrl
    And path 'me'
    When method get
    Then status 200

