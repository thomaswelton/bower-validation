define ['validate','mootools'], (FormValidator) ->
	class FormValidation
		constructor: (@form, validateResponse) ->
			@form.addEvent 'submit', (event) ->
				event.stop()

			messages = JSON.parse @form.getProperty 'data-validate-messages'
			validateFields = JSON.parse @form.getProperty 'data-validate-fields'
			
			validateFields[i].name = field.field for field, i in validateFields

			formName = @form.getProperty 'name'

			if !formName?
				formName = 'FormValidator' + (new Date().getTime())
				@form.setProperty 'name', 'FormValidator' + (new Date().getTime())

			validator = new FormValidator formName, validateFields, validateResponse

			validator.setMessage(rule, string) for rule, string of messages