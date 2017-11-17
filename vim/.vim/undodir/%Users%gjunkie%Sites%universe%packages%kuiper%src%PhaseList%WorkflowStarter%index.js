Vim�UnDo� +ڗ�Uj7���0��X�;��у=b�n��v   T                                   ZgZ    _�                             ����                                                                                                                                                                                                                                                                                                                                                             Z
�     �               [   import React from 'react';   0import { bool, func, number } from 'prop-types';   )import { track } from '@opallabs/quanta';   "import Button from '../../Button';   &import PhaseHeading from '../Heading';   %import { Popover } from '../../hocs';   )import { classnames } from '../../utils';   "import Loader from '../../Loader';       import './styles.scss';       pconst popoverMessage = 'Workflow can be started once an account is selected and at least one phase is created.';       const popoverOptions = {     showOn: 'trigger.mouseenter',     hideOn: 'trigger.mouseleave',     bodyAttached: true,   !  unnecessaryRepositioning: true,     constraints: [   ;    { popover: 'top center', attachment: 'bottom center' },   :    { popover: 'top right', attachment: 'bottom center' },   9    { popover: 'top left', attachment: 'bottom center' },     ],   };       ,const buttonLabel = hasPreStartFunction => (   N  (hasPreStartFunction) ? 'Save Content And Start Workflow' : 'Start Workflow'   );       Cconst startWorkflow = (preStartFunction, otherProps, callback) => {     track('Workflow: Start', {   .    contentId: otherProps.workflow.content.id,     });       3  otherProps.setLoader({ startingWorkflow: true });         if (preStartFunction) {   (    /* eslint-disable catch-or-return */   5    return preStartFunction().then(() => callback());   '    /* eslint-enable catch-or-return */     }     return callback();   };       Aconst shouldDisableStart = (contentAccountId, workflowValid) => {     if (workflowValid) {       return !contentAccountId;     }     return true;   };       const WorkflowStarter = ({     ...otherProps,     contentAccountId,     entitySaveMethod,     onStartWorkflow,     workflowValid,   }) => (   2  <div className={classnames('workflow-starter')}>       <Popover         options={popoverOptions}         disabled={workflowValid}         themeClass="white">   6      <div className={classnames('button-container')}>           <Button   /          label={buttonLabel(entitySaveMethod)}   [          onClick={() => { startWorkflow(entitySaveMethod, otherProps, onStartWorkflow); }}   H          disabled={shouldDisableStart(contentAccountId, workflowValid)}   .          className={classnames('primary')} />         </div>   :      <div className={classnames('phase-popover', 'n10')}>   J        <div className={classnames('popover-text')}>{popoverMessage}</div>         </div>       </Popover>       <PhaseHeading         copy="Future Phases"         editing={true}         shouldRender={true}          workflowStarted={false} />   <    <Loader loaded={!otherProps.loaders.startingWorkflow} />     </div>   );       WorkflowStarter.propTypes = {     contentAccountId: number,     entitySaveMethod: func,   #  onStartWorkflow: func.isRequired,     workflowValid: bool,   };       export default WorkflowStarter;5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Zf     �               E   import React from 'react';   (import { bool, func } from 'prop-types';   )import { track } from '@opallabs/quanta';   "import Button from '../../Button';   &import PhaseHeading from '../Heading';   %import { Popover } from '../../hocs';   )import { classnames } from '../../utils';   "import Loader from '../../Loader';       import './styles.scss';       pconst popoverMessage = 'Workflow can be started once an account is selected and at least one phase is created.';       const popoverOptions = {     showOn: 'trigger.mouseenter',     hideOn: 'trigger.mouseleave',     bodyAttached: true,   !  unnecessaryRepositioning: true,     constraints: [   ;    { popover: 'top center', attachment: 'bottom center' },   :    { popover: 'top right', attachment: 'bottom center' },   9    { popover: 'top left', attachment: 'bottom center' },     ],   };       +const startWorkflow = (otherProps, cb) => {     track('Workflow: Start', {   .    contentId: otherProps.workflow.content.id,     });   3  otherProps.setLoader({ startingWorkflow: true });     cb();   };       const WorkflowStarter = ({     ...otherProps,     onStartWorkflow,     workflowValid,   }) => (   2  <div className={classnames('workflow-starter')}>       <Popover         options={popoverOptions}         disabled={workflowValid}         themeClass="white">   6      <div className={classnames('button-container')}>           <Button              label="Start Workflow"   I          onClick={() => { startWorkflow(otherProps, onStartWorkflow); }}   #          disabled={!workflowValid}   .          className={classnames('primary')} />         </div>   :      <div className={classnames('phase-popover', 'n10')}>   J        <div className={classnames('popover-text')}>{popoverMessage}</div>         </div>       </Popover>       <PhaseHeading         copy="Future Phases"         editing={true}         shouldRender={true}          workflowStarted={false} />   <    <Loader loaded={!otherProps.loaders.startingWorkflow} />     </div>   );       WorkflowStarter.propTypes = {   #  onStartWorkflow: func.isRequired,     workflowValid: bool,   };       export default WorkflowStarter;5�_�                    J        ����                                                                                                                                                                                                                                                                                                                            J          N          V       Zf"    �   I   J              <PhaseHeading         copy="Future Phases"         editing={true}         shouldRender={true}          workflowStarted={false} />5�_�                             ����                                                                                                                                                                                                                                                                                                                            J          J          V       ZgY    �                &import PhaseHeading from '../Heading';5��