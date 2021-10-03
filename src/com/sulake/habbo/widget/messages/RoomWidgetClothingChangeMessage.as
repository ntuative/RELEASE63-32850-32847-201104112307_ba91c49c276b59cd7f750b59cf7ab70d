package com.sulake.habbo.widget.messages
{
   import com.sulake.core.window.IWindowContainer;
   
   public class RoomWidgetClothingChangeMessage extends RoomWidgetMessage
   {
      
      public static const const_412:String = "RWCCM_REQUEST_EDITOR";
       
      
      private var var_391:int = 0;
      
      private var var_2483:int = 0;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_975:String = "";
      
      private var _window:IWindowContainer = null;
      
      public function RoomWidgetClothingChangeMessage(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:IWindowContainer)
      {
         super(param1);
         this.var_975 = param2;
         this.var_391 = param3;
         this.var_2483 = param4;
         this._roomId = param5;
         this._roomCategory = param6;
         this._window = param7;
      }
      
      public function get objectId() : int
      {
         return this.var_391;
      }
      
      public function get objectCategory() : int
      {
         return this.var_2483;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get gender() : String
      {
         return this.var_975;
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
   }
}
