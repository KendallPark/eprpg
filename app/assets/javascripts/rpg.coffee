app = angular.module("Rpg", ["ngResource"])

app.factory "Programmer", ($resource) ->
  $resource("/programmers/:id", {id: "@id"}, {update: {method: "PUT"}})

@RpgCtrl = ($scope, Programmer) ->
  $scope.programmers = Programmer.query()
  $moves = [
    name: "kick"
    func: (p1, p2) ->
      [0, -10, "foo"]
  ,
    name: "punch"
    func: (p1, p2) ->
      [0, -20, "bar"]
  ,
    name: "rest"
    func: (p1, p2) ->
      [10, 0, "zzzz"]
  ,
  ]
  
  $scope.addProgrammer = -> 
    programmer = Programmer.save($scope.newProgrammer)
    $scope.programmers.push($scope.newProgrammer)
    $scope.newProgrammer = {}
    
  $scope.fight = ->
    $scope.turn = 0
    $scope.console = "A wild #{$scope.secondFighter.name} has appeared! What will #{$scope.firstFighter.name} do?"
    angular.forEach $scope.programmers, (prog) ->
      prog.currenthp = prog.hp
      prog.moves = $moves.slice(0,3)

  $scope.executeMove = ($move, $attacker, $defender) ->
    $results = $move($attacker, $defender)
    $attacker.currenthp += $results[0]
    $defender.currenthp += $results[1]
    $scope.console = $results[2]
    $scope.turn++

  $scope.is1Turn = ->
    return $scope.turn % 2 == 1

  $scope.is2Turn = ->
    return $scope.turn % 2 == 0
        
$ ->
  $('#new-form, #fight').hide()
  $('#show-new-form').click (e) ->
    e.preventDefault()
    $('#new-form').slideDown()
  $('.hide-new-form').click ->
    $('#new-form').slideUp()
    
  $('#fight-button').click (e) ->
    e.preventDefault()
    $('#bank, #page-title').slideUp()
    $('#fight').slideDown()
    
    
    
    
