angular
  .module('ui')
  .controller 'FileViewsController', ($scope) ->

    $scope.displayPDF = ->
      pdfView = new supersonic.ui.PDFView("pdfs/Commissions.pdf")
      pdfView.start()

    $scope.displayMediaGallery = ->
      mediaGallery = new supersonic.ui.MediaGallery [
        "http://www.themoorings.co.nz/images/lake-wanaka-new-zealand.jpg"
        "images/pic01.jpg"
        "images/pic02.jpg"
        "images/pic03.jpg"
        "images/pic04.jpg"
        "images/video01.mp4"
        ]
      mediaGallery.start()
