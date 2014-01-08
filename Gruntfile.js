"use strict";

module.exports = function(grunt) {
    grunt.initConfig({
        jshint: {
            options: {
                jshintrc: '.jshintrc'
            },
            all: {
                src: ['public/js/**/*.js']
            }
        },

        shell: {
            //build_jems: {
                //command: [
                    //'jemplate --compile views/jems/* > public/js/Jemplates.js',
                    //'jemplate --compile views/mobile/jems/* views/jems/shared/* views/jems/binders/* views/jems/user-views.tt > public/js/mobile-jems.js'
                //].join('&&')
            //},

            server: {
                options: {
                    failOnError: true
                },
                command: 'plackup -s Starman -a bin/app.pl'
            },

            test: {
                options: {
                    stdout: true
                },
                command: 'npm test'
            }
        },

        sass: {
            options: {
                trace: true,
                require: 'bourbon',
                loadPath: 'sass/libs',
                style: 'compressed'
            },
            all: {
                files: [{
                    expand: true,
                    cwd: 'sass',
                    filter: function(s) {
                        return s.match(/_.*?\.scss$/) == null;
                    },
                    src: ['*.scss'],
                    dest: 'public/css',
                    ext: '.css'
                }]
            }
        },

        parallel: {
            assets: {
                options: {
                    grunt: true
                },
                tasks: ['server', 'default']
            }
        },

        watch: {
            js: {
                files: '<%= jshint.all.src %>',
                tasks: 'jshint:all',
                options: {
                    spawn: false
                }
            },

            //jems: {
                //files: ['views/jems/**/*.tt', 'views/mobile/jems/**/*.tt'],
                //tasks: 'shell:build_jems'
            //},

            css: {
                files: 'sass/**/*.scss',
                tasks: 'sass:all',
            },

            src: {
                files: ['t/**/*.t', 'lib/**/*.pl'],
                tasks: 'test'
            }
        }
    });

    grunt.event.on('watch', function(action, filepath) {
        grunt.config('jshint.all.src', filepath);
    });

    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-sass');
    grunt.loadNpmTasks('grunt-parallel');
    grunt.loadNpmTasks('grunt-shell');

    grunt.registerTask('default', ['parallel']);
    grunt.registerTask('server', ['shell:server']);
    grunt.registerTask('test', ['shell:test']);
};
