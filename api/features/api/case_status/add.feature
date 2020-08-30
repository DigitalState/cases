@api @case_status @add
Feature: Add case statuses

  Background:
    Given I am authenticated as the "system@system.ds" user from the tenant "b6ac25fe-3cd6-4100-a054-6bba2fc9ef18"

  Scenario: Add a case status
    When I add "Accept" header equal to "application/json"
    And I add "Content-Type" header equal to "application/json"
    And I send a "POST" request to "/case_statuses" with body:
    """
    {
      "case": "/cases/c61f05ce-468f-4b21-ad38-512ea549e210",
      "createdAt": "2000-01-01 12:00:00",
      "owner": "BusinessUnit",
      "ownerUuid": "83bf8f26-7181-4bed-92f3-3ce5e4c286d7",
      "identity": "Individual",
      "identityUuid": "9ce3bdb9-47e1-43c9-81ee-0dcc2106ba42",
      "title": {
        "en": "Title - add",
        "fr": "Titre - add"
      },
      "description": {
        "en": "Description - add",
        "fr": "Description - add"
      },
      "data": {
        "en": {
          "test": "Test - add"
        },
        "fr": {
          "test": "Test - add"
        }
      },
      "version": 1
    }
    """
    Then the response status code should be 201
    And the header "Content-Type" should be equal to "application/json; charset=utf-8"
    And the response should be in JSON
    And the JSON node "id" should exist
    And the JSON node "id" should be equal to the number 13
    And the JSON node "uuid" should exist
    And the JSON node "createdAt" should exist
    And the JSON node "createdAt" should be equal to the string "2000-01-01T12:00:00+00:00"
    And the JSON node "updatedAt" should exist
    And the JSON node "deletedAt" should exist
    And the JSON node "deletedAt" should be null
    And the JSON node "owner" should exist
    And the JSON node "owner" should be equal to the string "BusinessUnit"
    And the JSON node "ownerUuid" should exist
    And the JSON node "ownerUuid" should be equal to the string "83bf8f26-7181-4bed-92f3-3ce5e4c286d7"
    And the JSON node "title" should exist
    And the JSON node "title.en" should exist
    And the JSON node "title.en" should be equal to "Title - add"
    And the JSON node "title.fr" should exist
    And the JSON node "title.fr" should be equal to "Titre - add"
    And the JSON node "description" should exist
    And the JSON node "description.en" should exist
    And the JSON node "description.en" should be equal to "Description - add"
    And the JSON node "description.fr" should exist
    And the JSON node "description.fr" should be equal to "Description - add"
    And the JSON node "data" should exist
    And the JSON node "data.en" should exist
    And the JSON node "data.en.test" should exist
    And the JSON node "data.en.test" should be equal to "Test - add"
    And the JSON node "data.fr" should exist
    And the JSON node "data.fr.test" should exist
    And the JSON node "data.fr.test" should be equal to "Test - add"
    And the JSON node "version" should exist
    And the JSON node "version" should be equal to the number 1
    And the JSON node "tenant" should exist
    And the JSON node "tenant" should be equal to "b6ac25fe-3cd6-4100-a054-6bba2fc9ef18"

  Scenario: Read the added case
    When I add "Accept" header equal to "application/json"
    And I send a "GET" request to "/case_statuses?id=13"
    Then the response status code should be 200
    And the header "Content-Type" should be equal to "application/json; charset=utf-8"
    And the response should be in JSON
    And the JSON should be valid according to this schema:
    """
    {
      "type": "array",
      "minItems": 1,
      "maxItems": 1
    }
    """
