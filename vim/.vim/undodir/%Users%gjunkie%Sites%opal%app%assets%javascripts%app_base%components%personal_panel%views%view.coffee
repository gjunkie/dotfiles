Vim�UnDo� �j
&�C�i�e��q$_�!�f�qTKM�   �                                      Y��    _�                            ����                                                                                                                                                                                                                                                                                                                                                             Y��m     �      	   �      	  �      	       5�_�                       $    ����                                                                                                                                                                                                                                                                                                                                                             Y���    �      	   �      $	  @listenTo AppBase, "shroud:close"5�_�                       &    ����                                                                                                                                                                                                                                                                                                                                                             Y���    �      	   �      =	  @listenTo AppBase, "shroud:close", @_toggleLeftHandPreview5�_�                       @    ����                                                                                                                                                                                                                                                                                                                                                             Y���    �      	   �      @	  @listenTo AppBase, "shroud:close", => @_toggleLeftHandPreview5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Y��    �      	   �      B	  @listenTo AppBase, "shroud:close", => @_toggleLeftHandPreview()5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Y���     �      	   �      E      @listenTo AppBase, "shroud:close", => @_toggleLeftHandPreview()5�_�                           ����                                                                                                                                                                                                                                                                                                                                         &       v   &    Y���     �      	   �      F      @listenTo document, "shroud:close", => @_toggleLeftHandPreview()5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                         &       v   &    Y���     �      	   �      :      @listenTo document, "", => @_toggleLeftHandPreview()5�_�      
           	      $    ����                                                                                                                                                                                                                                                                                                                               $          <       v   <    Y���     �      	   �      =      @listenTo document, "all", => @_toggleLeftHandPreview()5�_�   	              
      #    ����                                                                                                                                                                                                                                                                                                                               $          <       v   <    Y���     �      
   �              �      
   �    5�_�   
                    #    ����                                                                                                                                                                                                                                                                                                                               $          <       v   <    Y���    �      	   �      $      @listenTo document, "all", => 5�_�                            ����                                                                                                                                                                                                                                                                                                                               "       	          V   "    Y���    �                #      @listenTo document, "all", =>           console.log arguments5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V   "    Y�:    �                  _@AppBase.module "Components.PersonalPanel", (PersonalPanel, App, Backbone, Marionette, $, _) ->   9  class PersonalPanel.Layout extends App.Views.LayoutView       className: "personalPanel"   %    template: "personal_panel/layout"           initialize: ->   8      @model = AppBase.request('users:get_current_user')           onBeforeShow: ->         @_renderComponent()           _renderComponent: ->   .      ReactDOM.unmountComponentAtNode(@$el[0])         @_updateComponent()           _updateComponent: ->   )      component = @_createPersonalPanel()         if component   +        ReactDOM.render(component, @$el[0])       %    _toggleLeftHandPreview: (task) ->         if task   8        OpalRadio.Global.request("modal_preview:show", {              post_id: task.post_id,   $          moment_id: task.moment_id,   
        })   
      else   6        OpalRadio.Global.request("modal_preview:hide")       -    _onClick: (notification, proxy, event) ->   A      @_navigateToPrimaryReference notification.referencedObjects       (    _onLinkClick: (url, proxy, event) ->         event.preventDefault()         return false       0    _navigateToPrimaryReference: (references) ->   :      primaryReference = references[references.length - 1]   0      primaryReferenceUrl = primaryReference.url   C      if window.MomentsBase and primaryReferenceUrl.match /moments/   J        window.MomentsBase.navigate primaryReferenceUrl, { trigger: true }   
      else   F        window.AppBase.navigate primaryReferenceUrl, { trigger: true }   3        window.location.href = window.location.href       1    _onTogglePersonalPanel: (markSeen, isOpen) ->         if !isOpen   5        OpalRadio.Global.request "modal_preview:hide"           _createPersonalPanel: ->   P      # create backwards compatibility until the personal panel is ready/relased   *      if ConnectedComponents.PersonalPanel           React.createElement(             Higgs.Provider,             {},             React.createElement(   .            ConnectedComponents.PersonalPanel,               {   E              onTogglePersonalPanel: @_onTogglePersonalPanel.bind(@),   1              onLinkClick: @_onLinkClick.bind(@),   5              onNotificationClick: @_onClick.bind(@),   1              onMenuClick: @_onMenuClick.bind(@),   E              toggleLeftHandPreview: @_toggleLeftHandPreview.bind(@),               }             )   	        )           _onMenuClick: (data) ->         switch data.url           when "settings"             @editSettings()   3          OpalRadio.Global.execute "takeover:close"           when "profile"             @editProfile()   3          OpalRadio.Global.execute "takeover:close"           when "change_password"             @editPassword()   3          OpalRadio.Global.execute "takeover:close"           when "logout"   !          jQuery.ajax('/login', {                 dataType: 'json',                 method: 'DELETE',   O              success: (options) -> window.location.assign(options.destination)             })           when "privacy_policy"   1          @_getPopupJSON "/popups/privacy_policy"           when "terms_of_use"   7          @_getPopupJSON "/popups/terms_and_conditions"           editSettings: (e) ->   &      promise = @model.fetchSettings()         promise.then =>   +        App.execute "settings_editor:show",             current_index: 0   +          model: @model.get "user_settings"             user: @model           editPassword: (e) ->   &      promise = @model.fetchSettings()         promise.then =>   +        App.execute "settings_editor:show",             current_index: 2   +          model: @model.get "user_settings"             user: @model           editProfile: (e) ->   %      promise = @model.fetchProfile()         promise.then =>   *        App.execute "profile_editor:show",             current_index: 0   *          model: @model.get "user_profile"             user: @model           _getPopupJSON: (url) ->   &      $.getJSON url, (raw_response) ->   +        response = check_login raw_response       '        if response.status is "success"       B          takeoverView = OpalRadio.Global.request "takeover:view",   h            title: if url is "/popups/terms_and_conditions" then "Terms Of Use" else response.data.title   *            content: response.data.content       4          Backbone.listenTo takeoverView, "show", ->   9            takeoverView.$el.find(".btn--primary").hide()       J          OpalRadio.Global.execute "takeover:show", { view: takeoverView }5�_�                      
    ����                                                                                                                                                                                                                                                                                                                                                  V        Y��     �         �      
          �         �    5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                  V        Y�     �         �              �         �    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        Y�     �         �            �         �    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        Y�     �                 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        Y�   	 �      	   �            �      	   �    5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                  V        Y�B   
 �                (          with_animation: @withAnimation5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        Y� {    �                      console.log task5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        Y� �     �                        @withAnimation = false5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        Y� �    �                      @withAnimation = true5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        Y� �     �                  _@AppBase.module "Components.PersonalPanel", (PersonalPanel, App, Backbone, Marionette, $, _) ->   9  class PersonalPanel.Layout extends App.Views.LayoutView       className: "personalPanel"   %    template: "personal_panel/layout"           initialize: ->   8      @model = AppBase.request('users:get_current_user')           onBeforeShow: ->         @_renderComponent()           _renderComponent: ->   .      ReactDOM.unmountComponentAtNode(@$el[0])         @_updateComponent()           _updateComponent: ->   )      component = @_createPersonalPanel()         if component   +        ReactDOM.render(component, @$el[0])       %    _toggleLeftHandPreview: (task) ->         if task   8        OpalRadio.Global.request("modal_preview:show", {              post_id: task.post_id,   $          moment_id: task.moment_id,   
        })   
      else   6        OpalRadio.Global.request("modal_preview:hide")       -    _onClick: (notification, proxy, event) ->   A      @_navigateToPrimaryReference notification.referencedObjects       (    _onLinkClick: (url, proxy, event) ->         event.preventDefault()         return false       0    _navigateToPrimaryReference: (references) ->   :      primaryReference = references[references.length - 1]   0      primaryReferenceUrl = primaryReference.url   C      if window.MomentsBase and primaryReferenceUrl.match /moments/   J        window.MomentsBase.navigate primaryReferenceUrl, { trigger: true }   
      else   F        window.AppBase.navigate primaryReferenceUrl, { trigger: true }   3        window.location.href = window.location.href       1    _onTogglePersonalPanel: (markSeen, isOpen) ->         if !isOpen   5        OpalRadio.Global.request "modal_preview:hide"           _createPersonalPanel: ->   P      # create backwards compatibility until the personal panel is ready/relased   *      if ConnectedComponents.PersonalPanel           React.createElement(             Higgs.Provider,             {},             React.createElement(   .            ConnectedComponents.PersonalPanel,               {   E              onTogglePersonalPanel: @_onTogglePersonalPanel.bind(@),   1              onLinkClick: @_onLinkClick.bind(@),   5              onNotificationClick: @_onClick.bind(@),   1              onMenuClick: @_onMenuClick.bind(@),   E              toggleLeftHandPreview: @_toggleLeftHandPreview.bind(@),               }             )   	        )           _onMenuClick: (data) ->         switch data.url           when "settings"             @editSettings()   3          OpalRadio.Global.execute "takeover:close"           when "profile"             @editProfile()   3          OpalRadio.Global.execute "takeover:close"           when "change_password"             @editPassword()   3          OpalRadio.Global.execute "takeover:close"           when "logout"   !          jQuery.ajax('/login', {                 dataType: 'json',                 method: 'DELETE',   O              success: (options) -> window.location.assign(options.destination)             })           when "privacy_policy"   1          @_getPopupJSON "/popups/privacy_policy"           when "terms_of_use"   7          @_getPopupJSON "/popups/terms_and_conditions"           editSettings: (e) ->   &      promise = @model.fetchSettings()         promise.then =>   +        App.execute "settings_editor:show",             current_index: 0   +          model: @model.get "user_settings"             user: @model           editPassword: (e) ->   &      promise = @model.fetchSettings()         promise.then =>   +        App.execute "settings_editor:show",             current_index: 2   +          model: @model.get "user_settings"             user: @model           editProfile: (e) ->   %      promise = @model.fetchProfile()         promise.then =>   *        App.execute "profile_editor:show",             current_index: 0   *          model: @model.get "user_profile"             user: @model           _getPopupJSON: (url) ->   &      $.getJSON url, (raw_response) ->   +        response = check_login raw_response       '        if response.status is "success"       B          takeoverView = OpalRadio.Global.request "takeover:view",   h            title: if url is "/popups/terms_and_conditions" then "Terms Of Use" else response.data.title   *            content: response.data.content       4          Backbone.listenTo takeoverView, "show", ->   9            takeoverView.$el.find(".btn--primary").hide()       J          OpalRadio.Global.execute "takeover:show", { view: takeoverView }5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        Y�+    �                      console.log task5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        Y��L     �                  _@AppBase.module "Components.PersonalPanel", (PersonalPanel, App, Backbone, Marionette, $, _) ->   9  class PersonalPanel.Layout extends App.Views.LayoutView       className: "personalPanel"   %    template: "personal_panel/layout"           initialize: ->   8      @model = AppBase.request('users:get_current_user')           onBeforeShow: ->         @_renderComponent()           _renderComponent: ->   .      ReactDOM.unmountComponentAtNode(@$el[0])         @_updateComponent()           _updateComponent: ->   )      component = @_createPersonalPanel()         if component   +        ReactDOM.render(component, @$el[0])       %    _toggleLeftHandPreview: (task) ->         if task   8        OpalRadio.Global.request("modal_preview:show", {   #          post_id: task.content.id,   ,          moment_id: task.content.moment.id,   
        })   
      else   6        OpalRadio.Global.request("modal_preview:hide")       -    _onClick: (notification, proxy, event) ->   A      @_navigateToPrimaryReference notification.referencedObjects       (    _onLinkClick: (url, proxy, event) ->         event.preventDefault()         return false       0    _navigateToPrimaryReference: (references) ->   :      primaryReference = references[references.length - 1]   0      primaryReferenceUrl = primaryReference.url   C      if window.MomentsBase and primaryReferenceUrl.match /moments/   J        window.MomentsBase.navigate primaryReferenceUrl, { trigger: true }   
      else   F        window.AppBase.navigate primaryReferenceUrl, { trigger: true }   3        window.location.href = window.location.href       1    _onTogglePersonalPanel: (markSeen, isOpen) ->         if !isOpen   5        OpalRadio.Global.request "modal_preview:hide"           _createPersonalPanel: ->   P      # create backwards compatibility until the personal panel is ready/relased   *      if ConnectedComponents.PersonalPanel           React.createElement(             Higgs.Provider,             {},             React.createElement(   .            ConnectedComponents.PersonalPanel,               {   E              onTogglePersonalPanel: @_onTogglePersonalPanel.bind(@),   1              onLinkClick: @_onLinkClick.bind(@),   5              onNotificationClick: @_onClick.bind(@),   1              onMenuClick: @_onMenuClick.bind(@),   E              toggleLeftHandPreview: @_toggleLeftHandPreview.bind(@),               }             )   	        )           _onMenuClick: (data) ->         switch data.url           when "settings"             @editSettings()   3          OpalRadio.Global.execute "takeover:close"           when "profile"             @editProfile()   3          OpalRadio.Global.execute "takeover:close"           when "change_password"             @editPassword()   3          OpalRadio.Global.execute "takeover:close"           when "logout"   !          jQuery.ajax('/login', {                 dataType: 'json',                 method: 'DELETE',   O              success: (options) -> window.location.assign(options.destination)             })           when "privacy_policy"   1          @_getPopupJSON "/popups/privacy_policy"           when "terms_of_use"   7          @_getPopupJSON "/popups/terms_and_conditions"           editSettings: (e) ->   &      promise = @model.fetchSettings()         promise.then =>   +        App.execute "settings_editor:show",             current_index: 0   +          model: @model.get "user_settings"             user: @model           editPassword: (e) ->   &      promise = @model.fetchSettings()         promise.then =>   +        App.execute "settings_editor:show",             current_index: 2   +          model: @model.get "user_settings"             user: @model           editProfile: (e) ->   %      promise = @model.fetchProfile()         promise.then =>   *        App.execute "profile_editor:show",             current_index: 0   *          model: @model.get "user_profile"             user: @model           _getPopupJSON: (url) ->   &      $.getJSON url, (raw_response) ->   +        response = check_login raw_response       '        if response.status is "success"       B          takeoverView = OpalRadio.Global.request "takeover:view",   h            title: if url is "/popups/terms_and_conditions" then "Terms Of Use" else response.data.title   *            content: response.data.content       4          Backbone.listenTo takeoverView, "show", ->   9            takeoverView.$el.find(".btn--primary").hide()       J          OpalRadio.Global.execute "takeover:show", { view: takeoverView }5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  V        Y��     �                  _@AppBase.module "Components.PersonalPanel", (PersonalPanel, App, Backbone, Marionette, $, _) ->   9  class PersonalPanel.Layout extends App.Views.LayoutView       className: "personalPanel"   %    template: "personal_panel/layout"           initialize: ->   8      @model = AppBase.request('users:get_current_user')           onBeforeShow: ->         @_renderComponent()           _renderComponent: ->   .      ReactDOM.unmountComponentAtNode(@$el[0])         @_updateComponent()           _updateComponent: ->   )      component = @_createPersonalPanel()         if component   +        ReactDOM.render(component, @$el[0])       %    _toggleLeftHandPreview: (task) ->         if task   8        OpalRadio.Global.request("modal_preview:show", {              post_id: task.post_id,   $          moment_id: task.moment_id,   
        })   
      else   6        OpalRadio.Global.request("modal_preview:hide")       -    _onClick: (notification, proxy, event) ->   A      @_navigateToPrimaryReference notification.referencedObjects       (    _onLinkClick: (url, proxy, event) ->         event.preventDefault()         return false       0    _navigateToPrimaryReference: (references) ->   :      primaryReference = references[references.length - 1]   0      primaryReferenceUrl = primaryReference.url   C      if window.MomentsBase and primaryReferenceUrl.match /moments/   J        window.MomentsBase.navigate primaryReferenceUrl, { trigger: true }   
      else   F        window.AppBase.navigate primaryReferenceUrl, { trigger: true }   3        window.location.href = window.location.href       1    _onTogglePersonalPanel: (markSeen, isOpen) ->         if !isOpen   5        OpalRadio.Global.request "modal_preview:hide"           _createPersonalPanel: ->   P      # create backwards compatibility until the personal panel is ready/relased   *      if ConnectedComponents.PersonalPanel           React.createElement(             Higgs.Provider,             {},             React.createElement(   .            ConnectedComponents.PersonalPanel,               {   E              onTogglePersonalPanel: @_onTogglePersonalPanel.bind(@),   1              onLinkClick: @_onLinkClick.bind(@),   5              onNotificationClick: @_onClick.bind(@),   1              onMenuClick: @_onMenuClick.bind(@),   E              toggleLeftHandPreview: @_toggleLeftHandPreview.bind(@),               }             )   	        )           _onMenuClick: (data) ->         switch data.url           when "settings"             @editSettings()   3          OpalRadio.Global.execute "takeover:close"           when "profile"             @editProfile()   3          OpalRadio.Global.execute "takeover:close"           when "change_password"             @editPassword()   3          OpalRadio.Global.execute "takeover:close"           when "logout"   !          jQuery.ajax('/login', {                 dataType: 'json',                 method: 'DELETE',   O              success: (options) -> window.location.assign(options.destination)             })           when "privacy_policy"   1          @_getPopupJSON "/popups/privacy_policy"           when "terms_of_use"   7          @_getPopupJSON "/popups/terms_and_conditions"           editSettings: (e) ->   &      promise = @model.fetchSettings()         promise.then =>   +        App.execute "settings_editor:show",             current_index: 0   +          model: @model.get "user_settings"             user: @model           editPassword: (e) ->   &      promise = @model.fetchSettings()         promise.then =>   +        App.execute "settings_editor:show",             current_index: 2   +          model: @model.get "user_settings"             user: @model           editProfile: (e) ->   %      promise = @model.fetchProfile()         promise.then =>   *        App.execute "profile_editor:show",             current_index: 0   *          model: @model.get "user_profile"             user: @model           _getPopupJSON: (url) ->   &      $.getJSON url, (raw_response) ->   +        response = check_login raw_response       '        if response.status is "success"       B          takeoverView = OpalRadio.Global.request "takeover:view",   h            title: if url is "/popups/terms_and_conditions" then "Terms Of Use" else response.data.title   *            content: response.data.content       4          Backbone.listenTo takeoverView, "show", ->   9            takeoverView.$el.find(".btn--primary").hide()       J          OpalRadio.Global.execute "takeover:show", { view: takeoverView }5�_�                              ����                                                                                                                                                                                                                                                                                                                                                V       Y��    �                +        ReactDOM.render(component, @$el[0])�                      if component�                )      component = @_createPersonalPanel()5�_�                          ����                                                                                                                                                                                                                                                                                                                                                  V        Y��     �         �    �         �      6        OpalRadio.Global.request("modal_preview:hide")5�_�                       6    ����                                                                                                                                                                                                                                                                                                                               7          
       V   =    Y��     �         �      >        OpalRadio.Global.request("modal_preview:hide").then ->5�_�                            ����                                                                                                                                                                                                                                                                                                                               7          
       V   =    Y��    �         �      :          OpalRadio.Global.request("modal_preview:show", {   "            post_id: task.post_id,   &            moment_id: task.moment_id,             })5�_�                       
    ����                                                                                                                                                                                                                                                                                                                               7          
       V   =    Y��     �                ?        #OpalRadio.Global.request("modal_preview:hide").then ->5�_�                        
    ����                                                                                                                                                                                                                                                                                                                               7          
       V   =    Y��     �                >        OpalRadio.Global.request("modal_preview:hide").then ->5��