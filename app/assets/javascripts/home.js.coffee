# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$(".player-section").hide()
	$(".player-profile").show()
	$(".collection").hide()

	swapCurrentClass = (e) ->
		# e.preventDefault()
		$(".links a").removeClass "current"
		$(this).addClass "current"


	toggleCollection = (e) ->
		e.preventDefault()
		if $('.collection').length
			$(".collection").slideToggle()
		else
			$('.collection-screen').slideToggle()
			$('body').toggleClass('fixed')

	swapProfileView = (e) ->
		e.preventDefault()
		console.log("ouch!")
		$(".player .filter-menu a").removeClass "active"
		$(".player .filter-menu a .indicator").remove()
		$(this).addClass "active"
		$(this).append("<span class='indicator'></span>")
		$(".player-section").hide()
		section = ".player-" + $(this).text().toLowerCase()
		$(section).fadeIn()

	swapActiveClass = (e) ->
		e.preventDefault()
		$(".feed-filter a").removeClass "active"
		$(this).addClass "active"
		$('#feed-data').load('/home/feed_data?s='+ $(this).html())

	swapResearchView = (e) ->
		e.preventDefault()
		$(".filter-menu a").removeClass "active"
		$(".filter-menu a .indicator").remove()
		$(this).addClass "active"
		$(this).append("<span class='indicator'></span>")
		$(".research-section").hide()
		section = "." + $(this).text().toLowerCase()
		console.log(section)
		section = section.replace(/\s/g , "-")
		console.log(section)
		$(section).fadeIn()

	$(".links a").click(swapCurrentClass)
	$(".open-collection").click(toggleCollection)
	$(".filter-menu a").click(swapProfileView)
	$(".research-page .filter-menu a").click(swapResearchView)
	$(".feed-filter a").click(swapActiveClass)
