Vim�UnDo� �	�H=�����އ7���.ǚI�E�L��   c   					theme: @options.theme   	         E       E   E   E    WC��    _�                     1       ����                                                                                                                                                                                                                                                                                                                                                             WCP�     �   0   2   `      			@ui.note.show()5�_�                    1       ����                                                                                                                                                                                                                                                                                                                                                             WCP�     �   0   2   `      			@ui.note.addClass()5�_�                    1       ����                                                                                                                                                                                                                                                                                                                                                             WCP�     �   0   2   `      			@ui.note.addClass("active")5�_�                    1       ����                                                                                                                                                                                                                                                                                                                                                             WCP�     �   0   2   `       			@ui.note.addClass("isactive")5�_�                    1       ����                                                                                                                                                                                                                                                                                                                                                             WCP�    �   0   2   `      			@ui.note.addClass("isctive")5�_�                    6       ����                                                                                                                                                                                                                                                                                                                                                             WCP�     �   6   8   `    �   6   7   `    5�_�                    6       ����                                                                                                                                                                                                                                                                                                                                                             WCP�     �   5   6          			@ui.note.hide()5�_�      	              6       ����                                                                                                                                                                                                                                                                                                                                                             WCP�     �   5   7   `       			@ui.note.addClass("isActive")5�_�      
           	   6       ����                                                                                                                                                                                                                                                                                                                                                             WCP�     �   5   7   `      			@ui.note.ddClass("isActive")5�_�   	              
   6       ����                                                                                                                                                                                                                                                                                                                                                             WCP�     �   5   7   `      			@ui.note.dClass("isActive")5�_�   
                 6       ����                                                                                                                                                                                                                                                                                                                                                             WCP�    �   5   7   `      			@ui.note.Class("isActive")5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             WC��     �               `   M@AppBase.module "Components.Note", (Note, App, Backbone, Marionette, $, _) ->   .	class Note.Input extends App.Views.LayoutView   		behaviors:   			CharacterCounter: {}       		template: "note/input"   		className: "note_wrapper"       		bindings:   			".note_comment": "comment"       
		regions:   ,			"uploaderRegion": ".note_uploader_region"   (			"assetsRegion": ".note_assets_region"   3			"assetsLinksRegion": ".note_assets_links_region"       		ui:   			add_note: ".add_note"   			remove_note: ".remove_note"   			note: ".note"   *			attachment_images: ".attachment_images"    			note_comment: ".note_comment"       			events:   $			"click @ui.add_note": "_showNote"   )			"click @ui.remove_note": "_removeNote"       		modelEvents:   #			"change:comment": "_noteUpdated"       "		assetReferencesCollectionEvents:   %			"add remove reset": "_noteUpdated"       		initialize: (options={}) ->   +			{ @allow_assets, @view_style } = options       			@_setStyle()   			@_initializeUploader()       		onBeforeShow: ->   			@_showUploader()       		_setStyle: ->   '			@$el.addClass "style_#{@view_style}"       		_showNote: ->   			@ui.add_note.hide()   			@ui.remove_note.show()    			@ui.note.addClass("isActive")       		_removeNote: ->   			@ui.add_note.show()   			@ui.remove_note.hide()   #			@ui.note.removeClass("isActive")       			@_clearAssets()   			@model.set { comment: "" }   #			@ui.note_comment.trigger "keyup"       F		_noteUpdated: -> @model.set { note_updated: true }, { silent: true }       		# --------------------------   		# Uploader   		# --------------------------       		_initializeUploader: ->   			if @allow_assets   				_.bindAll @, "_setAsset"       6				@asset_references = @model?.get "asset_references"   V				Marionette.bindEntityEvents @, @asset_references, @assetReferencesCollectionEvents       8				@uploader_view = AppBase.request "uploader:wrapper",   					config:   						type: "file"   						is_droppable: false   						multiple: true   4					view: AppBase.request "uploader:view", "notes",   J						label: "Drop an image here from your desktop, or click to find one."       9				@listenTo @uploader_view, "uploader:done", @_setAsset       		_showUploader: ->   			if @allow_assets   '				@uploaderRegion.show @uploader_view   7				@assetsRegion.show new Opal.Views.AttachmentWrapper   					# TODO I18n   					attachment_type: "Files"   "					collection: @asset_references   					admin_controls: true       G		_setAsset: (asset_reference) -> @asset_references.add asset_reference       		_clearAssets: ->   			if @allow_assets   *				@model.get("asset_references").reset()5�_�                   3       ����                                                                                                                                                                                                                                                                                                                            4          3          V       WC�d     �   2   3          			@ui.add_note.hide()   			@ui.remove_note.show()5�_�                    6        ����                                                                                                                                                                                                                                                                                                                            6          7          V       WC�e   
 �   5   6          			@ui.add_note.show()   			@ui.remove_note.hide()5�_�                    6       ����                                                                                                                                                                                                                                                                                                                            6          6          V       WC��     �   5   7   `      #			@ui.note.removeClass("isActive")5�_�                    3       ����                                                                                                                                                                                                                                                                                                                            6          6          V       WC��    �   2   4   `       			@ui.note.addClass("isActive")5�_�                           ����                                                                                                                                                                                                                                                                                                                            6          6          V       WC�     �       a       `   M@AppBase.module "Components.Note", (Note, App, Backbone, Marionette, $, _) ->   .	class Note.Input extends App.Views.LayoutView   		behaviors:   			CharacterCounter: {}       		template: "note/input"   		className: "note_wrapper"       		bindings:   			".note_comment": "comment"       
		regions:   ,			"uploaderRegion": ".note_uploader_region"   (			"assetsRegion": ".note_assets_region"   3			"assetsLinksRegion": ".note_assets_links_region"       		ui:   			add_note: ".add_note"   			remove_note: ".remove_note"   			note: ".note"   *			attachment_images: ".attachment_images"    			note_comment: ".note_comment"       		icons:   			plus_fill:   				$parent: ".add_note_icon"       			events:   $			"click @ui.add_note": "_showNote"   )			"click @ui.remove_note": "_removeNote"       		modelEvents:   #			"change:comment": "_noteUpdated"       "		assetReferencesCollectionEvents:   %			"add remove reset": "_noteUpdated"       		initialize: (options={}) ->   +			{ @allow_assets, @view_style } = options       			@_setStyle()   			@_initializeUploader()       		onBeforeShow: ->   			@_showUploader()       		_setStyle: ->   '			@$el.addClass "style_#{@view_style}"       		_showNote: ->   			@$el.addClass("isActive")       		_removeNote: ->   			@$el.removeClass("isActive")       			@_clearAssets()   			@model.set { comment: "" }   #			@ui.note_comment.trigger "keyup"       F		_noteUpdated: -> @model.set { note_updated: true }, { silent: true }       		# --------------------------   		# Uploader   		# --------------------------       		_initializeUploader: ->   			if @allow_assets   				_.bindAll @, "_setAsset"       6				@asset_references = @model?.get "asset_references"   V				Marionette.bindEntityEvents @, @asset_references, @assetReferencesCollectionEvents       8				@uploader_view = AppBase.request "uploader:wrapper",   					config:   						type: "file"   						is_droppable: false   						multiple: true   4					view: AppBase.request "uploader:view", "notes",   J						label: "Drop an image here from your desktop, or click to find one."       9				@listenTo @uploader_view, "uploader:done", @_setAsset       		_showUploader: ->   			if @allow_assets   '				@uploaderRegion.show @uploader_view   7				@assetsRegion.show new Opal.Views.AttachmentWrapper   					# TODO I18n   					attachment_type: "Files"   "					collection: @asset_references   					admin_controls: true       G		_setAsset: (asset_reference) -> @asset_references.add asset_reference       		_clearAssets: ->   			if @allow_assets   *				@model.get("asset_references").reset()5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       WC�     �         `    �         `    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       WC�     �         c      				�         b    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       WC�     �         c    �         c    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       WC�     �         d      				$parent: ".add_note_icon"5�_�      !                      ����                                                                                                                                                                                                                                                                                                                                                V       WC�     �         d      				$parent: ".dd_note_icon"5�_�       "           !          ����                                                                                                                                                                                                                                                                                                                                                V       WC�     �         d      				$parent: ".d_note_icon"5�_�   !   &           "          ����                                                                                                                                                                                                                                                                                                                                                V       WC�    �         d      				$parent: "._note_icon"5�_�   "   '   #       &          ����                                                                                                                                                                                                                                                                                                                                                V       WC�
     �         d      				theme: "n5"5�_�   &   (           '          ����                                                                                                                                                                                                                                                                                                                                                V       WC�     �         d      				theme: "n5"5�_�   '   )           (          ����                                                                                                                                                                                                                                                                                                                                                V       WC�    �         d      				theme: "n"5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                                                V       WC��    �                			plus_fill:    				$parent: ".remove_note_icon"   				theme: "n8"5�_�   )   +           *          ����                                                                                                                                                                                                                                                                                                                                                  V       WC�h    �         a      		className: "note_wrapper"5�_�   *   ,           +          ����                                                                                                                                                                                                                                                                                                                                                  V       WC�t    �         a      		className: "noteWrapper"5�_�   +   -           ,   -       ����                                                                                                                                                                                                                                                                                                                                                  V       WC�c     �   -   /   b      			�   -   /   a    5�_�   ,   .           -   -       ����                                                                                                                                                                                                                                                                                                                                                  V       WC�l     �   -   /   b    �   -   .   b    5�_�   -   /           .   /       ����                                                                                                                                                                                                                                                                                                                                                  V       WC�l     �   .   /          			5�_�   .   0           /   .       ����                                                                                                                                                                                                                                                                                                                                                  V       WC�{     �   -   /   b      '			@$el.addClass "style_#{@view_style}"5�_�   /   1           0   .       ����                                                                                                                                                                                                                                                                                                                                                  V       WC�{     �   -   /   b      &			@$el.addClass "tyle_#{@view_style}"5�_�   0   2           1   .       ����                                                                                                                                                                                                                                                                                                                                                  V       WC�{     �   -   /   b      %			@$el.addClass "yle_#{@view_style}"5�_�   1   3           2   .       ����                                                                                                                                                                                                                                                                                                                                                  V       WC�{     �   -   /   b      $			@$el.addClass "le_#{@view_style}"5�_�   2   4           3   .       ����                                                                                                                                                                                                                                                                                                                                                  V       WC�{     �   -   /   b      #			@$el.addClass "e_#{@view_style}"5�_�   3   5           4   .       ����                                                                                                                                                                                                                                                                                                                                                  V       WC�}     �   -   /   b      "			@$el.addClass "_#{@view_style}"5�_�   4   6           5   .       ����                                                                                                                                                                                                                                                                                                                                                  V       WC�     �   -   /   b      +			@$el.addClass "noteInput_#{@view_style}"5�_�   5   7           6   .       ����                                                                                                                                                                                                                                                                                                                                                  V       WC�     �   -   /   b      *			@$el.addClass "noteInput#{@view_style}"5�_�   6   8           7   .       ����                                                                                                                                                                                                                                                                                                                                                  V       WC��     �   -   .          ,			@$el.addClass "noteInput--#{@view_style}"5�_�   7   9           8   0       ����                                                                                                                                                                                                                                                                                                                                                  V       WC��     �   0   2   a    �   0   1   a    5�_�   8   :           9   2       ����                                                                                                                                                                                                                                                                                                                                                  V       WC��    �   1   2          '			@$el.addClass "style_#{@view_style}"5�_�   9   ;           :   1        ����                                                                                                                                                                                                                                                                                                                                                  V       WC��     �   0   2   a      ,			@$el.addClass "noteInput--#{@view_style}"5�_�   :   <           ;   (       ����                                                                                                                                                                                                                                                                                                                                                  V       WC��    �   '   )   a      +			{ @allow_assets, @view_style } = options5�_�   ;   =           <   *       ����                                                                                                                                                                                                                                                                                                                                                  V       WC��     �   )   *          			@_setStyle()5�_�   <   >           =   ,       ����                                                                                                                                                                                                                                                                                                                                                  V       WC��    �   ,   .   `    �   ,   -   `    5�_�   =   ?           >          ����                                                                                                                                                                                                                                                                                                                                                  V       WC��     �         a      			CharacterCounter: {}5�_�   >   @           ?          ����                                                                                                                                                                                                                                                                                                                                                  V       WC��    �         a      			CharacterCounter: 5�_�   ?   A           @          ����                                                                                                                                                                                                                                                                                                                                                V   (    WC��     �                		behaviors:   			CharacterCounter:   				options:   					theme: @options.theme5�_�   @   B           A           ����                                                                                                                                                                                                                                                                                                                                                V   (    WC��     �         _      .	class Note.Input extends App.Views.LayoutView    �         _       5�_�   A   C           B          ����                                                                                                                                                                                                                                                                                                                               G          :       V   (    WC��     �      	   ^    �         ^    5�_�   B   D           C          ����                                                                                                                                                                                                                                                                                                                               G          :       V   (    WC��    �         b    5�_�   C   E           D   	       ����                                                                                                                                                                                                                                                                                                                               G          :       V   (    WC��     �      
   c      					theme: @options.theme5�_�   D               E   	       ����                                                                                                                                                                                                                                                                                                                               G          :       V   (    WC��    �      
   c      					theme: @.theme5�_�   "   $       &   #          ����                                                                                                                                                                                                                                                                                                                                                V       WC�Z     �         d      			lus_fill:5�_�   #   %           $          ����                                                                                                                                                                                                                                                                                                                                                V       WC�Z     �         d      			us_fill:5�_�   $               %          ����                                                                                                                                                                                                                                                                                                                                                V       WC�Z     �         d      
			s_fill:5�_�                   3       ����                                                                                                                                                                                                                                                                                                                            6          7          V       WC��     �   2   5        5�_�                    6        ����                                                                                                                                                                                                                                                                                                                                                V       WC��    �   5   8        5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       WC��     �         `    �         `      			plus_fill:   				$parent: ".add_note_icon"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       WC��     �         b      				$parent: ".dd_note_icon"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       WC��     �         b      				$parent: ".d_note_icon"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       WC��     �         b      				$parent: "._note_icon"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       WC��    �         b       				$parent: ".remove_note_icon"5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                V       WC��     �         b      				�         c      				theme: "n5"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       WC��   	 �         c    �         c      				theme: "n5"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             WCT    �         `      			�         a          		icons:   
			upload:   				$parent: ""�         d      				$parent: ".add_note_icon"5��