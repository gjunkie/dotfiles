Vim�UnDo� @2��6r�KrZ΄��Z�:��k���2�A����   (           &      )       )   )   )    Z ��    _�                             ����                                                                                                                                                                                                                                                                                                                                                             Y��     �               &   .#= require ../post_panel/post_panel_controller       T@OpalMoments_m.module "PostShroud", (PostShroud, App, Backbone, Marionette, $, _) ->   U  class PostShroud.PostApprovalPanelController extends PostShroud.PostPanelController   !    initialize: (options = {}) ->         @model = options.model   ;      @setView new PostShroud.PostApprovalPanelView options       O      @deliveryController = new PostShroud.PostDeliveryBucketController options   M      @liveUrlController = new PostShroud.PostLiveUrlBucketController options   U      @approvalController = new PostShroud.PostApprovalStatusBucketController options   Y      @contentStatusController = new PostShroud.PostContentStatusBucketController options   O      @postPhaseListController = new PostShroud.PostPhaseListController options       (      @listenTo @view, "before:show", =>   :        @view.approvalRegion.show @approvalController.view   8        @view.liveUrlRegion.show @liveUrlController.view   :        @view.deliveryRegion.show @deliveryController.view   D        @view.contentStatusRegion.show @contentStatusController.view   @        @view.phaseListRegion.show @postPhaseListController.view   9        Notifier.trigger "approvals_enhancements_pro_tip"             @_setupListeners()           _setupListeners: ->   4      @listenTo @model, "change:delivery_method", =>   .        @_updateLabelWarning "delivery_method"       4      @listenTo @model, "change:publishing_mode", =>   .        @_updateLabelWarning "publishing_mode"       5      @listenTo @model, "change:delivery_user_id", =>   /        @_updateLabelWarning "delivery_user_id"       "    _updateLabelWarning: (name) ->         return unless name?          valid = !!@model.get(name)   )      @view.toggleWarning name, not valid5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Y�(     �               $   .#= require ../post_panel/post_panel_controller       T@OpalMoments_m.module "PostShroud", (PostShroud, App, Backbone, Marionette, $, _) ->   U  class PostShroud.PostApprovalPanelController extends PostShroud.PostPanelController   !    initialize: (options = {}) ->         @model = options.model   ;      @setView new PostShroud.PostApprovalPanelView options       O      @deliveryController = new PostShroud.PostDeliveryBucketController options   M      @liveUrlController = new PostShroud.PostLiveUrlBucketController options   U      @approvalController = new PostShroud.PostApprovalStatusBucketController options   Y      @contentStatusController = new PostShroud.PostContentStatusBucketController options       (      @listenTo @view, "before:show", =>   :        @view.approvalRegion.show @approvalController.view   8        @view.liveUrlRegion.show @liveUrlController.view   :        @view.deliveryRegion.show @deliveryController.view   D        @view.contentStatusRegion.show @contentStatusController.view   9        Notifier.trigger "approvals_enhancements_pro_tip"             @_setupListeners()           _setupListeners: ->   4      @listenTo @model, "change:delivery_method", =>   .        @_updateLabelWarning "delivery_method"       4      @listenTo @model, "change:publishing_mode", =>   .        @_updateLabelWarning "publishing_mode"       5      @listenTo @model, "change:delivery_user_id", =>   /        @_updateLabelWarning "delivery_user_id"       "    _updateLabelWarning: (name) ->         return unless name?          valid = !!@model.get(name)   )      @view.toggleWarning name, not valid5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Y�9     �       '       $   .#= require ../post_panel/post_panel_controller       T@OpalMoments_m.module "PostShroud", (PostShroud, App, Backbone, Marionette, $, _) ->   U  class PostShroud.PostApprovalPanelController extends PostShroud.PostPanelController   !    initialize: (options = {}) ->         @model = options.model   ;      @setView new PostShroud.PostApprovalPanelView options       O      @deliveryController = new PostShroud.PostDeliveryBucketController options   M      @liveUrlController = new PostShroud.PostLiveUrlBucketController options   U      @approvalController = new PostShroud.PostApprovalStatusBucketController options   Y      @contentStatusController = new PostShroud.PostContentStatusBucketController options       (      @listenTo @view, "before:show", =>   :        @view.approvalRegion.show @approvalController.view   8        @view.liveUrlRegion.show @liveUrlController.view   :        @view.deliveryRegion.show @deliveryController.view   D        @view.contentStatusRegion.show @contentStatusController.view   9        Notifier.trigger "approvals_enhancements_pro_tip"             @_setupListeners()           _setupListeners: ->   4      @listenTo @model, "change:delivery_method", =>   .        @_updateLabelWarning "delivery_method"       4      @listenTo @model, "change:publishing_mode", =>   .        @_updateLabelWarning "publishing_mode"       5      @listenTo @model, "change:delivery_user_id", =>   /        @_updateLabelWarning "delivery_user_id"       "    _updateLabelWarning: (name) ->         return unless name?          valid = !!@model.get(name)   )      @view.toggleWarning name, not valid5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Y��     �      
   &    �      	   &    5�_�                    	        ����                                                                                                                                                                                                                                                                                                                            	           	   F       v   F    Y��     �      
   '      O      @deliveryController = new PostShroud.PostDeliveryBucketController options5�_�      	              	        ����                                                                                                                                                                                                                                                                                                                            	           	   F       v   F    Y��     �      
   '      (      @deliveryController = new  options5�_�      
           	   	       ����                                                                                                                                                                                                                                                                                                                            	           	   F       v   F    Y��     �      
   '      U      @deliveryController = new PostShroud.PostApprovalStatusBucketController options5�_�   	              
   	       ����                                                                                                                                                                                                                                                                                                                            	           	   F       v   F    Y��     �      	          Q      @approvalStatus = new PostShroud.PostApprovalStatusBucketController options5�_�   
                         ����                                                                                                                                                                                                                                                                                                                            	           	   F       v   F    Y��     �      
   &    �      	   &    5�_�                       #    ����                                                                                                                                                                                                                                                                                                                            
           
   F       v   F    Y�     �         '    �         '    5�_�                           ����                                                                                                                                                                                                                                                                                                                            
           
   F       v   F    Y�     �         (      :        @view.approvalRegion.show @approvalController.view5�_�                       #    ����                                                                                                                                                                                                                                                                                                                            
           
   F       v   F    Y�	    �         (      :        @view.approvalStatus.show @approvalController.view5�_�                           ����                                                                                                                                                                                                                                                                                                                            
           
   F       v   F    Y�{    �         (      6        @view.approvalStatus.show @approvalStatus.view5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       Z �     �             	       (      @listenTo @view, "before:show", =>   <        @view.approvalStatusRegion.show @approvalStatus.view   :        @view.approvalRegion.show @approvalController.view   8        @view.liveUrlRegion.show @liveUrlController.view   :        @view.deliveryRegion.show @deliveryController.view   D        @view.contentStatusRegion.show @contentStatusController.view   @        @view.phaseListRegion.show @postPhaseListController.view   9        Notifier.trigger "approvals_enhancements_pro_tip"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       Z �     �             �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       Z �     �                 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       Z �     �         '    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       Z �     �         *      '	@listenTo @postPhaseListController, ""�         )      		�         (    5�_�                       4    ����                                                                                                                                                                                                                                                                                                                                                 V       Z �$    �         *      4	@listenTo @postPhaseListController, "workflow:save"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z �j     �         *      Q	@listenTo @postPhaseListController, "workflow:save", -> @trigger "workflow:save"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z �j     �         *      P@listenTo @postPhaseListController, "workflow:save", -> @trigger "workflow:save"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z �j     �         *      P@listenTo @postPhaseListController, "workflow:save", -> @trigger "workflow:save"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z �j     �         *      R  @listenTo @postPhaseListController, "workflow:save", -> @trigger "workflow:save"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        Z �k    �         *      T    @listenTo @postPhaseListController, "workflow:save", -> @trigger "workflow:save"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v        Z ݷ     �                V      @listenTo @postPhaseListController, "workflow:save", -> @trigger "workflow:save"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v        Z ݹ     �                W      #@listenTo @postPhaseListController, "workflow:save", -> @trigger "workflow:save"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v        Z �n    �                V      @listenTo @postPhaseListController, "workflow:save", -> @trigger "workflow:save"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v        Z ��     �         *      W      #@listenTo @postPhaseListController, "workflow:save", -> @trigger "workflow:save"5�_�      "                 (    ����                                                                                                                                                                                                                                                                                                                                                  v        Z ��    �         *      V      @listenTo @postPhaseListController, "workflow:save", -> @trigger "workflow:save"5�_�      #           "          ����                                                                                                                                                                                                                                                                                                                               ,          ,       v   ,    Z �v     �                [      @listenTo @postPhaseListController.view, "workflow:save", -> @trigger "workflow:save"5�_�   "   $           #           ����                                                                                                                                                                                                                                                                                                                               ,          ,       v   ,    Z �v   	 �                 5�_�   #   %           $           ����                                                                                                                                                                                                                                                                                                                               ,          ,       v   ,    Z ��     �                	5�_�   $   &           %           ����                                                                                                                                                                                                                                                                                                                               ,          ,       v   ,    Z ��     �                 5�_�   %   '           &           ����                                                                                                                                                                                                                                                                                                                               ,          ,       v   ,    Z ��   
 �                 5�_�   &   (           '          ����                                                                                                                                                                                                                                                                                                                               ,          ,       v   ,    Z ��     �          %    5�_�   '   )           (          ����                                                                                                                                                                                                                                                                                                                               ,          ,       v   ,    Z ��     �         &    5�_�   (               )          ����                                                                                                                                                                                                                                                                                                                               ,          ,       v   ,    Z ��    �         '    5�_�      !       "              ����                                                                                                                                                                                                                                                                                                                               ,          ,       v   ,    Z �t     �              5�_�                   !           ����                                                                                                                                                                                                                                                                                                                               ,          ,       v   ,    Z �u     �              5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Y��     �      	   &    �      	   &      O      @deliveryController = new PostShroud.PostDeliveryBucketController options5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             Y��     �      	   '    �      	   '      O      @deliveryController = new PostShroud.PostDeliveryBucketController options5��