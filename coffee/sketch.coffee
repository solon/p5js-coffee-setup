locs =[]
# -------------
# Setup
#-------------
setup = ->
  c = createCanvas windowWidth, windowHeight
  res = 20
  countX = ceil(width/res) + 1;
  countY = ceil(height/res) + 1;

  for i in [0..countX]
    for j in [0..countY]
      locs.push new p5.Vector res*i, res*j

  noFill()
  stroke 249, 78, 128
  return

#-------------
# Draw
#-------------
draw = ->
  background 39, 97, 47

  for loc in locs.reverse()
    h = calcVec loc.x - mouseX, loc.y - mouseY
    push()
    translate loc.x, loc.y
    rotate h.heading()
    ellipse 0, 0, 3, 11
    pop()

  return

calcVec = (x, y) ->
  new p5.Vector y - x, -x - y
