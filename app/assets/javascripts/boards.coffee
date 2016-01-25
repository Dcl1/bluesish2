# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
	firstId = $('section:first').attr('id').toString()

	$('section').not("#" + firstId).hide()

	$ ->
		$("article ul li a[data-id-number]").click (e) ->
			
			hrefN = $(this).attr('href').toString()

			$('section').filter(hrefN).show()
			$('section').not(hrefN).hide()


	# Get the modal
	modal = document.getElementById('myModal')
	# Get the button that opens the modal
	btn = document.getElementById('myBtn')
	# Get the <span> element that closes the modal
	span = document.getElementsByClassName('close')[0]
	# When the user clicks on the button, open the modal 

	btn.onclick = ->
	  modal.style.display = 'block'
	  alert "hi"
	  return

	# When the user clicks on <span> (x), close the modal

	span.onclick = ->
	  modal.style.display = 'none'
	  return

	# When the user clicks anywhere outside of the modal, close it

	window.onclick = (event) ->
	  if event.target == modal
	    modal.style.display = 'none'
	  return



$(document).on('ready', ready)
$(document).on('ready page:load', ready)






