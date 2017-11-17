Vim�UnDo� %�	���2;W��� ����1moÔ�eo:��J�   �                  '       '   '   '    Y�k�    _�                     l       ����                                                                                                                                                                                                                                                                                                                                                             Y�\�    �   l   n   �          �   l   n   �    5�_�                    m        ����                                                                                                                                                                                                                                                                                                                                                             Y�`\     �               �   )import React, { Component } from 'react';   Wimport { bool, string, oneOf, func, node, array, object, oneOfType } from 'prop-types';       3import { classnames, noPropagate } from '../utils';   #import { WithMenu } from '../hocs';   (import ButtonLabel from './ButtonLabel';       import './styles.scss';        class Button extends Component {     static propTypes = {       className: string,       color: oneOf([         'blue',         'seafoam',         'red',         'green',         'orange',         'grey',       ]),       disabled: bool,       focused: bool,       hasMenu: bool,       icon: string,   $    label: oneOfType([node, array]),       noArrow: bool,       onBlur: func,       onClick: func,       onFocus: func,       onSelect: func,       position: oneOf([         'left',         'right',       ]),       resizeHandle: node,       size: string,       style: object,       trackElement: func,       type: oneOf([         'primary',         'secondary',         'tertiary',         'nobutton',         'invisible',         'link',       ]),     }         static defaultProps = {       color: 'blue',       disabled: false,       noArrow: false,       position: 'left',       style: {},       type: 'primary',       size: 'large',     }         constructor(props) {       super(props);       D    this.menuItemClick = noPropagate(this.menuItemClick.bind(this));   8    this.onClick = noPropagate(this.onClick.bind(this));     }         get classNames() {       return classnames(         'button',         {   &        disabled: this.props.disabled,           icon: this.props.icon,   7        [this.props.className]: !!this.props.className,   (        'has-label': !!this.props.label,   !        'has-menu': this.hasMenu,   ,        'has-main-click': this.hasMainClick,   C        [this.props.type]: this.props.type && !this.props.disabled,   3        invisible: this.props.type === 'invisible',   )        link: this.props.type === 'link',   7        [`icon-${this.props.icon}`]: !!this.props.icon,   B        [`icon-position-${this.props.position}`]: this.props.icon,   :        [`color-${this.props.color}`]: !!this.props.color,   5        [`size-${this.props.size}`]: this.props.size,   !        open: this.props.focused,   $        'menu-button': this.hasMenu,         },       );     }         get hasMainClick() {   '    return Boolean(this.props.onClick);     }         get hasMenu() {       return this.props.hasMenu;     }         menuItemClick(item) {       if (this.props.disabled) {         return false;       }       if (this.props.onSelect) {          this.props.onSelect(item);       }       this.onBlur();       return true;     }         onClick(e) {       console.log('clicking')       if (this.props.disabled) {         return false;       }       if (e) {         if (this.props.onClick) {   %        return this.props.onClick(e);         }       }       if (this.props.focused) {   !      return this.props.onBlur();       }        return this.props.onFocus();     }         get label() {       const {         disabled,         icon,         label,         noArrow,         position,         onFocus,         onBlur,         focused,       } = this.props;       return (         <ButtonLabel           disabled={disabled}           focused={focused}           hasMenu={this.hasMenu}           icon={icon}           label={label}           noArrow={noArrow}           onBlur={onBlur}           onClick={this.onClick}           onFocus={onFocus}           position={position} />       );     }         render() {       const {         style,         disabled,         trackElement,         resizeHandle,       } = this.props;       return (         <button           ref={trackElement}           style={style}   #        className={this.classNames}           disabled={disabled}>           { this.label }           { resizeHandle }         </button>       );     }   }       !export default WithMenu(Button, {     bodyAttached: true,     closeOnSelect: true,     popoverOptions: {       themeClass: 'white',       options: {   (      themeClass: 'popoverjs--dropdown',         constraints: [{           popover: 'top left',   "        attachment: 'bottom left',   
      }, {           popover: 'top right',   #        attachment: 'bottom right',   
      }, {           popover: 'bottom left',           attachment: 'top left',   
      }, {            popover: 'bottom right',            attachment: 'top right',   	      }],       },     },   });5�_�                   ;        ����                                                                                                                                                                                                                                                                                                                                                             Y�`�     �   ;   =   �    �   ;   <   �    5�_�                    <       ����                                                                                                                                                                                                                                                                                                                                                             Y�`�     �   ;   =   �          console.log(refPosition)5�_�                    <       ����                                                                                                                                                                                                                                                                                                                                                             Y�`�     �   ;   =   �          console.log(constructor)5�_�                    <       ����                                                                                                                                                                                                                                                                                                                                                             Y�`�     �   ;   =   �          console.log(constructori')5�_�      	              @   $    ����                                                                                                                                                                                                                                                                                                                                                             Y�`�    �   ?   A          8    this.onClick = noPropagate(this.onClick.bind(this));5�_�      
           	   @       ����                                                                                                                                                                                                                                                                                                                                                             Y�a     �   ?   A          :    //this.onClick = noPropagate(this.onClick.bind(this));5�_�   	              
   ?        ����                                                                                                                                                                                                                                                                                                                            @          ?          V       Y�a     �   ?   A          8    this.onClick = noPropagate(this.onClick.bind(this));�   >   @          D    this.menuItemClick = noPropagate(this.menuItemClick.bind(this));5�_�   
                 m       ����                                                                                                                                                                                                                                                                                                                            @          ?          V       Y�a     �   m   o   �    �   m   n   �    5�_�                    n       ����                                                                                                                                                                                                                                                                                                                            @          ?          V       Y�a     �   m   o   �          console.log('constructori')5�_�                    n       ����                                                                                                                                                                                                                                                                                                                            @          ?          V       Y�a    �   m   o   �          console.log('onClick')5�_�                   ?        ����                                                                                                                                                                                                                                                                                                                            ?           @           V        Y�a~     �   ?   A          :    //this.onClick = noPropagate(this.onClick.bind(this));�   >   @          F    //this.menuItemClick = noPropagate(this.menuItemClick.bind(this));5�_�                   <       ����                                                                                                                                                                                                                                                                                                                            ?           @           V        Y�j�    �   ;   <              console.log('constructori')5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            >           ?           V        Y�j�     �   �   �                  onClick={this.onClick}5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            >           ?           V        Y�j�     �   �   �   �    5�_�      !               �        ����                                                                                                                                                                                                                                                                                                                            >           ?           V        Y�j�     �   �   �   �       �   �   �   �    5�_�       "           !   �       ����                                                                                                                                                                                                                                                                                                                            �          �          v       Y�j�     �   �   �   �       onClick={onClick}5�_�   !   #           "   �       ����                                                                                                                                                                                                                                                                                                                            �          �          v       Y�j�     �   �   �   �         onClick={onClick}5�_�   "   $           #   �       ����                                                                                                                                                                                                                                                                                                                            �          �          v       Y�j�     �   �   �   �           onClick={onClick}5�_�   #   %           $   �       ����                                                                                                                                                                                                                                                                                                                            �          �          v       Y�j�     �   �   �   �             onClick={onClick}5�_�   $   &           %   �   	    ����                                                                                                                                                                                                                                                                                                                            �          �          v       Y�j�    �   �   �   �               onClick={onClick}5�_�   %   '           &   �       ����                                                                                                                                                                                                                                                                                                                            �          �          v       Y�k~    �   �   �   �              onClick={onClick}5�_�   &               '   m       ����                                                                                                                                                                                                                                                                                                                            �          �          v       Y�k�    �   l   m              console.log('onClick', e)5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            >           ?           V        Y�j�     �   �   �   �    �   �   �   �            <bu onClick={onClick}tton5�_�                   <       ����                                                                                                                                                                                                                                                                                                                            ?           @           V        Y�a�    �   ;   =   �      ,    console.log('constructori', props.label)5�_�                    <   +    ����                                                                                                                                                                                                                                                                                                                            ?           @           V        Y�a�    �   ;   =   �      3    console.log('constructori', props.label, props)5�_�                    @       ����                                                                                                                                                                                                                                                                                                                            @   )       ?   )       V   )    Y�d�     �   @   A   �          �   @   B   �      *    this.onClick = this.onClick.bind(this)5�_�                    ?        ����                                                                                                                                                                                                                                                                                                                            @   )       ?   )       V   )    Y�d�    �   >   @          F    //this.menuItemClick = noPropagate(this.menuItemClick.bind(this));�   ?   A          :    //this.onClick = noPropagate(this.onClick.bind(this));5�_�                    A       ����                                                                                                                                                                                                                                                                                                                            @          ?          V       Y�f     �   @   B        5�_�                    ?        ����                                                                                                                                                                                                                                                                                                                            @          ?          V       Y�f    �   >   @          D    this.menuItemClick = noPropagate(this.menuItemClick.bind(this));�   ?   A          8    this.onClick = noPropagate(this.onClick.bind(this));5�_�                    <       ����                                                                                                                                                                                                                                                                                                                            �          �          V       Y�f    �   ;   =        5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       Y�i'     �   �   �   �              �   �   �   �              { this.props.label }5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �          �          V       Y�i+   	 �   �   �        5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          v       Y�iu     �   �   �   �            �   �   �   �              onClick={this.props.o}5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          v       Y�i�     �   �   �   �              onClick={this.}5�_�                     �       ����                                                                                                                                                                                                                                                                                                                            �          �          v       Y�i�   
 �   �   �   �              onClick={this.onClick}5�_�                    >        ����                                                                                                                                                                                                                                                                                                                            >           @          V       Y�aw     �   =   ?           �   >   @          H    ////this.menuItemClick = noPropagate(this.menuItemClick.bind(this));�   ?   A          <    ////this.onClick = noPropagate(this.onClick.bind(this));5�_�                    ;   	    ����                                                                                                                                                                                                                                                                                                                                                             Y�`�     �   ;   <   �    �   ;   <   �          phase.disabled = true;5��