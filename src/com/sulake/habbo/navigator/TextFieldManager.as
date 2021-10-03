package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_78:ITextFieldWindow;
      
      private var var_674:Boolean;
      
      private var var_1396:String = "";
      
      private var var_1974:int;
      
      private var var_1973:Function;
      
      private var var_2732:String = "";
      
      private var var_140:IWindowContainer;
      
      private var var_2733:Boolean;
      
      private var _orgTextBackgroundColor:uint;
      
      private var var_2734:uint;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         this._navigator = param1;
         this.var_78 = param2;
         this.var_1974 = param3;
         this.var_1973 = param4;
         if(param5 != null)
         {
            this.var_674 = true;
            this.var_1396 = param5;
            this.var_78.text = param5;
         }
         Util.setProcDirectly(this.var_78,this.onInputClick);
         this.var_78.addEventListener(WindowKeyboardEvent.const_174,this.checkEnterPress);
         this.var_78.addEventListener(WindowEvent.const_104,this.checkMaxLen);
         this.var_2733 = this.var_78.textBackground;
         this._orgTextBackgroundColor = this.var_78.textBackgroundColor;
         this.var_2734 = this.var_78.textColor;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!this.isInputValid())
         {
            this.displayError(param1);
            return false;
         }
         this.restoreBackground();
         return true;
      }
      
      public function restoreBackground() : void
      {
         this.var_78.textBackground = this.var_2733;
         this.var_78.textBackgroundColor = this._orgTextBackgroundColor;
         this.var_78.textColor = this.var_2734;
      }
      
      public function displayError(param1:String) : void
      {
         this.var_78.textBackground = true;
         this.var_78.textBackgroundColor = 4294021019;
         this.var_78.textColor = 4278190080;
         if(this.var_140 == null)
         {
            this.var_140 = IWindowContainer(this._navigator.getXmlWindow("nav_error_popup"));
            this._navigator.refreshButton(this.var_140,"popup_arrow_down",true,null,0);
            IWindowContainer(this.var_78.parent).addChild(this.var_140);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_140.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         this.var_140.findChildByName("border").width = _loc2_.width + 15;
         this.var_140.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         this.var_78.getLocalPosition(_loc3_);
         this.var_140.x = _loc3_.x;
         this.var_140.y = _loc3_.y - this.var_140.height + 3;
         var _loc4_:IWindow = this.var_140.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_140.width / 2 - _loc4_.width / 2;
         this.var_140.x += (this.var_78.width - this.var_140.width) / 2;
         this.var_140.visible = true;
      }
      
      public function goBackToInitialState() : void
      {
         this.clearErrors();
         if(this.var_1396 != null)
         {
            this.var_78.text = this.var_1396;
            this.var_674 = true;
         }
         else
         {
            this.var_78.text = "";
            this.var_674 = false;
         }
      }
      
      public function getText() : String
      {
         if(this.var_674)
         {
            return this.var_2732;
         }
         return this.var_78.text;
      }
      
      public function setText(param1:String) : void
      {
         this.var_674 = false;
         this.var_78.text = param1;
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_140 != null)
         {
            this.var_140.visible = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return this.var_78;
      }
      
      private function isInputValid() : Boolean
      {
         return !this.var_674 && Util.trim(this.getText()).length > 2;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_310)
         {
            return;
         }
         if(!this.var_674)
         {
            return;
         }
         this.var_78.text = this.var_2732;
         this.var_674 = false;
         this.restoreBackground();
      }
      
      private function checkEnterPress(param1:WindowKeyboardEvent) : void
      {
         if(param1.charCode == Keyboard.ENTER)
         {
            if(this.var_1973 != null)
            {
               this.var_1973();
            }
         }
      }
      
      private function checkMaxLen(param1:WindowEvent) : void
      {
         var _loc2_:String = this.var_78.text;
         if(_loc2_.length > this.var_1974)
         {
            this.var_78.text = _loc2_.substring(0,this.var_1974);
         }
      }
   }
}
