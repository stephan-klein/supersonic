Promise = require 'bluebird'
module.exports = (steroids, log) ->
  ###
  # @namespace supersonic.ui
  # @name PDFView
  # @class
  # @description
  # A PDFView is a native view that displays the contents of a PDF file.
  # @type
  # PDFView: {
  #   start: () => Promise
  # }
  # @define {Function} start - Dislays the Native PDF View.
  # @exampleCoffeeScript
  # # Constructor (filePath is required and must be of the pdf extension)
  # pdfView = new supersonic.ui.PDFView("pdfs/Commissions.pdf")
  #
  # # Displays the PDF View
  # pdfView.start()
  #
  # @exampleJavaScript
  # // Constructor (filePath is required and must be of the pdf extension)
  # var pdfView = new supersonic.ui.PDFView("pdfs/Commissions.pdf");
  #
  # // Displays the PDF View
  # pdfView.start();
  #
  ###

  class PDFView
    constructor: (@filePath="") ->

    start: => new Promise (resolve, reject) =>
      steroids.modal.show {
        view: new steroids.views.PreviewFileView {
          filePath: @filePath
        }
      },
        onSuccess: resolve
        onFailure: reject

  return PDFView
