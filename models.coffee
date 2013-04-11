casper = require('casper').create(
  verbose: true
  logLevel: "debug"
  clientScripts: ["libs/jquery.js", "libs/underscore.js"]
  timeout: 10000
  onError: (self, m) ->
    console.log "Fatal: " + m
    self.exit()
)

casper.start 'http://www.icarros.com.br/tabela-fipe/index.jsp'

casper.then ->
  @evaluate ->
    @models = {}
    _.each $('#marca option'), (option) ->
      id = option.value
      @models[id] = option.innerHTML
    console.log JSON.stringify(@models)

casper.run ->
  @exit()