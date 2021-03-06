-- Affiche des traces dans la console pendant l'exécution (Pas de mémoire tampon)
io.stdout:setvbuf('no')

-- Indipensable pour du pixel art (Ne filtre pas les contours des images lors de la redimension)
love.graphics.setDefaultFilter("nearest")

-- Déboguage pas à pas dans la console
if arg[#arg] == "-debug" then require("mobdebug").start() end

pad = {
  x = 0,
  y = 0,
  width = 100,
  height = 20
}

ball = {
  x = 200,
  y = 200,
  ray = 10,
  stick = true,
  vx = 0,
  vy = 0
}

-- Charger une fois au démarrage
function love.load()
  --Récupération de la taille de l'écran
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  pad.y = hauteur - (pad.height / 2)
  
  Start()
end

-- Recharger 60 fois par seconde (ou autant que faire se peut)
function love.update(dt)
  pad.x = love.mouse.getX()
  
  if ball.stick == true then
    ball.x = pad.x
    ball.y = pad.y - pad.height / 2 - ball.ray
  else
    ball.x = ball.x + (ball.vx * dt)
    ball.y = ball.y + (ball.vy * dt)
  end
  
  if ball.x > largeur then
    ball.vx = 0 - ball.vx
    ball.x = largeur
  end
  if ball.x < 0 then
    ball.vx = 0 - ball.vx
    ball.x = 0
  end
  if ball.y < 0 then
    ball.vy = 0 - ball.vy
    ball.y = 0
  end
  
  if ball.y > hauteur then-- and ball.x > pad.x - (pad.width / 2) and ball.x < pad.x + (pad.width / 2)then
    ball.stick = true
  end

  ball.x = ball.x + ball.vx
  ball.y = ball.y + ball.vy
    
end

-- Affichage à l'écran
function love.draw()
  love.graphics.rectangle("fill", pad.x - (pad.width / 2), pad.y - (pad.height / 2 ), pad.width, pad.height)
  love.graphics.circle("fill", ball.x, ball.y, ball.ray)
  
end

function Start()
  ball.stick = true
  
end

function love.mousepressed(x, y, b)
  if ball.stick == true and b == 1 then
    ball.stick = false
    ball.vx = 7
    ball.vy = -7
  end
  
end

