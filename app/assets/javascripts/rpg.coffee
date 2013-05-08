app = angular.module("Rpg", ["ngResource"])

app.factory "Programmer", ($resource) ->
  $resource("/programmers/:id", {id: "@id"}, {update: {method: "PUT"}})

@RpgCtrl = ($scope, Programmer) ->
  $scope.programmers = Programmer.query()
  $moves = [
    name: "coding fury"
    func: (p1, p2) ->
      damage = Math.floor((p1.l337n355 + p1.caffeination)*.75)
      miss = Math.floor(Math.random()*100) < 10 + p2.caffeination*2 - p2.tallness
      crit = Math.floor(Math.random()*100) < p1.swag
      message = "#{p1.name} unleased a fury of code on #{p2.name}!"
      if miss
        message += " Code failed to compile!"
        damage = 0
      else if crit
        damage *= 3
        message += " Critical hit!!! #{p1.name} dealt a whopping #{damage} damage to #{p2.name}!!!"
      else
        message += " #{p1.name} dealt #{damage} damage to #{p2.name}."
      [0, -damage, message]
  ,
    name: "falcon punch"
    func: (p1, p2) ->
      damage = Math.floor(p1.tallness + p1.caffeination + p1.swag/2)
      miss = Math.floor(Math.random()*100) < 30 + p2.caffeination*2 - p2.tallness
      crit = Math.floor(Math.random()*100) < p1.swag
      message = "#{p1.name} falcon punched #{p2.name}!"
      if miss
        message += " Attack missed!"
        damage = 0
      else if crit
        damage *= 3
        message += " Critical hit!!! #{p1.name} dealt a whopping #{damage} damage to #{p2.name}!!!"
      else
        message += " #{p1.name} dealt #{damage} damage to #{p2.name}."
      [0, -damage, message]
  ,
    name: "office nap"
    func: (p1, p2) ->
      hp = 20 - p1.tallness - p1.caffeination + Math.floor(Math.random()*10)
      [hp, 0, "#{p1.name} took a quick nap! #{p1.name} recovered #{hp} HP!"]
  ,
  ]
  $lukeMoves = [
    name: "brotein shake"
    func: (p1, p2) ->
      damage = Math.floor((p1.tallness + p1.swag - p1.caffeination)/2)
      miss = Math.floor(Math.random()*100) < 50 + p2.caffeination*2 - p2.tallness
      crit = Math.floor(Math.random()*100) < p1.swag
      message = "#{p1.name} chugged a brotein shake!"
      heal = damage*2
      if miss
        damage = 0
      else if crit
        heal *= 3
        message += " Critical mass gained!!!"
      else
        message += " #{p1.name} intimidated #{damage} HP out of #{p2.name}."
      message += " #{p1.name} made #{heal} gains in buffness!"
      [heal, -damage, message]
  ,
  ]
  $bobMoves = [
    name: "\"meetings\""
    func: (p1, p2) ->
      damage = Math.floor(p1.l337n355 + p1.caffeination + p1.tallness)
      miss = Math.floor(Math.random()*100) < 50 + p2.caffeination*2 - p2.tallness
      crit = Math.floor(Math.random()*100) < p1.swag*2
      message = "#{p1.name} attended a \"meeting!\""
      if miss
        message += " The meeting was cancelled at the last minute."
        damage = 0
      else if crit
        damage *= 3
        message += " #{p1.name} deleted #{damage} lines of #{p2.name}'s code and forced #{p2.name} to start from scratch."
      else
        message += " #{p1.name} assigned #{p2.name} to #{damage} new projects."
      [0, -damage, message]
  ,
  ]
  $geneMoves = [
    name: "self destruct" 
    func: (p1, p2) ->
      damage = Math.floor((p1.l337n355 + p1.caffeination)*5)
      miss = Math.floor(Math.random()*100) < 10 + p2.caffeination*2 - p2.tallness
      message = "#{p1.name} activated its self destruct sequence."
      if miss
        message += " Error: #{p1.name} does not have sufficient permissions to perform this action."
        damage = 0
      else
        message += " Auto-combustion in 3... 2... 1... BOOM!!!"
      [-damage, -damage, message]
  ,
  ]
  $jesseMoves = [
    name: "bear hug" 
    func: (p1, p2) ->
      damage = Math.floor(p1.tallness + p1.swag)
      miss = Math.floor(Math.random()*100) < 10 + p2.caffeination*2 - p2.tallness
      crit = Math.floor(Math.random()*100) < p1.swag*2
      message = "#{p1.name} gave #{p2.name} a big bear hug."
      if miss
        message += " #{p2.name} did not want to snuggle."
        damage = 0
      else if crit
        damage *= 3
        message += " Critical hug!!! #{p1.name} burst into flames and squeezed #{damage} HP out of #{p2.name}!!!"
      else
        message += " #{p1.name} squeezed #{damage} HP out of #{p2.name}."
      [0, -damage, message]
  ,
  ]
  $kendallMoves = [
    name: "science" 
    func: (p1, p2) ->
      damage = Math.floor(p1.l337n355 + p1.swag)
      miss = Math.floor(Math.random()*100) < 10 + p2.caffeination*2 - p2.tallness
      crit = Math.floor(Math.random()*100) < p1.swag*2
      message = "#{p1.name} used science!"
      if miss
        message += " #{p2.name} does not believe in science."
        damage = 0
      else if crit
        damage *= 2
        message += " Nobel Prize!!! #{p1.name} obliterated #{damage} of #{p2.name}'s worldview through scientific domination!!!"
      else
        message += " #{p1.name} debunked #{damage} of #{p2.name}'s preconceived notions about realtity through scientific experimentation."
      [0, -damage, message]
  ,
  ]
  $ordieMoves = [
    name: "segway charge" 
    func: (p1, p2) ->
      damage = Math.floor(p1.swag*2)
      miss = Math.floor(Math.random()*100) < 10 + p2.caffeination - p2.tallness
      crit = Math.floor(Math.random()*100) < p1.swag
      message = "#{p1.name} charged #{p2.name} on his segway."
      if miss
        message += " #{p2.name} successfully evaded the segway."
        damage = 0
      else if crit
        damage *= 3
        message += " Gyroscope magic!!! #{p1.name} ran over #{p2.name}, causing #{damage} damage!!!"
      else
        message += " #{p1.name} rammed into #{p2.name}, causing #{damage} damage."
      [0, -damage, message]
  ,
  ]
  $defaultMoves = [
    name: "quit"
    func: (p1, p2) ->
      message = "#{p1.name} quits!"
      [0, -200, message]
  ,
  ]
  
  $scope.addProgrammer = -> 
    programmer = Programmer.save($scope.newProgrammer)
    $scope.programmers.push($scope.newProgrammer)
    $scope.newProgrammer = {}
    
  $scope.fight = ->
    $scope.turn = 0
    $scope.gameover = false
    $scope.console = "A wild #{$scope.secondFighter.name} has appeared! What will #{$scope.firstFighter.name} do?"
    angular.forEach $scope.programmers, (prog) ->
      prog.currenthp = prog.hp
      prog.moves = $moves.slice(0,3)
      prog.specialmoves = switch prog.name
        when "Luke" then $lukeMoves
        when "Bob" then $bobMoves
        when "Gene" then $geneMoves
        when "Jesse" then $jesseMoves
        when "Kendall" then $kendallMoves
        when "Ordie" then $ordieMoves
        else $defaultMoves

  $scope.executeMove = ($move, $attacker, $defender) ->
    $results = $move($attacker, $defender)
    $attacker.currenthp += $results[0]
    $defender.currenthp += $results[1]
    $scope.console = $results[2]
    if $defender.currenthp <=0
      $defender.currenthp = 0
      $scope.gameover = true
      setTimeout (->
        confirm "#{$attacker.name} wins!"
        window.location.reload()
      ), 500

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
    
    
    
    
