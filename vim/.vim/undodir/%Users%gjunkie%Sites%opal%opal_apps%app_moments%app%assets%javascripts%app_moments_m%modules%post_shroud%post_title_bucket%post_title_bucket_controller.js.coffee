Vim�UnDo� ���8n�̌p��}�Z[�N�ĭ�_oת,��                    -       -   -   -    W�U�   
 _�                            ����                                                                                                                                                                                                                                                                                                                                                             W��.     �               2				is_public = not options.model.get "is_private"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             W��2     �               3				is_private = not options.model.get "is_private"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             W��2     �               0				is_private =  options.model.get "is_private"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             W��5    �               &				@view.togglePrivacyLabel is_public5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             W�N.    �      
         				�      
       5�_�                       1    ����                                                                                                                                                                                                                                                                                                                                                             W�NH     �      	         ;			@listenTo @view, "action:toggle:privacy", (is_public) =>5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             W�NN     �      
         				console.log is_public5�_�      	              
   6    ����                                                                                                                                                                                                                                                                                                                                                             W�NR     �   	            >				@model.get("privacy_group").set { is_active: !!is_public }5�_�      
           	      )    ����                                                                                                                                                                                                                                                                                                                                                             W�NT     �   
            /				@trigger "action:toggle:privacy", is_public5�_�   	              
   	       ����                                                                                                                                                                                                                                                                                                                                                             W�N^     �   	          �   	   
       5�_�   
                 
       ����                                                                                                                                                                                                                                                                                                                                                             W�Na     �   	   
          '				@view.togglePrivacyLabel is_private5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             W�N�     �             �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             W�N�     �               '					@view.setupNameVisibilityOptions()5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             W�N�     �               				�             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       W�N�     �               &				@view.setupNameVisibilityOptions()5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       W�N�     �               				if is_private   "@view.setupNameVisibilityOptions()�               '					@view.setupNameVisibilityOptions()5�_�                           ����                                                                                                                                                                                                                                                                                                                               !          !       v       W�N�     �                9				if is_private then @view.setupNameVisibilityOptions()5�_�                    
        ����                                                                                                                                                                                                                                                                                                                               !          !       v       W�N�    �   
          �   
          5�_�                    	       ����                                                                                                                                                                                                                                                                                                                               !          !       v       W�O�    �      	          				console.log is_private5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v       W�SU     �             �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v       W�SV     �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v       W�Sa     �             �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v       W�Sb     �               $			@model.trigger "change:code_name"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v       W�Sq     �             �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v       W�Sr    �               9			@trigger "change:code_name:visibility", show_code_name5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v       W�S�    �             �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v       W�T�     �               �               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v       W�T�     �                				if @model.get "is_private"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v       W�T�     �                '					@view.setupNameVisibilityOptions()5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  v       W�T�     �              �              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v       W�T�     �                '					@view.setupNameVisibilityOptions()5�_�      !                      ����                                                                                                                                                                                                                                                                                                                                                  v       W�T�    �                5					@view.setupTitleVisibilityOptions show_code_name5�_�       "           !          ����                                                                                                                                                                                                                                                                                                                                                  v       W�U      �               				�             5�_�   !   #           "          ����                                                                                                                                                                                                                                                                                                                                                  v       W�U     �             �             5�_�   "   $           #          ����                                                                                                                                                                                                                                                                                                                                                  v       W�U     �               				console.log options.model5�_�   #   %           $          ����                                                                                                                                                                                                                                                                                                                                                  v       W�U     �               				console.log .model5�_�   $   &           %          ����                                                                                                                                                                                                                                                                                                                                                  v       W�U    �               				console.log model5�_�   %   '           &          ����                                                                                                                                                                                                                                                                                                                                         "       v   .    W�U-     �               /				is_private = options.model.get "is_private"5�_�   &   (           '          ����                                                                                                                                                                                                                                                                                                                                         "       v   .    W�U0     �               				is_private = "is_private"5�_�   '   )           (           ����                                                                                                                                                                                                                                                                                                                                                 V   .    W�U6     �                				console.log options.model   				console.log @model    5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                                                 V   .    W�U;     �               				if @model.isPrivate()5�_�   )   +           *          ����                                                                                                                                                                                                                                                                                                                                                 V   .    W�U<     �               					if ()5�_�   *   ,           +          ����                                                                                                                                                                                                                                                                                                                                                 V   .    W�U<     �               				if )5�_�   +   -           ,          ����                                                                                                                                                                                                                                                                                                                                                 V   .    W�U>   	 �               				if 5�_�   ,               -   	       ����                                                                                                                                                                                                                                                                                                                            	          	          V       W�U�   
 �      	          ?				@model.get("privacy_group").set { is_active: !!is_private }5��