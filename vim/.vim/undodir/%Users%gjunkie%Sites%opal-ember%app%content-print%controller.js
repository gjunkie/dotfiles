Vim�UnDo� 9�v��S�	w'a]�i���[��n���R�̫�K   �   7  storyPrimaryIcon: { name: 'story', color: '#E6EBF0'},   c         0       0   0   0    V��   	 _�                        	    ����                                                                                                                                                                                                                                                                                                                                                             V��    �   ~   �   �      	        }5�_�                    �   	    ����                                                                                                                                                                                                                                                                                                                                                             V��f    �   �   �   �    �   �   �   �    5�_�                    }   
    ����                                                                                                                                                                                                                                                                                                                                                             V�Ɍ     �   }      �    5�_�                    �   
    ����                                                                                                                                                                                                                                                                                                                                                             V�ɕ     �   �   �          *          console.log("Error on export!");5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             V�ɖ     �   �   �   �    �   �   �   �    5�_�                    ~        ����                                                                                                                                                                                                                                                                                                                                                             V�ɘ     �   ~   �   �    �   ~      �    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       V�ɛ    �   ~   �   �      *          console.log("Error on export!");5�_�      	              ~        ����                                                                                                                                                                                                                                                                                                                                                v       V���     �   }   ~           5�_�      
           	   ~   
    ����                                                                                                                                                                                                                                                                                                                            ~          ~          v       V���    �   }   ~          "          console.log(" export!");5�_�   	              
   �   
    ����                                                                                                                                                                                                                                                                                                                            ~          ~          v       V���    �   �   �          5          _self.triggerClose({ is_exporting: true });5�_�   
                 �       ����                                                                                                                                                                                                                                                                                                                            ~          ~          v       V���    �   �   �   �      	  �   �   �   �    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            ~          ~          v       V���    �   �   �   �      	  console.log(moment)5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            ~          ~          v       V��C    �   �   �          #	  console.log(moment.get('posts'))5�_�                    k        ����                                                                                                                                                                                                                                                                                                                            ~          ~          v       V���     �               �   import Ember from 'ember';   ,import closeable from '../mixins/closeable';   import DS from 'ember-data';       3export default Ember.Controller.extend(closeable, {   J  pageCount: Ember.computed.alias('contentPrint.includedPreviews.length'),   J  contentCount: Ember.computed.alias('contentPrint.includedPosts.length'),       6  contentPrint: Ember.inject.service('content-print'),     /**   C    * A flag which controls the display of options in the previews.       *       * @property showOptions       * @type Boolean       * @default true       */     showOptions: true,         /**   ?    * A flag which controls whether or not the sidebar is open.       *       * @property sidebarOpen       * @type Boolean       * @default true       */     sidebarOpen: true,         /**   7    * A flag which controls the confirm on close alert.       *       * @property tryingToClose       * @type Boolean       * @default false       */     tryingToClose: false,         /**   E    * A flag which determines if the PDF is currently being exported.       *       * @property isExporting       * @type Boolean       * @default false       */     isExporting: false,         showOptions: true,         /**   I    * A filtered collection of previews that have errors with generation.       *       * @property failedPreviews       * @type Ember.Array       * @default []       */   j  failedPreviews: Ember.computed.filter('contentPrint.previews.@each.isPreviewFailed', function(preview) {   *    return preview.get('isPreviewFailed');     }),         /**   J    * A flag which controls whether or not the error notification has been   "    * manually closed by the user.       *   '    * @property errorNotificationClosed       * @type Boolean       * @default false       */   !  errorNotificationClosed: false,         /**   M    * A flag which controls whether or not the error notification is visible.   >    * If the user has manually closed it, never show it again.       *   '    * @property showFailedPreviewsError       * @type Boolean       * @default false       */   j  showFailedPreviewsError: Ember.computed('failedPreviews.length', 'errorNotificationClosed', function() {   -    if(this.get('errorNotificationClosed')) {         return false;       }       1    return this.get('failedPreviews').length > 0;     }),       !  isDisplayOptionsVisible: false,         /**   L    * When the user decides to save their new display options, save those to   6    * the model and make sure that the page refreshes.       *        * @method saveDisplayOptions       */     saveDisplayOptions() {   8    this.get('contentPrint.presentationPreview').save();     },         /**   M    * When the user decides to cancel their new display options, rollback the   0    * display options model and close the alert.       *   #    * @method discardDisplayOptions       */     discardDisplayOptions() {   F    this.get('contentPrint.presentationPreview').rollbackAttributes();     },         actions: {       updateOptions(state){   3      this.get('model').set('show_options', state);         this.get('model').save();       },           exportPdf() {   )      this.toggleProperty('isExporting');       ?      var model = this.get('contentPrint.presentationPreview');         let _self = this;             $.ajax({   &        url: "/presentations/exports",           type: "POST",           data: {   2          presentation_preview_id: model.get('id')   
        },           success: function() {   5          _self.triggerClose({ is_exporting: true });   
        },           error: function() {   *          console.log("Error on export!");   	        }   	      });       },           close() {   &      this.set('tryingToClose', true);       },           closeCancel() {   '      this.set('tryingToClose', false);       },           closeSuccess() {         this.triggerClose();       },           errorNotificationClosed() {   0      this.set('errorNotificationClosed', true);       },           toggleSidebar() {   )      this.toggleProperty('sidebarOpen');       },           openDisplayOptions() {   0      this.set('isDisplayOptionsVisible', true);       },           discardDisplayOptions() {   1      this.set('isDisplayOptionsVisible', false);   #      this.discardDisplayOptions();       },           saveDisplayOptions() {   1      this.set('isDisplayOptionsVisible', false);          this.saveDisplayOptions();       },           toggledMoment(data) {         var moment = data.data;   <      moment.get('posts').setEach('isIncluded', data.value);       }     }   });5�_�                    S        ����                                                                                                                                                                                                                                                                                                                            S          D           V       V���     �   S   d   �    �   S   T   �    5�_�                    V        ����                                                                                                                                                                                                                                                                                                                            V           W           V        V���     �   U   V          M    * A flag which controls whether or not the error notification is visible.   >    * If the user has manually closed it, never show it again.5�_�                    V       ����                                                                                                                                                                                                                                                                                                                            V           V           V        V���     �   U   W   �         * �   U   W   �    5�_�                    V       ����                                                                                                                                                                                                                                                                                                                            W           W           V        V���     �   U   W   �         *5�_�                    V       ����                                                                                                                                                                                                                                                                                                                            W           W           V        V���     �   U   W   �      	*5�_�                    X       ����                                                                                                                                                                                                                                                                                                                            W           W           V        V���     �   W   Y   �      '    * @property showFailedPreviewsError5�_�                   Y       ����                                                                                                                                                                                                                                                                                                                            W           W           V        V���     �   X   Z   �          * @type Boolean5�_�                    Z       ����                                                                                                                                                                                                                                                                                                                            W           W           V        V���     �   Y   Z              * @default false5�_�                    [       ����                                                                                                                                                                                                                                                                                                                            W           W           V        V���     �   Z   \   �      j  showFailedPreviewsError: Ember.computed('failedPreviews.length', 'errorNotificationClosed', function() {5�_�                    \        ����                                                                                                                                                                                                                                                                                                                            \          `          V       V���     �   [   \          -    if(this.get('errorNotificationClosed')) {         return false;       }       1    return this.get('failedPreviews').length > 0;5�_�                    \       ����                                                                                                                                                                                                                                                                                                                            \          \          V       V���     �   [   ]   �        }),5�_�                    [       ����                                                                                                                                                                                                                                                                                                                            [   b       [          v       V���     �   Z   \   �      c  storyPrimaryIcon: Ember.computed('failedPreviews.length', 'errorNotificationClosed', function() {5�_�                    \       ����                                                                                                                                                                                                                                                                                                                            [   b       [          v       V���     �   Z   \   �        storyPrimaryIcon: {}},�   Z   \   �        storyPrimaryIcon:    },�   [   ]   �        },5�_�                    [       ����                                                                                                                                                                                                                                                                                                                            [   b       [          v       V���     �   Z   \   �        storyPrimaryIcon: {}},5�_�                     [       ����                                                                                                                                                                                                                                                                                                                            [   b       [          v       V���     �   Z   \   �        storyPrimaryIcon: {},5�_�      !              [   #    ����                                                                                                                                                                                                                                                                                                                            [   b       [          v       V���     �   Z   \   �      %  storyPrimaryIcon: { name: 'story'},5�_�       "           !   [   -    ����                                                                                                                                                                                                                                                                                                                            [   b       [          v       V��     �   Z   \   �      0  storyPrimaryIcon: { name: 'story', color: ''},5�_�   !   #           "   [        ����                                                                                                                                                                                                                                                                                                                            [   3       T           V   3    V��	     �   [   d   �    �   [   \   �    5�_�   "   $           #   ^       ����                                                                                                                                                                                                                                                                                                                            [   3       T           V   3    V��     �   ]   _   �      4	* Icon hash for the story headers in the accordion.5�_�   #   %           $   `       ����                                                                                                                                                                                                                                                                                                                            [   3       T           V   3    V��     �   _   a   �           * @property storyPrimaryIcon5�_�   $   &           %   `       ����                                                                                                                                                                                                                                                                                                                            [   3       T           V   3    V��     �   _   a   �          * @property toryPrimaryIcon5�_�   %   '           &   `       ����                                                                                                                                                                                                                                                                                                                            [   3       T           V   3    V��     �   _   a   �          * @property oryPrimaryIcon5�_�   &   (           '   `       ����                                                                                                                                                                                                                                                                                                                            [   3       T           V   3    V��     �   _   a   �          * @property ryPrimaryIcon5�_�   '   )           (   `       ����                                                                                                                                                                                                                                                                                                                            [   3       T           V   3    V��     �   _   a   �          * @property yPrimaryIcon5�_�   (   *           )   `       ����                                                                                                                                                                                                                                                                                                                            [   3       T           V   3    V��     �   _   a   �          * @property PrimaryIcon5�_�   )   +           *   c       ����                                                                                                                                                                                                                                                                                                                            [   3       T           V   3    V��     �   b   d   �      7  storyPrimaryIcon: { name: 'story', color: '#E6EBF0'},5�_�   *   ,           +   c       ����                                                                                                                                                                                                                                                                                                                            [   3       T           V   3    V��     �   b   d   �      8  storyPrimaryIcon: { name: 'moment', color: '#E6EBF0'},5�_�   +   -           ,   c       ����                                                                                                                                                                                                                                                                                                                            [   3       T           V   3    V��     �   b   d   �      7  toryPrimaryIcon: { name: 'moment', color: '#E6EBF0'},5�_�   ,   .           -   c       ����                                                                                                                                                                                                                                                                                                                            [   3       T           V   3    V��     �   b   d   �      6  oryPrimaryIcon: { name: 'moment', color: '#E6EBF0'},5�_�   -   /           .   c       ����                                                                                                                                                                                                                                                                                                                            [   3       T           V   3    V��     �   b   d   �      5  ryPrimaryIcon: { name: 'moment', color: '#E6EBF0'},5�_�   .   0           /   c       ����                                                                                                                                                                                                                                                                                                                            [   3       T           V   3    V��     �   b   d   �      4  yPrimaryIcon: { name: 'moment', color: '#E6EBF0'},5�_�   /               0   c       ����                                                                                                                                                                                                                                                                                                                            [   3       T           V   3    V��   	 �   b   d   �      3  PrimaryIcon: { name: 'moment', color: '#E6EBF0'},5�_�                     [   #    ����                                                                                                                                                                                                                                                                                                                            [   b       [          v       V���     �   Z   \   �      S  storyPrimaryIcon: { name: 'story', color: 'app/content-print/template.hbs.orig'},5�_�                    Y       ����                                                                                                                                                                                                                                                                                                                            W           W           V        V���     �   X   Z   �          * @type 5��