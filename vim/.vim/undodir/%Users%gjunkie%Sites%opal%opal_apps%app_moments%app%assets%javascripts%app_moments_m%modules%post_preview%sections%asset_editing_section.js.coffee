Vim�UnDo� Zq���V���3���;�P�/�^D6k�j�  a                 
       
   
   
    Wa�,    _�                     �       ����                                                                                                                                                                                                                                                                                                                                                             W`�H    �   �   �  c      			�   �   �  b    5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �          �          V       W`�c     �   �   �          			console.trace()   $			console.log "render video player"5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       W`�g     �   �   �  a    �   �   �  a    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       W`�j     �   �   �  c      $			console.log "render video player"5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       W`�j    �   �   �  c      			console.log "render  player"5�_�                   �       ����                                                                                                                                                                                                                                                                                                                            �          �          V   #    W`�    �   �   �          			console.trace()   			console.log "render HERE"5�_�      	              �        ����                                                                                                                                                                                                                                                                                                                            �          �          V   #    Wa�L     �      c      a   V@OpalMoments_m.module "PostPreview", (PostPreview, App, Backbone, Marionette, $, _) ->   	dragging = null   	dropping = null           >	class PostPreview.AssetEditingView extends App.Views.ItemView   9		template: "post_preview/sections/asset_editing_section"   *		className: "assetEditingSection-overlay"       		behaviors:   			Tooltip: {}       		icons:   			x_11:   F				$parent: ".assetEditingSection-delete,.assetEditingSection-cancel"       			download:   ,				$parent: ".assetEditingSection-download"       
			expand:   *				$parent: ".assetEditingSection-expand"       		serializeData: ->   			data = super   			data.title or= data.filename   )			data.isEditing or= @options?.isEditing   /			data.isPresenting or= @options?.isPresenting       			data               D	class PostPreview.AssetEditingItemView extends App.Views.LayoutView   		baseClassName: ''       			events:   Y			"click .assetEditingSection-delete, .assetEditingSection-cancel": -> @trigger "delete"   2			"click .assetEditingSection-expand": "__expand"   			"mouseenter": "onMouseEnter"   			"mouseleave": "onMouseLeave"   5			"keyup @ui.caption_input": "__adjustCaptionScroll"   :			"mouseleave @ui.caption_input": "__adjustCaptionScroll"   !			mousemove: "_triggerMouseMove"       		ui:   <			caption_input: "textarea.assetEditingSection-captionText"   6			caption_text: "div.assetEditingSection-captionText"       		bindings:   !			"@ui.caption_input": "caption"    			"@ui.caption_text": "caption"   1			"input.assetEditingSection-timerText": "timer"   /			"div.assetEditingSection-timerText": "timer"       
		regions:   2			videoRegion: '.assetEditingSection-videoRegion'   0			editRegion: '.assetEditingSection-editRegion'       		initialize: (options={}) ->   E			{ @post, @isEditing, @isPresenting, @section, @display } = options       )			@asset = @model.get('asset_reference')       			@applyStateClasses()       			@setupModelListeners()   (			@setupToggleListeners() if @isEditing       			@setupMousemove()       /			@updateSize(@options.width, @options.height)       		setupModelListeners: ->   :			@listenTo @model.collection, "add remove", @__checkSize   9			@listenTo @model, "change:position", @__checkSizeLater   &			@listenTo @asset, "sync", @__onSync   [			@listenTo @asset, "change:is_processing change:uploading_percent", @__updateIsProcessing       		setupToggleListeners: ->   I			@listenTo @section, "toggled:comments", @__toggledComments if @section       		applyStateClasses: ->   .			@$el.toggleClass 'is-editing', !!@isEditing   4			@$el.toggleClass 'is-presenting', !!@isPresenting       		setupMousemove: ->   			@mousemove = _.debounce =>   				try   ;					elem = videojs @$('.video-js')[0], { preload: "none" }   					elem.trigger 'mousedown'   			, 200, { leading: true }       .			@updateSize @options.width, @options.height        		updateSize: (width, height) ->   			return if !width and !height       !			if width then @setWidth(width)   $			if height then @setHeight(height)       (		setWidth: (width) -> @$el.width(width)   ,		setHeight: (height) -> @$el.height(height)       2		isVideo: -> @asset?.get('asset_type') is 'video'       $		isLink: -> @getOption "showAsLink"       		onMouseEnter: ->   			@trigger "mouseenter"   			@$el.addClass 'is-hovering'       		onMouseLeave: ->   			@trigger "mouseleave"   !			@$el.removeClass 'is-hovering'       		_triggerMouseMove: (e) ->   0			if @isVideo() and e?.currentTarget == @$el[0]   				@mousemove()       		serializeData: ->   			data = @asset.toJSON()   			data.isEditing = @isEditing   $			data.isPresenting = @isPresenting       .			data.showAsImage = @_setServiceImageState()   '			data.full_url = @_updateFullUrl data       			if @isVideo()   				data.isVideo = true   I				data.typeClass =  "#{@baseClassName}-video assetEditingSection-video"   C				data.videoDuration = @__formatDuration data.meta_data?.duration   			else if @isLink()   				data.isLink = true   F				data.typeClass = "#{@baseClassName}-link assetEditingSection-link"   			else   H				data.typeClass = "#{@baseClassName}-image assetEditingSection-image"   "				data.styles = @__imageStyles()   7				data.aspectRatio = (data.height / data.width) * 100   				data.aspectRatio or= 100       			data       		_updateFullUrl: (data) ->   			return unless data.public_id       7			if @isTwitterStandard() and @getOption "showAsImage"   T				return AppBase.Helpers.getTwitterAdjustedImageUrl(data, @display.get("device"));       			data.full_url       		isTwitterStandard: ->   /			servicePostType = @post.getServicePostType()   a			"twitter" is servicePostType.get("service") and "standard" is servicePostType.get("post_type")       		_setServiceImageState: ->   ?			return @getOption("showAsImage") if @getOption "showAsImage"       :			service = @post.get("service_post_type")?.get "service"   			@_setAssetHeight()   8			return if service is "linked_in" then true else false       		_setAssetHeight: (service) ->   			if service is "linked_in"   4				$(".assetSection").append.css("height", "300px")       		__imageStyles: ->   			return '' unless @__width       r			if ((@asset.get('width') < @__width * 2) or (@asset.get('format') is 'gif')) and not @asset.isPreviewableFile()   k				url = @asset.get('full_url') if (@asset.get('width') < @__width * 2) or (@asset.get('format') is 'gif')   			else   V				url = AppBase.Helpers.asset_reference_url @asset.toJSON(), { width: @__width * 2 }       )			url = @_convertToPngBasedOnService url       :			if url then 'background-image:url(' + url + ')' else ''       		###   H		# Check Service Post Type to determine whether or not to enable .gif's   <		# Facebook does not allow gif's natively, and are replaced   @		# with .png's. Here, we mimic that behavior to mimic what will   3		# happen to .gif's in the Facebook image uploader   		#   (		# @method @_convertToPngBasedOnService   D		# @param {String} assetUrl string representing asset reference url   %		# @return {String} Sanitized string   		# @access private   		###   ,		_convertToPngBasedOnService: (assetUrl) ->   *			return if typeof assetUrl isnt "string"   4			service_post_type = @post.get "service_post_type"   ,			service = service_post_type.get "service"   0			post_type = service_post_type.get "post_type"   			if service is "facebook"   /				assetUrl = assetUrl.replace(".gif", ".png")   			assetUrl       %		__formatDuration: (milliseconds) ->   !			return "S" unless milliseconds   (			moment.utc(+milliseconds).format('s')       		__onSync: ->   			@trigger "sync"   			@render()       		onRender: ->    			@__updateAspectRatioClasses()   '			@__renderVideoPlayer() if @isVideo()   �			@editRegion.show new PostPreview.AssetEditingView { model: @asset, isEditing: @isEditing, isPresenting: @isPresenting } if (@isEditing || @isPresenting)   			@__checkSize()   			@__updateIsProcessing()       		onShow: ->   [			@__renderAfterImagesLoaded() if @isTwitterStandard() and @model?.collection?.length is 1       		__renderAfterImagesLoaded: ->   			@setTimeout =>   6				@$el.imagesLoaded => @post.trigger "images:loaded"   			, 100       		__width: 0   		__height: 0   		__checkSize: ->   			if @isLink()   				@$el.removeClass 'is-small'   
				return       '			return if @isDestroyed or @isVideo()       			ew = @$el.outerWidth()   			eh = @$el.outerHeight()   			aw = @asset.get('width')   			ah = @asset.get('height')       8			@$el.toggleClass 'is-small', (ew < 120) or (eh < 120)       /			ew = eh * (aw / ah) if (aw / ah) > (ew / eh)   5			ew = Math.max(Math.round(ew / 100), 1) * 100 if ew       ?			if ew and eh and ((@__width isnt ew) or (@__height isnt eh))   				@__width = ew   				@__height = eh   4				setTimeout (=> @render() unless @isDestroyed), 1   			else   !				@__checkSizeLater() unless ew       		__checkSizeLater: ->   &			setTimeout (=> @__checkSize()), 100       		__renderVideoPlayer: ->   ?			view = new App.Components.VideoPlayer.View { model: @asset }   8			@listenTo view, 'play', => @$el.addClass 'is-playing'   			@videoRegion.show view        		__updateAspectRatioClasses: ->   			width = @asset.get('width')    			height = @asset.get('height')   A			@$el.toggleClass @baseClassName + '--portrait', height > width   B			@$el.toggleClass @baseClassName + '--landscape', width > height       		__expand: (e) ->   			e.stopPropagation()   $			@asset.navigate @model.get "post"       		###   M		#	Since there are two places where the input text resides, the textarea and   L		# the display div, they need to stay in sync with each other when one gets   @		# more content or the scroll position changes. This does that.   		#   !		# @method __adjustCaptionScroll   		###   		__adjustCaptionScroll: ->   			@setTimeout =>   <				@ui.caption_text.scrollTop @ui.caption_input.scrollTop()       #		__toggledComments: (isToggled) ->   			return unless isToggled       			@__updateCaptionWidth()   			@__adjustCaptionScroll()       		__updateCaptionWidth: ->   :			@ui.caption_text.width @ui.caption_input[0].clientWidth       		__isUploading: ->   			!!@asset.get "public_id"       		__updateIsProcessing: ->   B			@$el.toggleClass 'is-processing', !!@asset.get('is_processing')   K			@$el.toggleClass "is-uploading", !@asset.id and !@asset.get("public_id")   1			percent = @asset.get("uploading_percent") * 96   E			@$('.assetEditingSection-progressBar').css { left: "#{percent}%" }               Y	class PostPreview.DraggableAssetEditingItemView extends PostPreview.AssetEditingItemView   @		events: _.extend {}, PostPreview.AssetEditingItemView::events,   			dragstart: "__dragstart"   			dragenter: "__dragenter"   			dragover: "__dragover"   			dragend: "__dragend"   			drop: "__drop"       		initialize: (options = {}) ->   			super   			dragging = null   			dropping = null   "			collection = @model?.collection   G			@listenTo collection, 'add remove', @__updateDraggable if collection   			@__updateDraggable()       		__updateDraggable: ->   G			@$el.attr('draggable', @isEditing && @model?.collection?.length > 1)       		__dragstart: (e) ->   			dragging = @model   			dropping = null       a			# mozilla requires setting data to the drag event in order to continue the drag-drop operation   U			# https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Drag_operations#dragdata   i			e.originalEvent?.dataTransfer?.setData "text/uri-list", @model.get('asset_reference')?.get('full_url')       			@$el.addClass 'is-dragging'       		__dragend: ->   !			@$el.removeClass 'is-dragging'       		__dragenter: (e) ->   			return if dragging is @model   			e.preventDefault()   			dropping = @model   			@__swap()       		__dragover: (e) ->   			e.preventDefault()       		__drop: (e) ->   			dragging = null   			dropping = null       		__swap: ->   &			return unless dragging and dropping   *			dragPosition = dragging.get('position')   *			dropPosition = dropping.get('position')       &			dragging.collection.each (asset) ->   #				position = asset.get 'position'   ;				if position >= dropPosition and position < dragPosition   )					asset.set 'position', (position + 1)   @				else if position <= dropPosition and position > dragPosition   )					asset.set 'position', (position - 1)       (			dragging.set 'position', dropPosition5�_�      
           	   �       ����                                                                                                                                                                                                                                                                                                                            �          �          V   #    Wa�Y    �   �   �  b      			console.log "the vids"5�_�   	               
   �        ����                                                                                                                                                                                                                                                                                                                            �          �          V   #    Wa�,    �   �   �          			console.log "onRender"5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       W`��    �   �   �  c      			�   �   �  d      			console.log @5��