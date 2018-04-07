// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require froala_editor.min.js
//= require plugins/colors.min.js
//= require plugins/url.min.js
//= require plugins/link.min.js
//= require plugins/image.min.js
//= require plugins/font_size.min.js
//= require plugins/quote.min.js
//= require plugins/lists.min.js
//= require plugins/video.min.js
//= require plugins/fullscreen.min.js
//= require_tree .

$(document).on('turbolinks:load', function() {
    $('textarea#froala-editor-enabled').froalaEditor({
      toolbarButtons: ['fullscreen','|','bold','italic','fontSize','color','quote','orderedList','formatOL','insertLink','insertImage','insertVideo'],
      imageInsertButtons: ['imageByURL'],
      videoInsertButtons: ['videoByURL'],
      height: 200
    })
});
