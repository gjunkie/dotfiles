Vim�UnDo� �7~i�Iz��;���,D��/�P�M��C���   C   B    this.get('frequencyController').set('secondaryInsight', null);                             V�}�    _�                            ����                                                                                                                                                                                                                                                                                                                                                  V        V�z     �         =    �         =    5�_�                       (    ����                                                                                                                                                                                                                                                                                                                                                  V        V�|     �         >      A    this.controllerFor('insights').set('overviewInsight', model);5�_�                       ;    ����                                                                                                                                                                                                                                                                                                                                                  V        V��    �         >      B    this.controllerFor('insights').set('secondaryInsight', model);5�_�                       *    ����                                                                                                                                                                                                                                                                                                                                                  V        V�>     �         ?          �         >    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        V�D     �         ?           console.log(secondaryEntity)5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        V�E     �         ?    �         ?    5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                  V        V�F    �         @      !    console.log(secondaryEntity);5�_�      
          	          ����                                                                                                                                                                                                                                                                                                                                                 V   ;    V�X     �                    console.log('from route');   !    console.log(secondaryEntity);5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                 V   ;    V�Y    �         >    5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                 V   ;    V�;�     �               ?   import Ember from 'ember';       #export default Ember.Route.extend({   2  insightService: Ember.inject.service('insight'),   1  breadCrumb: Ember.inject.service('breadCrumb'),       0  setupController: function(controller, model) {   #    controller.set('model', model);       [    let secondaryEntity = this.store.peekRecord('label', model.get('secondary_subset_id'));       A    this.controllerFor('insights').set('overviewInsight', model);   L    this.controllerFor('insights').set('secondaryInsight', secondaryEntity);       6    this.get('breadCrumb').dropCrumb(secondaryEntity);       7    controller.set('secondaryEntity', secondaryEntity);        controller.resetAccordion();     },       4  resetController: function(controller, isExiting) {        controller.resetAccordion();       if (isExiting) {   (      this.get('breadCrumb').eatCrumb();       }     },         model: function(params) {   "    let queryParams = Ember.merge(           params,           Ember.merge(   %          this.paramsFor('insights'),   =          this.paramsFor('insights.label_frequency.overview')   	        )       );       _    return this.get('insightService').fetchInsight(this.store, this.formatParams(queryParams));     },       "  formatParams: function(params) {   ;    let insightController = this.controllerFor('insights');   9    let start_date = insightController.get('start_date');   5    let end_date = insightController.get('end_date');           return {         start_date: start_date,         end_date: end_date,         brand_slug: params.slug,          subset_type: "label_sets",   %      subset_id: params.label_set_id,   &      secondary_subset_type: "labels",   +      secondary_subset_id: params.label_id,         rollup: true,         flag_secondary: true       };     },         actions: {   &    refreshModelOnChange: function() {         this.refresh();       }     }   });5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V   ;    V�>�     �         B      L    this.controllerFor('insights').set('secondaryInsight', secondaryEntity);5�_�                       (    ����                                                                                                                                                                                                                                                                                                                                                 V   ;    V�>�    �         B      T    this.controllerFor('insights.label_f').set('secondaryInsight', secondaryEntity);5�_�                          ����                                                                                                                                                                                                                                                                                                                                                 V   ;    V�}�     �         B    �         B    5�_�                            ����                                                                                                                                                                                                                                                                                                                                         "       v   "    V�}�    �         C      B    this.get('frequencyController').set('secondaryInsight', null);�         C    5�_�                     H    ����                                                                                                                                                                                                                                                                                                                                                 V   ;    V�FM    �         B      \    this.controllerFor('insights.label_frequency').set('secondarySubject', secondaryEntity);5�_�                        #    ����                                                                                                                                                                                                                                                                                                                                                 V   ;    V�Fq    �         B      8    controller.set('secondarySubject', secondaryEntity);5�_�                       H    ����                                                                                                                                                                                                                                                                                                                                                 V   ;    V�@;    �         B      \    this.controllerFor('insights.label_frequency').set('secondarySubject', secondaryEntity);5�_�              	         ;    ����                                                                                                                                                                                                                                                                                                                                                  V        V��    �         @      D    this.controllerFor('insights').set('secondaryInsight', 'hello');5��