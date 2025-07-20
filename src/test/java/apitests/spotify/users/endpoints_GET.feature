@me_GET
Feature: Contiene los tests que hacen llamado a los endpoints de tipo GET para spotify

  Background:
    * header Authorization = 'Bearer ' + token
    * def userId = user_id
    * def validateEmail = read('classpath:utils/validateEmail.js')
    * def validateSpotifyUserUrl = read('classpath:utils/validateSpotifyUserUrl.js')
    * def validateSpotifyUri = read('classpath:utils/validateSpotifyUri.js')
    * def validateProductType = read('classpath:utils/validateProductType.js')
    * def validateFollowersCount = read('classpath:utils/validateFollowersCount.js')

  @me_GET_basic_info
  Scenario: Verificar información básica del usuario autenticado
    Given url baseUrl
    And path 'me'
    When method get
    Then status 200
    # Verificaciones básicas
    And assert response.id == userId
    And match response.display_name == '#string'
    And match response.type == 'user'
    And match response.country == '#string'

  @me_GET_contact_info
  Scenario: Verificar información de contacto del usuario
    Given url baseUrl
    And path 'me'
    When method get
    Then status 200
    # Validaciones de contacto
    And call validateEmail response.email
    And call validateSpotifyUserUrl response.external_urls.spotify
    And call validateSpotifyUri response.uri

  @me_GET_social_info
  Scenario: Verificar información social del usuario
    Given url baseUrl
    And path 'me'
    When method get
    Then status 200
    # Validaciones sociales
    And call validateFollowersCount response.followers.total
    And match response.images == '#array'
    And match each response.images == { height: '#number?', width: '#number?', url: '#string' }

  @me_GET_subscription_info
  Scenario: Verificar información de suscripción del usuario
    Given url baseUrl
    And path 'me'
    When method get
    Then status 200
    # Validaciones de suscripción
    And call validateProductType response.product
    And match response.explicit_content == { filter_enabled: '#boolean', filter_locked: '#boolean' }