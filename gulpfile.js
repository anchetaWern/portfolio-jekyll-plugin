var gulp = require('gulp');
var imageResize = require('gulp-image-resize');
var rename = require("gulp-rename");
var imagemin = require('gulp-imagemin');
var clean = require('gulp-clean');

gulp.task('clean', function(){
    return gulp.src('source/images/pages/projects', {read: false})
        .pipe(clean());
});

gulp.task('minify', function(){
    return gulp.src('portfolio/**/*.{jpg,png}')
        .pipe(imagemin({
            progressive: true
        }))
        .pipe(rename(function(path){
            path.dirname = path.dirname.replace('/img', '');   
        }))
        .pipe(gulp.dest('source/images/pages/projects'));
});

gulp.task('resize', function(){
  gulp.src('portfolio/**/*.{jpg,png}')
    .pipe(imageResize({ width : 390 }))
    .pipe(rename(function(path){
        path.basename = 'small-' + path.basename;
        path.dirname = path.dirname.replace('/img', '');
    }))
    .pipe(gulp.dest('source/images/pages/projects'));
});

gulp.task('copy', function(){
    gulp.src('portfolio/**/*.markdown')
        .pipe(gulp.dest('source/projects'));
});


gulp.task('default', ['clean', 'minify', 'resize', 'copy']);
