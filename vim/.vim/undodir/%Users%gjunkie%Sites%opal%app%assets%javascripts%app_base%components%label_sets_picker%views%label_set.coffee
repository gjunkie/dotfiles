Vim�UnDo� �iY��s��DXi�D��:�EM�;4@_�   �                 L       L   L   L    X�z�    _�                     �       ����                                                                                                                                                                                                                                                                                                                                                             X=�    �   �   �          			console.log "validating"5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             X=��     �   �   �   �      			if @collection.length > 05�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             X=��     �   �   �   �      			f @collection.length > 05�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             X=��     �   �   �   �      			 @collection.length > 05�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             X=��    �   �   �          				return true5�_�                    W        ����                                                                                                                                                                                                                                                                                                                                                             X>�     �               �   c@AppBase.module "Components.LabelSetsPicker", (LabelSetsPicker, App, Backbone, Marionette, $, _) ->   <	class LabelSetsPicker.LabelSet extends App.Views.LayoutView   *		className: "label_set multicomplete_row"   		tagName: "li"   )		template: "label_sets_picker/label_set"       		behaviors:   			SN_Theme: {}       
		regions:   0			multicompleteRegion: ".multicomplete_wrapper"   %			labelRegion: ".multicomplete_name"       		ui:   &			header: ".multicomplete_row_header"   			label_list: ".members"       			events:   )			"click @ui.header": "toggleVisibility"       		serializeData: ->   			data = @label_set.toJSON()   "			data.is_required = @is_required   .			data.has_mapped_labels = @has_mapped_labels   			data       		initialize: (options={}) ->   			super       5			_.bindAll @, "toggleVisibility", "_add", "_remove"       S			{ @enforce_required_sets, @display_required_sets, @label_set, @theme } = options        			@labels = @model.get "labels"       8			unless @labels then @labels = new Backbone.Collection       5			label_set_required = @label_set.get("is_required")   ?			@is_required = label_set_required and @enforce_required_sets   V			@is_required_open = (@display_required_sets and label_set_required) or @is_required   0			@has_mapped_labels = @_checkForMappedLabels()       !			@multicomplete_cid = undefined       P			@collection = new Backbone.Collection @labels.where { label_set: @label_set }       			@_setUpListeners()       =			@labelComponent = AppBase.request "components:LabelGlyph",   				required: @is_required   !				label: @label_set.get("name")   			@_updateHasLabels()       		onRender: ->   			@_validateLabelComponent()       		onShow: ->   0			if @is_required then @$el.addClass "required"   1			if @collection.length > 0 or @is_required_open   				@$el.addClass "open"       )			@labelRegion.show @labelComponent.view       6			view_model = AppBase.request "multicomplete:model",   				show_footer: false   !				always_show_suggestions: true   .				suggestion_source: @label_set.get "labels"   				type: "labels"       /			view = AppBase.request "multicomplete:view",   				model: view_model   				collection: @collection   				theme: @theme        			@multicomplete_cid = view.cid   !			@multicompleteRegion.show view       			@$el.find(".tTip").tooltip()       		_setUpListeners: ->   C			@listenTo @labels, "remove", (label) => @collection.remove label   e			@listenTo @labels, "add", (label) => @collection.add label if label.get('label_set') is @label_set   y			@listenTo @labels, "reset", => @collection.reset @labels.filter (label) => label.get('label_set')?.id is @label_set.id       &			@listenTo @collection, "add", @_add   ,			@listenTo @collection, "remove", @_remove   0			@listenTo @collection, "add remove reset", =>   				@_validateLabelComponent()   				@_updateHasLabels()       6			@listenTo App.vent, "validate_labelset", @_validate       		_checkForMappedLabels: ->   E			_.compact(@label_set?.get("labels").pluck("meta_data")).length > 0       		###   2		# Toggles the open state of the label set if the   		# label set is not required.   		#   		# @method toggleVisibility   		# @access public   		###   		toggleVisibility: ->   1			# Don't allow required label sets to be closed   +			unless @is_required or @is_required_open   j				is_suggestions_visibile = AppBase.request "multicomplete:#{@multicomplete_cid}:suggestions:is_visible"   "				unless is_suggestions_visibile   !					return if @collection.length   					@$el.toggleClass "open"       		_updateHasLabels: ->   8			@$el.toggleClass "has-labels", @collection.length > 0   2			@$el.addClass("open") if @collection.length > 0       		###   "		# Adds a label to the label set.   		#   		# @method _add   1		# @param {Model} labelModel - the label to add.   		# @access private   		###   		_add: (labelModel) ->   			labels = @model.get "labels"   @			label_model = labels.add Opal.Models.Label.find labelModel.id   E			OpalRadio.Moments.vent.trigger "label_set_picker:add", label_model   			@model.validate? "labels"       		###   %		# Removes a label to the label set.   		#   		# @method _remove   4		# @param {Model} labelModel - the label to remove.   		# @access private   		###   		_remove: (labelModel) ->   			labels = @model.get "labels"   C			label_model = labels.remove Opal.Models.Label.find labelModel.id   H			OpalRadio.Moments.vent.trigger "label_set_picker:remove", label_model   			@model.validate? "labels"       		###   ,		# Validates the label component color dot.   		#   #		# @method _validateLabelComponent   		# @access private   		###   		_validateLabelComponent: ->   			isValid = @_validate()   #			@labelComponent.validate isValid       		###   5		# Ensures that the label set as at least one label.   		#   		# @method _validate   		# @return {Boolean}   		# @access private   		###   		_validate: ->   			@collection.length > 0    5�_�                   X   .    ����                                                                                                                                                                                                                                                                                                                                                             X>�     �   W   Z   �      ?			@listenTo @collection, "add remove reset", @_updateHasLabels5�_�                    Y       ����                                                                                                                                                                                                                                                                                                                                                             X>�     �   X   Z   �      				@_updateHasLabels5�_�                    W       ����                                                                                                                                                                                                                                                                                                                            W          W   '       v   0    X>�     �   V   X   �      @			@listenTo @collection, "add remove", @_validateLabelComponent5�_�                    W       ����                                                                                                                                                                                                                                                                                                                            W          W   '       v   0    X>�     �   V   W          			@_validateLabelComponent5�_�                    W       ����                                                                                                                                                                                                                                                                                                                            W          W   '       v   0    X>�     �   W   Y   �    �   W   X   �    5�_�                    X       ����                                                                                                                                                                                                                                                                                                                            W          W   '       v   0    X>�     �   W   Y   �      			@_validateLabelComponent5�_�                    X       ����                                                                                                                                                                                                                                                                                                                            W          W   '       v   0    X>�    �   W   Y   �      				@_validateLabelComponent5�_�                    "       ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI	n     �   !   #   �       			@labels = @model.get "labels"5�_�                    "       ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI	q     �   !   #   �       			@labels = @model.get "labels"5�_�                    "   #    ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI	t     �   !   #   �      +			@labels = @labels or @model.get "labels"5�_�                    "   $    ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI	w     �   !   #   �      ,			@labels = @labels or @model.get()"labels"5�_�                    "   +    ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI	y     �   !   #   �      +			@labels = @labels or @model.get("labels"5�_�                        A    ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI	~    �      !   �      S			{ @enforce_required_sets, @display_required_sets, @label_set, @theme } = options5�_�                    "   ,    ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI
D     �   !   #   �      ,			@labels = @labels or @model.get("labels")5�_�                    $       ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI
N     �   #   $          8			unless @labels then @labels = new Backbone.Collection5�_�                    $        ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI
N     �   #   $           5�_�                    z       ����                                                                                                                                                                                                                                                                                                                            "          "          V       XId     �   y   {   �      @			label_model = labels.add Opal.Models.Label.find labelModel.id5�_�                    y       ����                                                                                                                                                                                                                                                                                                                            "          "          V       XIg    �   x   z          			labels = @model.get "labels"5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            "          "          V       XIn     �   �   �          			labels = @model.get "labels"5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            "          "          V       XIo    �   �   �   �      C			label_model = labels.remove Opal.Models.Label.find labelModel.id5�_�                     ,        ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI�    �   +   -   �       5�_�      !               ,        ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI     �   +   ,          			debugger5�_�       "           !   ,       ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI     �   ,   .   �    �   ,   -   �    5�_�   !   #           "   -       ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI     �   ,   -          			debugger5�_�   "   $           #   P   "    ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI     �   O   R   �      y			@listenTo @labels, "reset", => @collection.reset @labels.filter (label) => label.get('label_set')?.id is @label_set.id5�_�   #   %           $   Q       ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI"     �   Q   S   �    �   Q   R   �    5�_�   $   &           %   R       ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI#     �   R   T   �    �   R   S   �    5�_�   %   '           &   S       ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI%     �   R   S          			debugger5�_�   &   (           '   R        ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI)     �   Q   S   �      			debugger5�_�   '   )           (   R   	    ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI;     �   Q   S   �      				debugger5�_�   (   *           )   R       ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI>     �   Q   R          				debugger5�_�   )   +           *   Q        ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI?     �   Q   S   �    �   Q   R   �    5�_�   *   ,           +   R       ����                                                                                                                                                                                                                                                                                                                            "          "          V       XIA     �   Q   R          				debugger5�_�   +   -           ,   P       ����                                                                                                                                                                                                                                                                                                                            "          "          V       XIB   
 �   P   R   �    �   P   Q   �    5�_�   ,   .           -   S        ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI�     �   R   T   �       5�_�   -   /           .   S       ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI�    �   R   T   �      			console.log "listening on"5�_�   .   0           /   #        ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI�     �   "   %   �       5�_�   /   1           0   #        ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI�     �   !   #   �      G			@labels = @labels or @model.get("labels") or new Backbone.Collection    �   "   $   �       5�_�   0   2           1   !        ����                                                                                                                                                                                                                                                                                                                            "          "          V       XI�     �   !   #   �      			console.log ""�       #   �       5�_�   1   3           2   "   "    ����                                                                                                                                                                                                                                                                                                                            #          #          V       XI�     �   !   #   �      "			console.log "setup picker with"5�_�   2   4           3   "   A    ����                                                                                                                                                                                                                                                                                                                            #          #          V       XI�     �   !   #   �      A			console.log "setup picker with", @labels, @model.get("labels")5�_�   3   5           4   !        ����                                                                                                                                                                                                                                                                                                                            #          #          V       XI�     �       #   �       5�_�   4   6           5   $   F    ����                                                                                                                                                                                                                                                                                                                            $          $          V       XI�     �   #   %   �      G			@labels = @labels or @model.get("labels") or new Backbone.Collection5�_�   5   7           6   $   /    ����                                                                                                                                                                                                                                                                                                                            $          $          V       XI�    �   #   %   �      3			@labels = @labels or @model.get("labels") orblah5�_�   6   8           7   S       ����                                                                                                                                                                                                                                                                                                                            $          $          V       XIw    �   R   S          				debugger5�_�   7   9           8   T       ����                                                                                                                                                                                                                                                                                                                            $          $          V       XI�     �   S   T          &			console.log "listening on", @labels5�_�   8   :           9   S       ����                                                                                                                                                                                                                                                                                                                            $          $          V       XI�    �   Q   S   �      !			@listenTo @labels, "reset", =>   W@collection.reset @labels.filter (label) => label.get('label_set')?.id is @label_set.id�   R   T   �      [				@collection.reset @labels.filter (label) => label.get('label_set')?.id is @label_set.id5�_�   9   ;           :   "        ����                                                                                                                                                                                                                                                                                                                            "          #          V       XIW     �   !   "          !			blah = new Backbone.Collection   G			console.log "setup picker with", @labels, @model.get("labels"), blah5�_�   :   <           ;       B    ����                                                                                                                                                                                                                                                                                                                            "          "          V       XIZ     �      !   �      \			{ @enforce_required_sets, @display_required_sets, @label_set, @labels, @theme } = options5�_�   ;   =           <   "       ����                                                                                                                                                                                                                                                                                                                            "          "          v        XIb     �   !   #   �      4			@labels = @labels or @model.get("labels") or blah5�_�   <   >           =   "   %    ����                                                                                                                                                                                                                                                                                                                            "          "          v        XId    �   !   #   �      )			@labels = @model.get("labels") or blah5�_�   =   ?           >   w       ����                                                                                                                                                                                                                                                                                                                            "          "          v        XI�     �   v   w           			#labels = @model.get "labels"5�_�   >   @           ?   �       ����                                                                                                                                                                                                                                                                                                                            "          "          v        XI�    �   �   �           			#labels = @model.get "labels"5�_�   ?   A           @   Q        ����                                                                                                                                                                                                                                                                                                                            "          "          v        XI'     �   P   S   �      &			@listenTo @collection, "add", @_add5�_�   @   B           A   R        ����                                                                                                                                                                                                                                                                                                                            "          "          v        XI)     �   Q   S   �      #@listenTo @collection, "add", @_add5�_�   A   C           B   Q        ����                                                                                                                                                                                                                                                                                                                            "          "          v        XI*     �   P   R   �       5�_�   B   D           C   Q   '    ����                                                                                                                                                                                                                                                                                                                            "          "          v        XI/    �   P   R   �      '			console.log "listening to in picker"5�_�   C   E           D   !        ����                                                                                                                                                                                                                                                                                                                            "          "          v        XI=     �   !   #   �      			console.log ""�       #   �       5�_�   D   F           E   "   "    ����                                                                                                                                                                                                                                                                                                                            #          #          v        XIE    �   !   #   �      "			console.log "setup picker with"5�_�   E   G           F   "       ����                                                                                                                                                                                                                                                                                                                            #          #          v        XIX     �   !   "          @			console.log "setup picker with", @model, @model.get("labels")5�_�   F   H           G   Q       ����                                                                                                                                                                                                                                                                                                                            "          "          v        XIY    �   P   Q          0			console.log "listening to in picker", @labels5�_�   G   I           H           ����                                                                                                                                                                                                                                                                                                                                                             X�z<    �       "   �    �       !   �    5�_�   H   J           I   !       ����                                                                                                                                                                                                                                                                                                                                                             X�zV    �       !          			console.log @theme5�_�   I   L           J   B        ����                                                                                                                                                                                                                                                                                                                                                             X�z]    �   B   D   �    �   B   C   �    5�_�   J       K       L   C        ����                                                                                                                                                                                                                                                                                                                                                             X�z�    �   B   C          			console.log @theme5�_�   J           L   K   C       ����                                                                                                                                                                                                                                                                                                                                                             X�za     �   B   D        5�_�                   �       ����                                                                                                                                                                                                                                                                                                                                                             X>�     �   �   �   �      			f @collection.length > 05�_�      	              �       ����                                                                                                                                                                                                                                                                                                                                                             X>�     �   �   �   �      			 @collection.length > 05�_�      
           	   �       ����                                                                                                                                                                                                                                                                                                                                                             X>�     �   �   �   �      			@collection.length > 05�_�   	               
   �       ����                                                                                                                                                                                                                                                                                                                                                             X>�    �   �   �        5��