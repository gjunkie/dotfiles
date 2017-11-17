Vim�UnDo� �?x���@S��Ҷ^	L�+!�,:�E >O��  U                                   X�1F    _�                     �       ����                                                                                                                                                                                                                                                                                                                                                             X�`    �   �   �          "					@momentCreator.fetchStories()5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             X�"�    �   �   �          #					#@momentCreator.fetchStories()5�_�                     �        ����                                                                                                                                                                                                                                                                                                                                                             X�1E     �              U   R@OpalMoments_m.module "Moments.Index", (Index, App, Backbone, Marionette, $, _) ->   0	class Index.Header extends App.Views.LayoutView   (		className: "timeline_header_container"   "		template: "moments/index/header"       		ui:   =			filterButton: ".momentsIndex-toggle-filters-button-region"   $			toggleBar: ".duration_toggle_bar"   !			buttonMonth: ".duration_month"   -			createButton: ".momentsIndex-createButton"   (			newMomentButton: ".btn_create_moment"       
		regions:   J			toggleFiltersButtonRegion: ".momentsIndex-toggle-filters-button-region"   (			searchBarRegion: "#search_bar_region"   6			momentCreatorRegion: ".momentsIndex-creator-region"   <			presentationCreatorRegion: ".create_presentation_wrapper"   /			actionsRegion: ".momentsIndex-actionsRegion"       		icons:   			plus_fill:   				append: true   				icon_classes: "btn-icon"   				$parent: "@ui.createButton"   				use_custom_handler: true       		behaviors:   			ToggleBar: {}   			Mousetrap:   				actions:   					"shift+m": "toggleCreator"   '					"shift+f": "toggleFiltersShortcut"   					"shift+s": "toggleSearch"       		momentsVentEvents:   .			"timeslicer:filters_close": "filtersClosed"       			events:   4			"click @ui.createButton": "_triggerCreatorShroud"       		storyModelEvents:   :			"change:scheduled_start_at change:scheduled_end_at": ->   				@render()   3				@view_model.trigger "recheck_date", @view_model       		initialize: (options = {}) ->   C			{ @all_moments, @brand_settings, @label_sets, @moments_timeline,   8				@settings, @story, @stories, @view_model } = options       			@button = null   G			@button_theme = if @getOption("theme") is "dark" then "n1" else null   _			@content_insights_enabled = (OpalMoments.State.enabled_features?.content_insights is "true")       :			# Bind OpalRadio.Moments.vent to momentsVentEvents hash   L			Marionette.bindEntityEvents @, OpalRadio.Moments.vent, @momentsVentEvents   J			if @story then Marionette.bindEntityEvents @, @story, @storyModelEvents       )			# Set the active toggle bar attributes   			@toggle_bars =   H				duration_toggle_bar: { active: @settings.get("timeslice_duration") }       		serializeData: ->   			data = @model.toJSON()   )			data.label_sets = @label_sets.toJSON()   3			data.picker_mode = @view_model.get "picker_mode"       			data       		onRender: ->   			@_setupToggleFiltersButton()   			@_checkFilterStatus()   '			unless @view_model.get "picker_mode"   &				@_initializeMomentCreatorPopover()   			if @content_insights_enabled   				@_setupActionsDropdown()       			# Setup data bindings   ,			@stickit @brand_settings, @brand_bindings       			@$(".tTip").tooltip()       		onShow: ->   			@_checkFilterStatus()   			@_setupSearchBar()   M			# Show the slide creator only when the application is active for this user   q			if Opal.State.presentations_installed and not @view_model.get("picker_mode") and not @content_insights_enabled   (				@_setupPresentationCreatorDropdown()       		onDestroy: ->   %			$(window).off ".timeslicer_header"   			@popover?.trigger "destroy"       		_createPresentation: ->   			modal_options =   				options:   					story: @story   					view_model: @view_model   M				panes: [OpalMoments_m.Components.PresentationCreatorDropdown.ContentPane]   F			OpalRadio.Presentations.request "creator_modal:view", modal_options       		_printPdf: ->   			console.log "print pdf"       		_setupActionsDropdown: ->   +			presentationModel = new Backbone.Model {   6				text: "Create presentation slides from this view",   				action: "create"   				images:   					custom_click: !0,   					icon: "presentation",   					type: "glyph"   			}   .			contentInsightsModel = new Backbone.Model {   				text: "View Opal Insights"   				action: "insights"   				images:   					custom_click: !0,   					icon: "insights",   					type: "glyph"   			}   *			downloadPDFModel = new Backbone.Model {   '				text: "Download a PDF of this view"   				action: "pdf"   				images:   					custom_click: !0,   					icon: "download",   					type: "glyph"   			}       6			actions = [presentationModel, contentInsightsModel]       .			@actions_dropdown = new snui.DropdownButton   				button_options:   =					images: { icon: "action", type: "glyph", append: false }   					type: "primary"   					theme: "n3"   				data: actions   				data_type: "options"   				include_default_image: true   				label: "Actions"   				mode: "action"   				theme: "n3"   				align: "right"       E			@listenTo @actions_dropdown, "dropdown_option:clicked", (model) =>   				switch model.get("action")   					when "create"   						@_createPresentation()   					when "insights"    						@_triggerContentInsights()   					when "pdf"   						@_printPdf()       '			unless @view_model.get "picker_mode"   )				@actionsRegion.show @actions_dropdown       '		_setupPresentationCreatorDropdown: ->   ,			view = @_getPresentationCreatorDropdown()   '			@presentationCreatorRegion.show view       		_setupSearchBar: ->   $			@searchBarView = @_getSearchBar()   '			@searchBarRegion.show @searchBarView       		_setupToggleFiltersButton: ->   4			@toggleFiltersButton = @_getToggleFiltersButton()   %			@button = @toggleFiltersButton.$el   A			@listenTo @toggleFiltersButton, "button:clicked", @openFilters       7			@toggleFiltersButtonRegion.show @toggleFiltersButton       		toggleCreator: ->   #			@$(".btn_create_moment").click()       		toggleFiltersShortcut: ->   "			if @filtersAreOpen is undefined   :				@filtersAreOpen = @settings.get "moments_filters_open"       %			@filtersAreOpen = !@filtersAreOpen       ?			if !@filtersAreOpen then @closeFilters() else @openFilters()       		toggleSearch: ->   )			@$searchInput ?= @searchBarView.$input    			if @$searchInput.is(":focus")   				@$searchInput.blur()   			else   				@$searchInput.focus()       			@searchBarView.toggleInput()       		openFilters: ->   			# Hide the filter button   			@button.fadeOut 200       )			# Send the message to whoever wants it   ;			OpalRadio.Moments.vent.trigger "timeslicer:filters_open"   			@filtersAreOpen = true       		closeFilters: ->   <			OpalRadio.Moments.vent.trigger "timeslicer:filters_close"       		filtersClosed: =>   ,			# Update the filter button style and text   			@_checkActiveFilters()       			# Show the filter button   			@button.fadeIn 200       			@filtersAreOpen = false       		_triggerCreatorShroud: ->   _			OpalRadio.Moments.vent.trigger "timeslicer:creator_shroud:open", { timeslicer: @view_model }       		_triggerContentInsights: ->   ?			OpalRadio.Global.request "ember_iframe", { url: "insights" }   		###   5		# Initializes the moment creator popover and set up   "		# the necessary event listeners.   		#   +		# @method _initializeMomentCreatorPopover   		# @access private   		###   %		_initializeMomentCreatorPopover: ->   7			if @momentCreator then @stopListening @momentCreator   			@_createPopover()       		###   2		# Creates a new Opal UI Popover with the desired   		# trigger and element.   		#   		# @method _createPopover   =		# @param {Object} $trigger, jQuery element for the trigger.   (		# @param {View} popover, popover view.   		# @access private   		###   '		_createPopover: ($trigger, popover)->   ?			@popover = OpalRadio.Global.request "components:popover_v2",   !				$trigger: @ui.newMomentButton   				body_attachment: true   				show_on: "click"   				is_parent_popover: true   				hide_on: "click"   				after_show: =>   )					@momentCreatorOptions.is_open = true   '					@momentCreator.view.trigger "open"   				after_hide: =>   *					@momentCreatorOptions.is_open = false   (					@momentCreator.view.trigger "close"   				flipper:   '					content_selector: ".momentCreator"   					constraints: [{   						popover: "top right",   						trigger: "bottom center",   						growth: "vertical",   						margin: 100   						}, {   						popover: "bottom right",   						trigger: "top right"   					}]   				get_view: =>   9					if @momentCreator then @stopListening @momentCreator   					@momentCreatorOptions = {   						timeslicer: @view_model   						stories: @stories   						story: @story   						theme: "light"   						inPopover: true   					}   X					@momentCreator = AppBase.request "moment_creator:controller", @momentCreatorOptions       C					@listenTo @momentCreator, "action:reset action:edit:close", =>   						@popover.hide()   0					@listenTo @momentCreator, "action:edit", =>   &						@toggleFiltersButton.$el.click()   ?					@listenTo @momentCreator, "action:create", (new_moment) =>   2						start = new_moment.get "scheduled_at_rfc822"   +						duration = @view_model.get "duration"   4						current_start = @view_model.get "current_date"   p						current_start = if duration is "week" then moment(current_start).startOf("week") else moment current_start   X						start = if duration is "week" then moment(start).startOf("week") else moment start       &						# update the timeslicer position   �						if current_start.diff(start) isnt 0 then OpalRadio.Moments.trigger "moment_creator:moment:schedule_date_changed", start.toDate()       					@momentCreator.view       		_checkFilterStatus: ->   *			if @settings.get "moments_filters_open"   				@button.hide()   			else   				@_checkActiveFilters()       		_checkActiveFilters: ->   4			filter_count = @brand_settings.get "filter_count"   /			enabled = filter_count? and filter_count > 0       +			@button.toggleClass "activated", enabled       			if enabled   *				text = "#{filter_count} active filter"   (				text += "s" unless filter_count is 1   (				@button.find(".btn-label").text text   			else   ,				@button.find(".btn-label").text "Filter"       "		# ------------------------------   		# View management   "		# ------------------------------       		_getToggleFiltersButton: ->   			new snui.Button   B				classes: ["toggle-filters", "momentsIndex-btn-toggle-filters"]   				images:   					icon: "open_drawer"   					type: "glyph"   					append: true   				label: "Filter"   				type: "nonButton"   				theme: @button_theme       		_getSearchBar: ->   			new OpalMoments.Views.Search   				model: @model   				view_model: @view_model   				collection: @collection   				tagName: "div"   				settings: @brand_settings   '				moments_timeline: @moments_timeline   				story: @story   <			# search_model = AppBase.request "search_input:get_model"   K			# @listenTo search_model, "change:search_term", (model, changed_attr) ->   U			# 	OpalRadio.Moments.trigger "moments:index:search", { search_term: changed_attr }   -			# AppBase.request "search_input:get_view",   			# 	model: search_model   '			# 	settings: { expanded_width: 175 }       %		_getPresentationCreatorDropdown: ->   B			OpalRadio.Moments.request "presentation_creator_dropdown:view",   				story: @story   				view_model: @view_model5��