Vim�UnDo� zN<M�۴��a-�D#|��D:�9cT*1��   )       }                             Y�n�    _�                            ����                                                                                                                                                                                                                                                                                                                                                             Y�>�     �      
   &    �      	   &    5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             Y�>�    �      
   '      5    fullName: `${user.first_name} ${user.last_name}`,5�_�                   	       ����                                                                                                                                                                                                                                                                                                                                                             Y�?    �      
          6    full_name: `${user.first_name} ${user.last_name}`,5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Y�?c    �         '      const userDecorator = user => (5�_�                    	        ����                                                                                                                                                                                                                                                                                                                            "          "          V       Y�?�    �      
          8    //full_name: `${user.first_name} ${user.last_name}`,5�_�                    	       ����                                                                                                                                                                                                                                                                                                                            "          "          V       Y�@     �   	      (          �   	      '    5�_�      	              
       ����                                                                                                                                                                                                                                                                                                                            $          $          V       Y�@     �   
      *            �   
      )    5�_�      
           	   	       ����                                                                                                                                                                                                                                                                                                                            %          %          V       Y�@     �      	          6    full_name: `${user.first_name} ${user.last_name}`,5�_�   	              
   
       ����                                                                                                                                                                                                                                                                                                                            $          $          V       Y�@     �   
      )    �   
      )    5�_�   
                        ����                                                                                                                                                                                                                                                                                                                            %          %          V       Y�@     �   
      *      6    full_name: `${user.first_name} ${user.last_name}`,5�_�                    
       ����                                                                                                                                                                                                                                                                                                                            %          %          V       Y�@     �   	   
                fu5�_�                    
       ����                                                                                                                                                                                                                                                                                                                            $          $          V       Y�@    �   	      )      :        full_name: `${user.first_name} ${user.last_name}`,5�_�                          ����                                                                                                                                                                                                                                                                                                                            $          $          V       Y�n�     �               )   import moment from 'moment';       :export const DEFAULT_DATE_FORMAT = 'YYYY-MM-DDTHH:mm:ssZ';       &export const userDecorator = user => (     {       ...user,   5    fullName: `${user.first_name} ${user.last_name}`,       name: {   8      full_name: `${user.first_name} ${user.last_name}`,       }     }   );        const itemDecorator = item => ({   ;  created_at: moment(item.created_at, DEFAULT_DATE_FORMAT),   ;  updated_at: moment(item.updated_at, DEFAULT_DATE_FORMAT),   });       &export const taskDecorator = task => (     {       ...task,   <    timestamp: moment(task.created_at, DEFAULT_DATE_FORMAT),   6    status: task.is_approved ? 'complete' : 'pending',       ...itemDecorator(task),     }   );       )const approvalsDecorator = approval => ({     ...approval,     ...itemDecorator(approval),   });           const decorators = {     users: userDecorator,     tasks: taskDecorator,      approvals: approvalsDecorator,   };       export default decorators;5�_�                            ����                                                                                                                                                                                                                                                                                                                            $          $          V       Y�n�    �   
      )          }5�_�                           ����                                                                                                                                                                                                                                                                                                                            $          $          V       Y�n�     �   
      )          },5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             Y�?      �      
          8    //full_name: `${user.first_name} ${user.last_name}`,5��