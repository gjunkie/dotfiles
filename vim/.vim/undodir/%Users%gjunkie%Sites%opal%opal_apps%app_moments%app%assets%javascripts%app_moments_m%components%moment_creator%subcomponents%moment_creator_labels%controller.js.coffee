Vim�UnDo� �q@ќi����.�9�d(�zԾ�}�6���   �           &      )       )   )   )    Y��    _�                    !        ����                                                                                                                                                                                                                                                                                                                                                             X�Q�    �   !   #   �    �   !   "   �    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             X��     �   �   �          &			@labelsChanged = changes.length > 0�   *   ,          			@labelsChanged�   $   &          &		# Getter for the labelsChanged flag.�                			@labelsChanged = false5�_�                    +       ����                                                                                                                                                                                                                                                                                                                                                             X��     �   +   -   �    �   +   ,   �    5�_�                    +       ����                                                                                                                                                                                                                                                                                                                                                             X��    �   *   ,   �      			@labelsHaveChanged5�_�                    #        ����                                                                                                                                                                                                                                                                                                                            ,          #           V       X��     �   "   #       
       		###   *		# Getter for the labelsHaveChanged flag.   		#   		# @method hasUnsavedLabels   		# @access public   		###   		hasUnsavedLabels: ->   !			console.log @labelsHaveChanged   			@labelsHaveChanged5�_�      	                     ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�     �                			@labelsHaveChanged = false5�_�      
           	   �       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�     �   �   �          *			@labelsHaveChanged = changes.length > 05�_�   	              
   �       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�     �   �   �   �    �   �   �   �    5�_�   
                 �       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�     �   �   �   �      -			if _.isEmpty(changes) then false else true5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�     �   �   �   �      ,			f _.isEmpty(changes) then false else true5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�     �   �   �   �      +			 _.isEmpty(changes) then false else true5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�    �   �   �   �      			�   �   �   �    5�_�                    �   
    ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�0    �   �   �   �      1			test = _.isEmpty(changes) then false else true5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�N    �   �   �          			console.log test5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�P    �   �   �          4			test = if _.isEmpty(changes) then false else true5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�r     �   �   �   �      			�   �   �   �    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�     �   �   �          			console.log @originalLabels5�_�                    7       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X��     �   7   9   �    �   7   8   �    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X��    �   �   �   �      			�   �   �   �    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X��     �   �   �          			console.log "cancel"5�_�                           ����                                                                                                                                                                                                                                                                                                                            �          �          v        X��     �         �      			�         �    5�_�                    9       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X��    �   8   9          			console.log @originalLabels5�_�                           ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�'   	 �                			console.log "init"5�_�                    `       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�   
 �   `   b   �      			�   `   b   �    5�_�                    _       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X��     �   ^   `   �       		inheritStoryLabels: (story) ->5�_�                    _       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X��     �   ^   `   �      		inheritStoryLabels: () ->5�_�                    _       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X��     �   ^   `   �      		inheritStoryLabels: ) ->5�_�                    _       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X��     �   ^   `   �      		inheritStoryLabels:  ->5�_�                     `       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X��    �   _   `          			return if not story5�_�      !               a       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X��     �   `   b   �      +			@model.set "labels", story.get("labels")5�_�       "           !   a   .    ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�    �   `   b   �      A			@model.set "labels", @model.getPrimaryStorystory.get("labels")5�_�   !   #           "   a   .    ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�#    �   `   b   �      <			@model.set "labels", @model.getPrimaryStory.get("labels")5�_�   "   $           #   a       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�0�    �   `   b          >			@model.set "labels", @model.getPrimaryStory().get("labels")5�_�   #   %           $   a       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�2�    �   `   a          ?			#@model.set "labels", @model.getPrimaryStory().get("labels")5�_�   $   &           %           ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�I�     �               �   _@AppBase.module "Components.MomentCreator", (MomentCreator, App, Backbone, Marionette, $, _) ->   B	class MomentCreator.LabelsController extends App.Controllers.Base       		initialize: (options = {}) ->   ,			{ @model, @theme, @label_sets } = options       +			if @theme is "clear" or @theme is "dark"   				@theme = "dark"   H			@labelsCollection = new Backbone.Collection @model.getLabels().models   '			@view = new MomentCreator.LabelsView   			@cloneLabelsCollection()       6			@listenTo @label_sets, "sync", @_setupLabelSetsView       			@_setupListeners()       		_setupListeners: ->   			@listenTo @view,   				"render": =>   					@_setupLabelComponent()   					@_setupLabelSetsView()   					@_setValidationDot()   				"destroy": @destroy   			@listenTo @model,   				"change:labels": =>   					@_setValidationDot()   3			# Keep track of custom label adding and removing   3			# to not mess with them when stories are changed   			@listenTo @labelsCollection,   				"add remove": =>   8					@model.get("labels").reset @labelsCollection.models   +					@model.trigger "change:labels", @model   					@_setValidationDot()       		###   ;		# Initializes a label glyph component and shows it in the   		# appropriate region.   		#    		# @method _setupLabelComponent   		# @access private   		###   		_setupLabelComponent: ->   C			@labelsLabelComponent = AppBase.request "components:LabelGlyph",   				required: true   				label: "Labels"   :			@view.labelsLabelRegion.show @labelsLabelComponent.view       		###   <		# Creates a new Labels collection from the moment's labels   		#   !		# @method cloneLabelsCollection   		# @access public   		###   		cloneLabelsCollection: ->   M			@originalLabels = new Opal.Collections.Labels @model.getLabels().toArray()       		###   8		# Resets the working labels collection to the moment's   		# label collection.   		#   		# @method resetLabels   		# @access public   		###   		resetLabels: ->   4			@labelsCollection.reset @model.getLabels().models       		###   I		# Initializes a label sets view and shows it in the appropriate region.   		#   		# @method _setupLabelSetsView   		# @access private   		###   		_setupLabelSetsView: ->   '			@labels_view = @_getLabelsSetGroup()   '			@view.labelsRegion.show @labels_view       		###   /		# Sets the valid state of the validation dot.   		#   		# @method _setValidationDot   		# @access private   		###   		_setValidationDot: ->   $			isValid = @model.hasValidLabels()   )			@labelsLabelComponent.validate isValid       		###   9		# Takes the labels from a specified story and sets them   		# on the momment model.   		#   		# @method inheritStoryLabels   ;		# @param {Story} story, the story to inherit labels from.   		# @access public   		###   		inheritStoryLabels: ->   %			return if @model.hasCustomLabels()   4			@labelsCollection.reset @model.getLabels().models   			@_setupLabelSetsView()   			@_setValidationDot()       		###   *		# Requests a new label sets picker view.   		#   		# @method _getLabelsSetGroup   		# @return {View}   		# @access private   		###   		_getLabelsSetGroup: ->   5			OpalRadio.Global.request "label_sets_picker:view",   A				collection: @label_sets or OpalMoments.Collections.label_sets   ;				model: new Backbone.Model { labels: @labelsCollection }   				theme: @theme       		###   /		# Checks if there are new labels to be saved.   6		# Returns unsaved labels or false if there are none.   		#   		# @method hasUnsavedLabels   		# @return {Boolean}   		# @access public   		###   		hasUnsavedLabels: ->   (			original = @originalLabels.pluck "id"   *			current = @model.getLabels().pluck "id"       +			removed = _.difference original, current   )			added = _.difference current, original       +			changes = _.difference original, current   *			changes = changes.concat added, removed   -			if _.isEmpty(changes) then false else true       		###   B		# Resets the labels collection to the original labels collection   		#   		# @method cancelUnsavedLabels   		# @access public   		###   		cancelUnsavedLabels: ->   &			labels = @originalLabels.pluck "id"   			@model.set "labels", labels5�_�   %   '           &           ����                                                                                                                                                                                                                                                                                                                            �          �          v        X� �     �       �       �   _@AppBase.module "Components.MomentCreator", (MomentCreator, App, Backbone, Marionette, $, _) ->   B	class MomentCreator.LabelsController extends App.Controllers.Base       		initialize: (options = {}) ->   ,			{ @model, @theme, @label_sets } = options       +			if @theme is "clear" or @theme is "dark"   				@theme = "dark"   H			@labelsCollection = new Backbone.Collection @model.getLabels().models   '			@view = new MomentCreator.LabelsView   			@cloneLabelsCollection()   			@labelsChanged = false       6			@listenTo @label_sets, "sync", @_setupLabelSetsView       			@_setupListeners()       		_setupListeners: ->   			@listenTo @view,   				"render": =>   					@_setupLabelComponent()   					@_setupLabelSetsView()   					@_setValidationDot()   				"destroy": @destroy   			@listenTo @model,   				"change:labels": =>   					@_setValidationDot()   3			# Keep track of custom label adding and removing   3			# to not mess with them when stories are changed   			@listenTo @labelsCollection,   				"add remove": =>   8					@model.get("labels").reset @labelsCollection.models   +					@model.trigger "change:labels", @model   					@_setValidationDot()       		###   &		# Getter for the labelsChanged flag.   		#   		# @method hasUnsavedLabels   		# @access public   		###   		hasUnsavedLabels: ->   			@labelsChanged       		###   ;		# Initializes a label glyph component and shows it in the   		# appropriate region.   		#    		# @method _setupLabelComponent   		# @access private   		###   		_setupLabelComponent: ->   C			@labelsLabelComponent = AppBase.request "components:LabelGlyph",   				required: true   				label: "Labels"   :			@view.labelsLabelRegion.show @labelsLabelComponent.view       		###   <		# Creates a new Labels collection from the moment's labels   		#   !		# @method cloneLabelsCollection   		# @access public   		###   		cloneLabelsCollection: ->   M			@originalLabels = new Opal.Collections.Labels @model.getLabels().toArray()       		###   8		# Resets the working labels collection to the moment's   		# label collection.   		#   		# @method resetLabels   		# @access public   		###   		resetLabels: ->   4			@labelsCollection.reset @model.getLabels().models       		###   I		# Initializes a label sets view and shows it in the appropriate region.   		#   		# @method _setupLabelSetsView   		# @access private   		###   		_setupLabelSetsView: ->   '			@labels_view = @_getLabelsSetGroup()   '			@view.labelsRegion.show @labels_view       		###   /		# Sets the valid state of the validation dot.   		#   		# @method _setValidationDot   		# @access private   		###   		_setValidationDot: ->   $			isValid = @model.hasValidLabels()   )			@labelsLabelComponent.validate isValid       		###   9		# Takes the labels from a specified story and sets them   		# on the momment model.   		#   		# @method inheritStoryLabels   ;		# @param {Story} story, the story to inherit labels from.   		# @access public   		###    		inheritStoryLabels: (story) ->   			return if not story   +			@model.set "labels", story.get("labels")   4			@labelsCollection.reset @model.getLabels().models   			@_setupLabelSetsView()   			@_setValidationDot()       		###   *		# Requests a new label sets picker view.   		#   		# @method _getLabelsSetGroup   		# @return {View}   		# @access private   		###   		_getLabelsSetGroup: ->   5			OpalRadio.Global.request "label_sets_picker:view",   A				collection: @label_sets or OpalMoments.Collections.label_sets   ;				model: new Backbone.Model { labels: @labelsCollection }   				theme: @theme       		###   /		# Checks if there are new labels to be saved.   6		# Returns unsaved labels or false if there are none.   		#   		# @method hasUnsavedLabels   		# @return {Boolean}   		# @access public   		###   		hasUnsavedLabels: ->   (			original = @originalLabels.pluck "id"   *			current = @model.getLabels().pluck "id"       +			removed = _.difference original, current   )			added = _.difference current, original       +			changes = _.difference original, current   *			changes = changes.concat added, removed   &			@labelsChanged = changes.length > 0   -			if _.isEmpty(changes) then false else true       		###   B		# Resets the labels collection to the original labels collection   		#   		# @method cancelUnsavedLabels   		# @access public   		###   		cancelUnsavedLabels: ->   &			labels = @originalLabels.pluck "id"   			@model.set "labels", labels5�_�   &   (           '   \       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X� �    �   [   \          ;		# @param {Story} story, the story to inherit labels from.5�_�   '   )           (   ^       ����                                                                                                                                                                                                                                                                                                                            �          �          v        X�    �   ^   `   �      			�   ^   `   �    5�_�   (               )   \        ����                                                                                                                                                                                                                                                                                                                            �          �          v        Y��     �               �   _@AppBase.module "Components.MomentCreator", (MomentCreator, App, Backbone, Marionette, $, _) ->   B	class MomentCreator.LabelsController extends App.Controllers.Base       		initialize: (options = {}) ->   ,			{ @model, @theme, @label_sets } = options       +			if @theme is "clear" or @theme is "dark"   				@theme = "dark"   H			@labelsCollection = new Backbone.Collection @model.getLabels().models   '			@view = new MomentCreator.LabelsView   			@cloneLabelsCollection()       6			@listenTo @label_sets, "sync", @_setupLabelSetsView       			@_setupListeners()       		_setupListeners: ->   			@listenTo @view,   				"render": =>   					@_setupLabelComponent()   					@_setupLabelSetsView()   					@_setValidationDot()   				"destroy": @destroy   			@listenTo @model,   				"change:labels": =>   					@_setValidationDot()   3			# Keep track of custom label adding and removing   3			# to not mess with them when stories are changed   			@listenTo @labelsCollection,   				"add remove": =>   8					@model.get("labels").reset @labelsCollection.models   +					@model.trigger "change:labels", @model   					@_setValidationDot()       		###   ;		# Initializes a label glyph component and shows it in the   		# appropriate region.   		#    		# @method _setupLabelComponent   		# @access private   		###   		_setupLabelComponent: ->   C			@labelsLabelComponent = AppBase.request "components:LabelGlyph",   				required: true   				label: "Labels"   :			@view.labelsLabelRegion.show @labelsLabelComponent.view       		###   <		# Creates a new Labels collection from the moment's labels   		#   !		# @method cloneLabelsCollection   		# @access public   		###   		cloneLabelsCollection: ->   M			@originalLabels = new Opal.Collections.Labels @model.getLabels().toArray()       		###   8		# Resets the working labels collection to the moment's   		# label collection.   		#   		# @method resetLabels   		# @access public   		###   		resetLabels: ->   4			@labelsCollection.reset @model.getLabels().models       		###   I		# Initializes a label sets view and shows it in the appropriate region.   		#   		# @method _setupLabelSetsView   		# @access private   		###   		_setupLabelSetsView: ->   '			@labels_view = @_getLabelsSetGroup()   '			@view.labelsRegion.show @labels_view       		###   /		# Sets the valid state of the validation dot.   		#   		# @method _setValidationDot   		# @access private   		###   		_setValidationDot: ->   $			isValid = @model.hasValidLabels()   )			@labelsLabelComponent.validate isValid       		###   9		# Takes the labels from a specified story and sets them   		# on the momment model.   		#   		# @method inheritStoryLabels   		# @access public   		###   		inheritStoryLabels: ->   '			console.log @model.hasCustomLabels()   %			return if @model.hasCustomLabels()   4			@labelsCollection.reset @model.getLabels().models   			@_setupLabelSetsView()   			@_setValidationDot()       		###   *		# Requests a new label sets picker view.   		#   		# @method _getLabelsSetGroup   		# @return {View}   		# @access private   		###   		_getLabelsSetGroup: ->   5			OpalRadio.Global.request "label_sets_picker:view",   A				collection: @label_sets or OpalMoments.Collections.label_sets   ;				model: new Backbone.Model { labels: @labelsCollection }   				theme: @theme       		###   /		# Checks if there are new labels to be saved.   6		# Returns unsaved labels or false if there are none.   		#   		# @method hasUnsavedLabels   		# @return {Boolean}   		# @access public   		###   		hasUnsavedLabels: ->   (			original = @originalLabels.pluck "id"   *			current = @model.getLabels().pluck "id"       +			removed = _.difference original, current   )			added = _.difference current, original       +			changes = _.difference original, current   *			changes = changes.concat added, removed   -			if _.isEmpty(changes) then false else true       		###   B		# Resets the labels collection to the original labels collection   		#   		# @method cancelUnsavedLabels   		# @access public   		###   		cancelUnsavedLabels: ->   &			labels = @originalLabels.pluck "id"   			@model.set "labels", labels5�_�                    *       ����                                                                                                                                                                                                                                                                                                                                                             X��     �   *   +   �       5�_�                     "        ����                                                                                                                                                                                                                                                                                                                                                             X�Q�     �   "   #   �    �   "   #   �      					@_setValidationDot()5��