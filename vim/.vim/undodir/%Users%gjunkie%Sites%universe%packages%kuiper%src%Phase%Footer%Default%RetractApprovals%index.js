Vim�UnDo� �P�JC�YD��������9V�ؙ�c��A�"   "                                       Ynl4    _�                             ����                                                                                                                                                                                                                                                                                                                                                             Ynjv     �                   �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Ynjy     �         /    �         /    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Ynjz     �                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                      $          V       Ynj�     �         "    �         "    �                      <Button   8        className={classnames('add-item', { disabled })}           disabled={disabled}           icon="plus-solid"           label={copy}           onClick={onAddItem}           type="link" />   7      <div className={classnames('approval-controls')}>   O        { retractApprovalsButton({ disabled, onRetractApprovals, phaseType }) }           <Button   =          className={classnames('toggle-edit', { disabled })}             disabled={disabled}             icon="cog-sm"             onClick={onEdit}             type="invisible" />         </div>5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       Ynj�     �         )          <Button   1      className={classnames('retract-approvals')}         disabled={disabled}         label="Retract Approvals"   "      onClick={onRetractApprovals}         size="small"         type="secondary" />5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Ynj�     �                  copy,5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                V       Ynj�     �   	   
          	  onEdit,5�_�      	              	       ����                                                                                                                                                                                                                                                                                                                                                V       Ynj�     �      	            onAddItem,5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                V       Ynj�     �                
  editing,5�_�   	              
   
       ����                                                                                                                                                                                                                                                                                                                                                V       Ynj�     �   
      %    �   
      %    5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                V       Ynj�     �   
      &      "  if (phaseType !== 'approvals') {5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Ynj�     �   
      &      !  if (phaseType == 'approvals') {5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Ynj�     �   
      &      "  if (phaseType === 'approvals') {5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Ynj�     �                  if (editing) {5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Ynj�     �                  copy: string,5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Ynj�     �                  onAddItem: func,5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Ynj�    �                  onEdit: func,5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Ynk      �         "      const FooterDefault = ({5�_�                    "       ����                                                                                                                                                                                                                                                                                                                                                V       Ynk	     �   !              export default FooterDefault;5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       Ynk    �         "      FooterDefault.propTypes = {5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                V       Ynkd     �      
   "        phaseType,5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       Ynki     �   
      "        if (phaseType === 'tasks') {5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       Ynkj     �   
      "      	  if () {5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       Ynkp     �                    return null;5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       Ynkr     �         !    �         !    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       Ynks     �         "          return null;5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Ynku     �         "      
  return (   >    <div className={classnames('phase-footer-content', 'n9')}>         <Button   3        className={classnames('retract-approvals')}           disabled={disabled}   !        label="Retract Approvals"   $        onClick={onRetractApprovals}           size="small"           type="secondary" />   
    </div>     );5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Ynkv     �                  }5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       Ynkv     �   
      !        if (shouldRender) {    �         !       5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       Ynkx    �              �              5�_�                             ����                                                                                                                                                                                                                                                                                                                                                V       Ynl3    �         !    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       Ynj�     �              5��