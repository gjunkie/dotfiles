Vim�UnDo� W�����U�&;�7�㣫<,;��6���wԙ�M   S                                   X���    _�                     A       ����                                                                                                                                                                                                                                                                                                                                                             W�O      �   A   F   S    �   A   B   S    5�_�                    B       ����                                                                                                                                                                                                                                                                                                                            B          B          v       W�O$     �   A   C   W      "			if options.model.get "is_ghost"5�_�                    B       ����                                                                                                                                                                                                                                                                                                                            B          B          v       W�O$     �   A   C   W      			if .get "is_ghost"5�_�                    F        ����                                                                                                                                                                                                                                                                                                                            F   	       K          V       W�O4     �   E   L   W      ;			component = new AppBase.Components.ContentCard.Component   				model: post   				moment: @model   				theme: "light"   .				services: OpalMoments.Collections.services   				view_mode: "single"5�_�                    F       ����                                                                                                                                                                                                                                                                                                                            F   	       K          V       W�O>     �   E   F          <				component = new AppBase.Components.ContentCard.Component5�_�                    E   =    ����                                                                                                                                                                                                                                                                                                                            F   	       J          V       W�O?     �   D   F   V      D				component = new AppBase.Components.ContentCard.Component options5�_�                    C       ����                                                                                                                                                                                                                                                                                                                            F   	       J          V       W�OH     �   C   E   V    �   C   D   V    5�_�      	              D       ����                                                                                                                                                                                                                                                                                                                            G   	       K          V       W�OJ     �   D   F   W    �   D   E   W    5�_�      
           	   E       ����                                                                                                                                                                                                                                                                                                                            H   	       L          V       W�ON     �   E   G   X    �   E   F   X    5�_�   	              
   C   D    ����                                                                                                                                                                                                                                                                                                                            I   	       M          V       W�OT    �   B   D   Y      K				component = new AppBase.Components.PrivateContentCard.Component options5�_�   
                 <   5    ����                                                                                                                                                                                                                                                                                                                                                             X�&    �   ;   =   Y      5		getEmptyView: -> new ContentWall.ColumnContentEmpty5�_�                    C       ����                                                                                                                                                                                                                                                                                                                                                             X�e(     �   B   D   Y      C				component = new AppBase.Components.PrivateContentCard.Component5�_�                    H       ����                                                                                                                                                                                                                                                                                                                                                             X�e*     �   G   I   Y      <				component = new AppBase.Components.ContentCard.Component5�_�                    O       ����                                                                                                                                                                                                                                                                                                                                                             X�e+    �   N   P   Y      			component.view5�_�                    A       ����                                                                                                                                                                                                                                                                                                                                                             X�eV    �   A   C   Z      			�   A   C   Y    5�_�                    B       ����                                                                                                                                                                                                                                                                                                                                                             X�ep     �   B   D   Z    �   B   C   Z    5�_�                    B       ����                                                                                                                                                                                                                                                                                                                                                             X�er    �   A   C   [      			console.log post._listenId5�_�                    B       ����                                                                                                                                                                                                                                                                                                                                                             X�e�     �   A   B          			console.log post.id5�_�                    B       ����                                                                                                                                                                                                                                                                                                                                                             X�e�    �   A   B          			console.log post._listenId5�_�                    B        ����                                                                                                                                                                                                                                                                                                                            C          C          V       X���     �               Y   [@AppBase.module "Components.ContentWall", (ContentWall, App, Backbone, Marionette, $, _) ->   @	class ContentWall.ColumnContent extends App.Views.CompositeView   		tagName: "li"   		className: "content_group"   )		template: "content_wall/column_content"       		ui:    			channel_icon: ".channel_icon"       			events:   ,			"click @ui.btn_open_moment": "showMoment"       		modelEvents:   &			"duplicate_post": (options = {}) ->   B				if duplicate_post_view = @children.findByModel options.newPost   _					@$el.parents(".nano-content:first").scrollTo duplicate_post_view.$el, 500, { offset: -15 }       		filter: (item) ->   I			# If the moments collection was filtered, determine if this moment had   @			# matching post IDs that this posts collection should also be   			# filtered by    			if @matching_post_ids?.length   !				item.id in @matching_post_ids   			else return true       		viewComparator: (item) ->   			label_match = 0       H			# If the post model doesn't have an ID yet, ensure it's sorted to the   			# bottom of the collection    			item_id = item.id or 99999999       &			if @matching_post_label_ids?.length   -				label_ids = item.get("labels").pluck "id"       				if label_ids.length is 0   "					label_ids = @moment_label_ids       A				if _.intersection(label_ids, @matching_post_label_ids).length   2					item.unset "no_label_match", { silent: true }   				else   8					item.set { no_label_match: true }, { silent: true }   					label_match = 1       4			[label_match, +item.systemScheduledAt(), item_id]       		initialize: (options = {}) ->   			super options       6			@matching_post_ids = @model.get "matching_post_ids"   B			@matching_post_label_ids = @model.get "matching_post_label_ids"   ,			@moment_label_ids = @model.getLabels true       /		getChildView: (post) -> @_buildChildView post       &		buildChildView: (item, view) -> view        		childViewContainer: ".content"       G		getEmptyView: -> new ContentWall.ColumnContentEmpty { model: @model }       		onRender: ->   			@_setIcon()       		_buildChildView: (post) ->   			if post.get "is_ghost"   D				@component = new AppBase.Components.PrivateContentCard.Component   					model: post   					moment: @model   					theme: "light"   			else   =				@component = new AppBase.Components.ContentCard.Component   					model: post   					moment: @model   					theme: "light"   /					services: OpalMoments.Collections.services   					view_mode: "single"       			@component.view       		_setIcon: ->   I			@ui.channel_icon.removeClass -> $(@).prop("class").match /generic-\w+/       			# e.g. `"blue star"`   6			if icon_name = @model.get("group")?.get "icon_name"   F				@ui.channel_icon.addClass -> "generic_#{icon_name.split(/\s/)[1]}"       			# Render tooltips   			@ui.channel_icon.tooltip()5�_�                            ����                                                                                                                                                                                                                                                                                                                            C          C          V       X���    �         S    �         S    5�_�                           ����                                                                                                                                                                                                                                                                                                                            H          H          V       X��     �         Y      			�         X    5�_�                           ����                                                                                                                                                                                                                                                                                                                            J          J          V       X��   	 �         [      			�         Z    5�_�                          ����                                                                                                                                                                                                                                                                                                                            K          K          V       X��H     �                		onRender: ->5�_�                           ����                                                                                                                                                                                                                                                                                                                            J          J          V       X��H     �                			console.log "RENDERED"5�_�                            ����                                                                                                                                                                                                                                                                                                                            I          I          V       X��I     �         Y           �         Y       5�_�                    C       ����                                                                                                                                                                                                                                                                                                                            H          H          V       X��K    �   C   E   X    �   C   D   X    5�_�                    D       ����                                                                                                                                                                                                                                                                                                                            I          I          V       X���    �   C   D          			console.log "RENDERED"5�_�                             ����                                                                                                                                                                                                                                                                                                                                                 V       X���    �                		serializeData: ->   			{   				isGhost: @model.isGhost()   			}    5�_�                           ����                                                                                                                                                                                                                                                                                                                            K          K          V       X��=   
 �         [      		initialize: ->5��