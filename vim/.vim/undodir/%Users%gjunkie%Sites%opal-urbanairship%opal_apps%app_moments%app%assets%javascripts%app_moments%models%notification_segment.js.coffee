Vim�UnDo� .;�\ ��*�9�B�.`-S�^p��X|ɡ�sj��                                     V;�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             V:�     �                   �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             V:�     �                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       V;     �   
                 			type: Backbone.HasOne   			key: "approval_phase_group"   8			relatedModel: "OpalMoments.Models.ApprovalPhaseGroup"   			includeInJSON: true   		,5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        V;     �   
          	       			type: Backbone.HasMany   			key: "labels"   			keySource: "label_ids"   			keyDestination: "label_ids"   $			relatedModel: "Opal.Models.Label"   ,			collectionType: "Opal.Collections.Labels"   -			includeInJSON: Backbone.Model::idAttribute   		,5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        V;     �   
                 			type: Backbone.HasMany   			key: "members"   '			keyDestination: "members_attributes"   ,			relatedModel: "OpalMoments.Models.Member"   4			collectionType: "OpalMoments.Collections.Members"   			includeInJSON: false5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                  V        V;     �   	   
          		,5�_�                           ����                                                                                                                                                                                                                                                                                                                            
           
           V        V;#     �         +      S	class OpalMoments.Models.LocalizationTemplatePost extends Backbone.RelationalModel5�_�      	                      ����                                                                                                                                                                                                                                                                                                                               &          &       V   /    V;/     �                3			@on "change:responsible_user_ids", @setupMembers   >			@on "change:approval_phase_group", @setupApprovalPhaseGroup5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                               &          &       V   /    V;0     �                 5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                V       V;1     �                			@setupMembers()   			@setupApprovalPhaseGroup()5�_�   
                         ����                                                                                                                                                                                                                                                                                                                            $                     V       V;L     �                    ,		approverGroup: (enabled_required=false) ->   			account = @get "account"       I			if account? and (not enabled_required or account.get("has_approvers"))   1				approver_group = account.get "approver_group"       ,				if approver_group?.get("members").length   					approver_group       +		approverGroupName: -> "Account Approvers"       )		hasPassed: -> moment() > @scheduledAt()   P		scheduledAt: -> moment.tz(@get("scheduled_at"), @get("scheduled_at_timezone"))   '		isScheduled: -> !!@get "scheduled_at"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        V;�     �                    		setupApprovalPhaseGroup: ->   %			unless @get "approval_phase_group"   ^				@set { approval_phase_group: new OpalMoments.Models.ApprovalPhaseGroup }, { silent: true }   				@get "approval_phase_group"5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  V        V;�    �                    		setupMembers: ->   U			@get("members").reset _.map @get("responsible_user_ids"), (responsible_user_id) ->   $				{ user_id: responsible_user_id }5��