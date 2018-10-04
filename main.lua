-- Affiche des traces dans la console pendant l'exécution (Pas de mémoire tampon)
io.stdout:setvbuf('no')

-- Indipensable pour du pixel art (Ne filtre pas les contours des images lors de la redimension)
love.graphics.setDefaultFilter("nearest")

-- Déboguage pas à pas dans la console
if arg[#arg] == "-debug" then require("mobdebug").start() end

pad = {
  x = 100,
  y = 20,
  posX = 0,
  posY = 0
}

ball = {
  x = 200,
  y = 200,
  ray = 10
}

-- Charger une fois au démarrage
function love.load()
  --Récupération de la taille de l'écran
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  posY = hauteur - pad.y
  
end

-- Recharger 60 fois par seconde (ou autant que faire se peut)
function love.update(dt)
  posX = love.mouse.getX() - pad.x / 2
  ball.x = posX + pad.x / 2
  ball.y = posY - ball.ray
end

-- Affichage à l'écran
function love.draw()
  love.graphics.rectangle("fill", posX, posY, pad.x, pad.y)
  love.graphics.circle("fill", ball.x, ball.y, ball.ray)
end