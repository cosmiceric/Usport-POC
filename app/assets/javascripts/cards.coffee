$ ->
	# $(".card-collection .cards").hide()
	# $(".card-collection header").hide()

	disableFilter = (e) ->
		e.preventDefault()
		$(".filter a").removeClass "current"
		$(this).addClass "current"


# Click My Collection
	# 	Dashboard.Slide up.hide.remove classes
	# 	Page.Slide up.hide.remove classes

	# 	Collection Nav.show.slide Down.remove classes
	# 	Cards.show.slide up.remove classes

	removeClasses = () ->
		$(".dashboard").removeClass("animated bounceOutUp bounceInDown")
		$(".page").removeClass("animated bounceOutUp bounceInDown")
		$(".card-collection header").removeClass "animated bounceOutUp bounceInDown"
		$(".card-collection .cards").removeClass "animated bounceInUp bounceOutDown"

	hideDashboard = () ->
		$(".dashboard").hide(0)
		$(".page").hide(0)

	hideCollection = () ->
		$(".card-collection header").hide(0)
		$(".card-collection .cards").hide(0)

	showCollection = (e) ->
		e.preventDefault()
		$(".dashboard").addClass "animated bounceOutUp"
		$(".page").addClass "animated bounceOutUp"
		$(".card-collection header").delay(500).show(0).addClass "animated bounceInDown"
		$(".card-collection .cards").delay(500).show(0).addClass "animated bounceInUp"
		setTimeout ( ->
	  	removeClasses()
	  	hideDashboard()
		), 3000

	hideCollection = (e) ->
		e.preventDefault()
		$(".card-collection header").addClass "animated bounceOutUp"
		$(".card-collection .cards").addClass "animated bounceOutDown"
		$(".dashboard").delay(500).show(0).addClass "animated bounceOutUp"
		$(".page").delay(500).show(0).addClass "animated bounceOutUp"
		setTimeout ( ->
	  	removeClasses()
	  	hideCollection()
		), 3000


	flipThat = (e) ->
		e.preventDefault()
		# alert $(this).attr("class")
		if $(this).attr("class") != "card flipped"
			$(this).addClass "flipped"
		else $(".card").removeClass "flipped"

	# Click Close
	# 	Collection Nav.slide Up.hide.remove classes
	# 	Cards.slide down.hide.remove classes

	# 	Dashboard.show.Slide down.remove classes
	# 	Page.show.Slide down.remove classes

	$("a[href='collection']").click(showCollection)
	$(".card-collection .close").click(hideCollection)
	$(".filter a").click(disableFilter)
	# $(".card").click(flipThat)
