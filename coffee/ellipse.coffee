setup = ->
  createCanvas windowWidth, windowHeight
  background 255, 255, 255
  strokeWeight 2

  radius = 100;
  centerX = 250;
  centerY = 250;
  noFill()
  stroke 0, 30, 2
  ellipse centerX, centerY, radius*2, radius*2

  stroke 20, 50, 70
  strokeWeight 3

  noiseval = random(10)
  thisRadius = 0
  rad = 0
  radVariance = 0


  fill 20,50, 23, 50
  beginShape()

  for ang in [0..360]
    noiseval += 0.1
    radVariance = 30 * customNoise noiseval
    rad = radians ang
    thisRadius = radius + radVariance
    x = centerX + (thisRadius * cos rad)
    y = centerY + (thisRadius * sin rad)
    curveVertex x, y
  endShape(CLOSE)

  return

customNoise = (value) ->
  pow sin(value), 3