Feature: Contiene los tests que hacen llamado al endpoint de Albums con los metodos de tipo PUT y DELETE para spotify

  Background:
    * header Authorization = 'Bearer ' + token
    * def albumId = '5GuWww4OaildzkmTTlfMN3'

  @save_album
  Scenario: Guardar un álbum en la biblioteca del usuario autenticado
    Given url baseUrl
    And path 'me', 'albums'
    * def payload = 
      """
      {
        "ids": ["#(albumId)"]
      }
      """
    And request payload
    When method put
    Then status 200
  
  @delete_album
  Scenario: Eliminar un álbum de la biblioteca del usuario autenticado
    Given url baseUrl
    And path 'me', 'albums'
    * def payload = 
      """
      {
        "ids": ["#(albumId)"]
      }
      """
    And request payload
    When method delete
    Then status 200