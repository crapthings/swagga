@getTemplate = (templateName) ->
	return Template[templateName].render().toHTML()
