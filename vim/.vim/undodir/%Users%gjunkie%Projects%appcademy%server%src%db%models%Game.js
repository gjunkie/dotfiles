Vim�UnDo� �xD�J��|��q�+�O��e[Wv]�Zf�}D��	      "let gameSchema = mongoose.Schema({             )       )   )   )    Ykj    _�                             ����                                                                                                                                                                                                                                                                                                                                                             YRW     �                   �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             YRW     �                  5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             YRY     �               "var userSchema = mongoose.Schema({5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             YRZ     �               !var serSchema = mongoose.Schema({5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             YRZ     �                var erSchema = mongoose.Schema({5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             YRZ     �               var rSchema = mongoose.Schema({5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             YRZ     �               var Schema = mongoose.Schema({5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             YRa     �   
              games: [{5�_�      
           	      
    ����                                                                                                                                                                                                                                                                                                                                                             YRd     �                   ref: 'Game'5�_�   	              
   
       ����                                                                                                                                                                                                                                                                                                                                                             YRg     �   	   
            color: String,5�_�   
                 	       ����                                                                                                                                                                                                                                                                                                                                                             YRm     �      	            score: Number,5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             YRr     �                  email: String,5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             YRt     �                  id: String,5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             YR|     �                �             5�_�                           ����                                                                                                                                                                                                                                                                                                                               
                 V   
    YR�     �      
       �             5�_�                           ����                                                                                                                                                                                                                                                                                                                               
                 V   
    YR�     �                  creator: 5�_�                           ����                                                                                                                                                                                                                                                                                                                               
                 V   
    YR�     �                 players: [{5�_�                           ����                                                                                                                                                                                                                                                                                                                               
                 V   
    YR�     �                 creator: [{5�_�                           ����                                                                                                                                                                                                                                                                                                                               
                 V   
    YR�     �      	           }]5�_�                           ����                                                                                                                                                                                                                                                                                                                               
                 V   
    YR�     �                   ref: 'User'   }�      	           }5�_�                           ����                                                                                                                                                                                                                                                                                                                            
   
                 V   
    YR�     �                   type: ObjectId,   ref: 'User' }�                   ref: 'User' }5�_�                           ����                                                                                                                                                                                                                                                                                                                            	   
                 V   
    YR�     �                 creator: {   type: ObjectId, ref: 'User' }�               !    type: ObjectId, ref: 'User' }5�_�                       *    ����                                                                                                                                                                                                                                                                                                                               
                 V   
    YR�     �               *  creator: { type: ObjectId, ref: 'User' }5�_�                           ����                                                                                                                                                                                                                                                                                                                               
                 V   
    YR�     �                B  creationDate: { type: Date, required: true, default: Date.now },5�_�                           ����                                                                                                                                                                                                                                                                                                                               
       
          V   
    YR�     �             �             5�_�                           ����                                                                                                                                                                                                                                                                                                                               
                 V   
    YR�     �                B  creationDate: { type: Date, required: true, default: Date.now },5�_�                           ����                                                                                                                                                                                                                                                                                                                               
       
          V   
    YR�     �             �             5�_�                           ����                                                                                                                                                                                                                                                                                                                               
                 V   
    YR�     �               B  creationDate: { type: Date, required: true, default: Date.now },5�_�                           ����                                                                                                                                                                                                                                                                                                                               
                 V   
    YR�    �      	           players: [{5�_�                        (    ����                                                                                                                                                                                                                                                                                                                                                             Yjy     �                 4module.exports = mongoose.model('User', userSchema);5�_�      !                  (    ����                                                                                                                                                                                                                                                                                                                                                             Yjy     �                 3module.exports = mongoose.model('User', serSchema);5�_�       "           !      (    ����                                                                                                                                                                                                                                                                                                                                                             Yjz     �                 2module.exports = mongoose.model('User', erSchema);5�_�   !   #           "      (    ����                                                                                                                                                                                                                                                                                                                                                             Yjz     �                 1module.exports = mongoose.model('User', rSchema);5�_�   "   $           #      (    ����                                                                                                                                                                                                                                                                                                                                                             Yjz     �                 0module.exports = mongoose.model('User', Schema);5�_�   #   %           $           ����                                                                                                                                                                                                                                                                                                                                                             Yj|     �                #var mongoose = require('mongoose');5�_�   $   &           %           ����                                                                                                                                                                                                                                                                                                                                                             Yj     �               .var ObjectId = mongoose.Schema.Types.ObjectId;5�_�   %   '           &           ����                                                                                                                                                                                                                                                                                                                                                             Yj�    �               "var gameSchema = mongoose.Schema({5�_�   &   (           '           ����                                                                                                                                                                                                                                                                                                                                                             Yj�    �               $const gameSchema = mongoose.Schema({5�_�   '   )           (      !    ����                                                                                                                                                                                                                                                                                                                                                             Ykf     �                 4module.exports = mongoose.model('User', gameSchema);5�_�   (               )           ����                                                                                                                                                                                                                                                                                                                                                             Yki    �               "let gameSchema = mongoose.Schema({5�_�                            ����                                                                                                                                                                                                                                                                                                                               
                 V   
    YR�     �             �                 players: [{       type: ObjectId,       ref: 'User'     }]5��