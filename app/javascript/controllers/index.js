// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AddressAutocompleteController from "./address_autocomplete_controller"
application.register("address-autocomplete", AddressAutocompleteController)

import GameController from "./game_controller"
application.register("game", GameController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MapController from "./map_controller"
application.register("map", MapController)

import MapbizController from "./mapbiz_controller"
application.register("mapbiz", MapbizController)

import SearchController from "./search_controller"
application.register("search", SearchController)

import SignUpController from "./sign_up_controller"
application.register("sign-up", SignUpController)

import TokensController from "./tokens_controller"
application.register("tokens", TokensController)
