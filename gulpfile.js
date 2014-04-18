var gulp = require('gulp');
var jade = require('gulp-jade');
var livereload = require('gulp-livereload');
var plumber = require('gulp-plumber');
var stylus = require('gulp-stylus');
var browserify = require('gulp-browserify');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var minify = require('gulp-minify-css');

var paths = {
  src: './app/',
  dest: './public/',
  vendor: './vendor/',
  assets: './assets/'
}

gulp.task('assets', function() {
 gulp.src(paths.assets + "**")
    .pipe(plumber())
    .pipe(gulp.dest(paths.dest));
});

gulp.task('vendor-styles', function() {
  gulp.src([
      paths.vendor + 'styles/bootstrap.css',
      paths.vendor + 'styles/bootstrap-theme.css'
    ])
    .pipe(plumber())
    .pipe(concat("vendor.css"))
    .pipe(minify())
    .pipe(gulp.dest(paths.dest + 'css/'))
});

gulp.task('vendor-scripts', function() {
  gulp.src([
      paths.vendor + 'scripts/jquery.js',
      paths.vendor + 'scripts/bootstrap.js',
      paths.vendor + 'scripts/underscore.js',
      paths.vendor + 'scripts/backbone.js',
      paths.vendor + 'scripts/backbone.syphon.js',
      paths.vendor + 'scripts/backbone.marionette.js'
    ])
    .pipe(plumber())
    .pipe(concat("vendor.js"))
    // .pipe(uglify())
    .pipe(gulp.dest(paths.dest + 'js/'))
});

gulp.task('scripts', function() {
  gulp.src(paths.src + 'scripts/index.coffee', { read: false })
    .pipe(plumber())
    .pipe(browserify({
      debug: true,
      transform: ['coffeeify', 'jadeify'],
      extensions: ['.coffee', '.jade']
    }))
    .pipe(concat('index.js'))
    .pipe(gulp.dest(paths.dest + 'js/'))
});

gulp.task('html', function() {
  gulp.src(paths.src + 'index.jade')
    .pipe(plumber())
    .pipe(jade({
      pretty: true
    }))
    .pipe(gulp.dest(paths.dest))
});

gulp.task('styles', function () {
  gulp.src(paths.src + 'styles/**/*.styl')
    .pipe(plumber())
    .pipe(stylus({ use: ['nib']}))
    .pipe(gulp.dest(paths.dest + 'css/'))
});

gulp.task('watch', function () {
  var server = livereload();

  gulp.watch(paths.src + 'scripts/**', ['scripts']);
  gulp.watch(paths.src + 'styles/**/*.styl', ['styles']);
  gulp.watch(paths.src + 'index.jade', ['html']);

  gulp.watch([
      paths.dest + 'js/*.js',
      paths.dest + 'css/*.css',
      paths.dest + '**/*.html'
    ], function(evt) {
      server.changed(evt.path);
    });
});

gulp.task('vendor', ['vendor-styles', 'vendor-scripts']);
gulp.task('compile', ['html', 'styles', 'scripts']);

gulp.task('default', ['assets', 'vendor', 'compile']);
