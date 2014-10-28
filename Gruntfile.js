module.exports = function(grunt) {

  "use strict";

  grunt.initConfig({ 
  
    libFiles: [
      "src/**/*.purs",
      "bower_components/purescript-*/src/**/*.purs"
    ],
    
    clean: ["tmp", "output"],
  
    pscMake: {
      lib: {
        src: ["<%=libFiles%>"]
      }
    },

    psc: {
      options: {
        module: "Main"
      },
      example: {
        src: ["example/Main.purs", "<%=libFiles%>"],
        dest: "tmp/index.js"
      }
    },

    dotPsci: ["<%=libFiles%>"]
  });

  grunt.loadNpmTasks("grunt-contrib-clean");
  grunt.loadNpmTasks("grunt-purescript");
 
  grunt.registerTask("make", ["pscMake:lib", "dotPsci"]);
  grunt.registerTask("example", ["psc:example"])
  grunt.registerTask("default", ["clean", "make"]);
};
