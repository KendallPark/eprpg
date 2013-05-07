app = angular.module("Rpg", ["ngResource"])

app.factory "Programmer", ($resource) ->
  $resource("/programmers/:id", {id: "@id"}, {update: {method: "PUT"}})

@RpgCtrl = ($scope, Programmer) ->
  $scope.programmers = Programmer.query() 
  $scope.moves = [
    name: "kick"
    func: (p1, p2) ->
      [0, -10, "foo"]
  ,
    name: "punch"
    func: (p1, p2) ->
      [0, -20, "bar"]
  ]
  
  $scope.addProgrammer = -> 
    programmer = Programmer.save($scope.newProgrammer)
    $scope.programmers.push($scope.newProgrammer)
    $scope.newProgrammer = {}
    
  $scope.fight = ->
    setTimeout (->
      alert "Gene wins!"
    ), 500
        
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
    
    
    
    
