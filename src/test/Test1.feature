Feature: API tests

  Background:
    * url 'https://api.themoviedb.org/3'
    * header Accept = 'application/json'

  Scenario: As a Create request token
    Given path '/authentication/token/new'
    And param api_key = '68862c91acc87a7b9f8b3275f2413612'
    When method GET
    Then status 200
    And print response

  Scenario:  Create Session with login
    Given path '/authentication/token/validate_with_login'
    And param api_key = '68862c91acc87a7b9f8b3275f2413612'
    And request {"username": "juanppb", "password": "Qwer1234", "request_token": "4e9fd28e9df8fd1c64bae6bbcaf6dfa746a75ccb"}
    When method POST
    Then status 200
    And print response
    
  Scenario: Create Session
    Given path '/authentication/session/new'
    And param api_key = '68862c91acc87a7b9f8b3275f2413612'
    And request {"request_token": "4e9fd28e9df8fd1c64bae6bbcaf6dfa746a75ccb"}
    When method POST
    Then status 200
    And print response

  Scenario: Create List
    Given path '/list'
    And param api_key = '68862c91acc87a7b9f8b3275f2413612'
    And param session_id = '6bb7e52f88b362b111158a877e997c67c732856f'
    And request {"name": "This is my awesome test list.", "description": "Just an awesome list dawg.", "language": "en"}
    When method POST
    Then status 201
    And print response

  Scenario: Add Movie
    Given path '/list/8193337/add_item'
    And param api_key = '68862c91acc87a7b9f8b3275f2413612'
    And param session_id = '6bb7e52f88b362b111158a877e997c67c732856f'
    And request {"media_id": 60735}
    When method POST
    Then status 201
    And print response

  Scenario: Delete list
    Given path '/list/8193345'
    And param api_key = '68862c91acc87a7b9f8b3275f2413612'
    And param session_id = '6bb7e52f88b362b111158a877e997c67c732856f'
    When method DELETE
    Then status 201
    And print response