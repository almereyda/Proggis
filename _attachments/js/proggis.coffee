Proggis = window.Proggis ?= {}
Proggis.db = $.couch.db "default"

jQuery(document).ready ->
# Defining parts of the view.
    Proggis.viewName = jQuery "#viewName"
    Proggis.graph = jQuery '.graph'
    Proggis.description = jQuery ".info.description"

    # Set up the spinner
    $('#loadingSpinner')
    # hide it initially
    .hide()
    .ajaxStart ->
        $( @ ).show()
    .ajaxStop ->
        $( @ ).hide()

    # Make description editable
    Proggis.description.hallo
        plugins:
            halloformat: {}
        modified: ->
            console.log "description edited", @

    Proggis.scrollTo = (selector) ->
        obj = jQuery(selector)[0]
        curtop = obj.offsetTop
        while obj = obj.offsetParent
            curtop += obj.offsetTop
        window.scrollTo 0, curtop

