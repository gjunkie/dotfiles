Vim�UnDo� �� d����&���J�j�
s"�>3׾z�   5   			   
                          WҎ    _�                             ����                                                                                                                                                                                                                                                                                                                                                             WL     �         5      	�         4    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             WY     �         9      	# ##5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                             W\    �         9      
	# @module5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V       W�     �                	###   	# blah   	#   	# @module ApprovalQueue   	###5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V       W�     �          4    �         4    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       W�    �          9      	###   	# blah   	#   	# @module ApprovalQueue   	###5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       W�l     �               9   ###   # blah   #   # @module ApprovalQueue   ###   Z@OpalMoments_m.module "ApprovalQueue", (ApprovalQueue, App, Backbone, Marionette, $, _) ->   <	class ApprovalQueue.Controller extends App.Controllers.Base   		initialize: (options = {}) ->   			@_setupRadio()       5			@approvals = new OpalMoments.Collections.Approvals   A			@approvals_moments = OpalMoments.Collections.moments_approvals   =			@approvals_posts = OpalMoments.Collections.posts_approvals   [			@approvals_count = OpalMoments.State.approval_counts[OpalMoments.State.current_brand.id]   -			@layout = new ApprovalQueue.Layout options       			# Fetch approval data   			@_fetchApprovalData()       H			# Also fetch approval data when the collection is updated (from push)   7			@listenTo @approvals, "refresh", @_fetchApprovalData   D			@listenTo @approvals_posts, "approval_added", @_fetchApprovalData       6			@listenTo @layout, "show", @_checkApprovalAppViewed       			@show @layout       B		# Check to see if user has seen iOS approval in-app notification   		_checkApprovalAppViewed: ->   			excluded = [583, 658]   3			return if Opal.State.this_company.id in excluded   m			pro_tips_viewed = OpalPeople.request("user_settings:get_current_user_settings").get "pro_tip_cards_viewed"   I			has_viewed_pro_tip = _.contains pro_tips_viewed, "mobile:approvalsApp"       K			unless has_viewed_pro_tip then AppBase.execute "show:proTip:approvalApp"       		_fetchApprovalData: ->   			promise = @approvals.fetch   				reset: true   				silent: true   					data:   					bootstrap: true       			promise.then =>   				@_loadApprovalData()       		_getApprovalData: ->   			approvals: @approvals   (			approvals_moments: @approvals_moments   $			approvals_posts: @approvals_posts   $			approvals_count: @approvals_count       		_loadApprovalData: ->   /			@layout?.loadedApprovals @_getApprovalData()       		_setupRadio: ->   F			ApprovalQueue.Radio = supernova.Helpers.createRadio "ApprovalQueue"5�_�                     	       ����                                                                                                                                                                                                                                                                                                                                                 V       Wҍ    �   	      5      			�   	      4    5��