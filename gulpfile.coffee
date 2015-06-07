gulp = require 'gulp'
coffee = require 'gulp-coffee'
connect = require 'gulp-connect'
colors = require 'colors'
watch = require 'gulp-watch'
gutil = require 'gulp-util'
sourcemaps = require 'gulp-sourcemaps'

coffeeSources = [
  'coffee/*.coffee'
]

gulp.task 'coffee', () ->
  gulp.src coffeeSources
  .pipe sourcemaps.init()
  .pipe coffee { bare: true }
  .on 'error', gutil.log
  .pipe sourcemaps.write()
  .pipe gulp.dest 'js'

gulp.task 'watch-coffee', () ->
  gulp.watch coffeeSources, ['coffee']

gulp.task 'connect', () ->
  #Start a server
  connect.server {
    root: ''
    port: 3000
    livereload: true
  }

  console.log '[CONNECT] Listening on port 3000'.yellow.inverse
  # Watch HTML files for changes
  console.log '[CONNECT] Watching files for live-reload'.blue
  watch {
    glob: ['./js/**.js', './css/**.css', './index.html']
  }
  .pipe connect.reload()

gulp.task 'default', [
  'coffee'
  'connect'
  'watch-coffee'
]
