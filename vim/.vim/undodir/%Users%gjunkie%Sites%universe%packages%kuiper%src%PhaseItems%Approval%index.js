Vim�UnDo� F�\�����ڮ}i��A�CwZ}�:��(�hh�                                    ZK�    _�                     /        ����                                                                                                                                                                                                                                                                                                                                                             Y�MA     �               )import React, { Component } from 'react';   7import { array, object, func, bool } from 'prop-types';   "import Avatar from '../../Avatar';   <import UnassignedWithPopover from './UnassignedWithPopover';   (import StatusDot from '../../StatusDot';   "import Button from '../../Button';   Eimport { classnames, renderIcon, formatMentions } from '../../utils';   ,import Conditional from '../../Conditional';   %import { Popover } from '../../hocs';       import './styles.scss';       :export default class PhaseItemApproval extends Component {     static propTypes = {       currentUser: object,       editing: bool,       isActive: bool,       item: object,       onDestroyPhaseItem: func,       onSelectAssignee: func,       people: array,       phase: object,     };         constructor(props) {       super(props);       2    this.state = { isTransferPopoverOpen: false };     }         getStatusDotStatus() {   %    switch (this.props.item.status) {         case 'approved':           return 'success';         case 'denied':           return 'error';         case 'pending':           return 'warning';         case 'initial':           return 'inactive';         default:           return 'inactive';       }     }         shouldDisableButton() {   6    return !this.props.item.id || this.props.isActive;     }         renderStatus() {   -    const status = this.getStatusDotStatus();   '    const cssOverrides = { margin: 0 };           if (this.props.editing) {         return (           <Button   /          disabled={this.shouldDisableButton()}             icon="close-sm"             size="small"             type="invisible"             className="n6"             color="grey"             style={cssOverrides}   4          onClick={this.props.onDestroyPhaseItem} />         );       }           return (   6      <div className={classnames('status-container')}>   %        <StatusDot status={status} />         </div>       );     }         renderNoAccessDialogue() {   -    const approver = this.props.item.to_user;       return (   :      <div className={classnames('phase-popover', 'n10')}>   y        <div className={classnames('popover-text')}>{ `${approver.fullName} doesn't have access to this content.` }</div>         </div>       );     }         renderNoAccess() {       return (         <Popover           options={{   '          showOn: 'trigger.mouseenter',   '          hideOn: 'trigger.mouseleave',             bodyAttached: true,   )          unnecessaryRepositioning: true,             constraints: [   C            { popover: 'top center', attachment: 'bottom center' },   A            { popover: 'top left', attachment: 'bottom center' },   B            { popover: 'top right', attachment: 'bottom center' },             ] }}           themeClass={'white'} >   B        { renderIcon('alert', { className: 'kuiper-no-access' }) }   )        { this.renderNoAccessDialogue() }         </Popover>       );     }         shouldRenderMessage() {   ^    return this.props.item.comment && ['approved', 'denied'].includes(this.props.item.status);     }         isProxyApproval() {        return this.proxyApprover &&   :        (!(Object.keys(this.proxyApprover).length === 0 &&   4        this.proxyApprover.constructor === Object));     }         get proxyApprover() {   &    return this.props.item.proxy_user;     }         get approver() {   #    return this.props.item.to_user;     }          get transferPopoverOptions() {       return ({         showOn: 'trigger.click',   7      hideOn: ['document.click', 'popover.mouseleave'],         hideDelay: 200,         bodyAttached: true,         constraints: [   ?        { popover: 'top center', attachment: 'bottom center' },   >        { popover: 'top right', attachment: 'bottom center' },   =        { popover: 'top left', attachment: 'bottom center' },         ],         onShowEvent: () => {   7        this.setState({ isTransferPopoverOpen: true });         },         onAfterHide: () => {   8        this.setState({ isTransferPopoverOpen: false });         },       }       );     }         renderActionIcon() {   5    const user = this.proxyApprover || this.approver;       if (!user) return null;   \    const isCurrentUser = parseInt(user.id, 10) === parseInt(this.props.currentUser.id, 10);   #    if (isCurrentUser) return null;       return (         <Popover   -        options={this.transferPopoverOptions}           themeClass={'white'} >   <        { renderIcon('actions', { height: 14, width: 10 }) }   '        { this.renderActionDialogue() }         </Popover>       );     }         renderActionDialogue() {   4    const { item, phase, currentUser } = this.props;       return (   :      <div className={classnames('phase-popover', 'n10')}>           <Button   Y          label={`Transfer approval responsibility from ${this.approver.fullName} to me`}             type={'link'}             color={'blue'}             onClick={() => {   )            this.props.onSelectAssignee({                 item,                 phase,                 update: {                   proxy_user: {                      type: 'users',   %                  id: currentUser.id,                   },                 },               });             }} />         </div>       );     }         renderApprover() {   !    const { phase } = this.props;       if (!this.approver) {         return (   C        <div className={classnames('user-token', 'is-unassigned')}>              <UnassignedWithPopover   &            people={this.props.people}   -            onSelectAssignee={(assignee) => {   +              this.props.onSelectAssignee({                   assignee,   >                item: { type: 'approval', to_user: assignee },                   phase,                 });               }} />           </div>         );       }   D    return this.renderUserToken(this.approver, !this.proxyApprover);     }       *  renderUserToken(approver, withMessage) {       if (!approver) return null;   A    // @TODO reenable accesss stuff once we have backend support.   B    // const noAccess = (approver.hasAccess) ? null : 'no-access';   E    const avatarUrl = (approver.avatar && approver.avatar.url) || '';       const noAccess = null;       const name = {   &      first_name: approver.first_name,   $      last_name: approver.last_name,   $      full_name: approver.full_name,       };       return (   :      <div className={classnames('user-token', noAccess)}>           <Avatar             name={name}             imageUrl={avatarUrl}             size="mini"             tooltip={null} />   4        <Conditional condition={approver.hasAccess}>   #          { this.renderNoAccess() }           </Conditional>   B        <div className={classnames('name-and-message-container')}>   3          <div className={classnames('full-name')}>   7            { approver.fullName || approver.full_name }             </div>   M          <Conditional condition={this.shouldRenderMessage() && withMessage}>   <            <div className={classnames('approval-message')}>   E              { formatMentions.linkifyText(this.props.item.comment) }               </div>             </Conditional>           </div>         </div>       );     }         renderProxyApprover() {   )    if (!this.proxyApprover) return null;       return (   3      <div className={classnames('transfer-user')}>   5        <div className={classnames('transfer-icon')}>   P          { renderIcon('chevron-e', { key: 'chevron-1', width: 5, height: 8 }) }   P          { renderIcon('chevron-e', { key: 'chevron-2', width: 5, height: 8 }) }           </div>   H        { this.renderUserToken(this.proxyApprover, this.proxyApprover) }         </div>       );     }         render() {        const { item } = this.props;       return (   	      <li           className={classnames(           'phase-item',           'phase-item-approval',   $        `phase-item-${item.status}`,   7        { 'is-proxyApprover': this.isProxyApproval() },   D        { isTransferPopoverOpen: this.state.isTransferPopoverOpen },           )}>   6        <div className={classnames('approval-users')}>   !          { this.renderStatus() }   #          { this.renderApprover() }   U          { item.proxy_user && this.isProxyApproval() && this.renderProxyApprover() }           </div>   K        <Conditional condition={item.to_user && item.status === 'pending'}>   %          { this.renderActionIcon() }           </Conditional>         </li>       );     }   }5�_�                    �   ;    ����                                                                                                                                                                                                                                                                                                                                                             ZJ�    �   �   �        >                item: { type: 'approval', to_user: assignee },5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             ZKq     �   �   �        Z                item: { type: 'approval', to_user: assignee, uuid: this.props.item.uuid },5�_�                    �   $    ����                                                                                                                                                                                                                                                                                                                                                             ZKt     �   �   �        T                  type: 'approval', to_user: assignee, uuid: this.props.item.uuid },5�_�                    �   %    ����                                                                                                                                                                                                                                                                                                                                                             ZKv     �   �   �        B                  to_user: assignee, uuid: this.props.item.uuid },5�_�                    �   -    ����                                                                                                                                                                                                                                                                                                                                                             ZKx     �   �   �        /                  uuid: this.props.item.uuid },5�_�                    �   ,    ����                                                                                                                                                                                                                                                                                                                                                             ZKz    �   �   �        ,                  uuid: this.props.item.uuid5�_�      	              �       ����                                                                                                                                                                                                                                                                                                                                                             ZK�     �   �   �      �   �   �      5�_�      
           	   �       ����                                                                                                                                                                                                                                                                                                                                                             ZK�     �   �   �        -                  uuid: this.props.item.uuid,5�_�   	              
   �       ����                                                                                                                                                                                                                                                                                                                                                             ZK�     �   �   �          +                uuid: this.props.item.uuid,5�_�   
                  �       ����                                                                                                                                                                                                                                                                                                                                                             ZK�    �   �   �      �   �   �      5��