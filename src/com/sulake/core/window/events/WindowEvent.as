package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1635:String = "WE_DESTROY";
      
      public static const const_307:String = "WE_DESTROYED";
      
      public static const const_1550:String = "WE_OPEN";
      
      public static const const_1548:String = "WE_OPENED";
      
      public static const const_1614:String = "WE_CLOSE";
      
      public static const const_1485:String = "WE_CLOSED";
      
      public static const const_1657:String = "WE_FOCUS";
      
      public static const const_310:String = "WE_FOCUSED";
      
      public static const const_1698:String = "WE_UNFOCUS";
      
      public static const const_1509:String = "WE_UNFOCUSED";
      
      public static const const_1597:String = "WE_ACTIVATE";
      
      public static const const_587:String = "WE_ACTIVATED";
      
      public static const const_1468:String = "WE_DEACTIVATE";
      
      public static const const_539:String = "WE_DEACTIVATED";
      
      public static const const_325:String = "WE_SELECT";
      
      public static const const_57:String = "WE_SELECTED";
      
      public static const const_514:String = "WE_UNSELECT";
      
      public static const const_492:String = "WE_UNSELECTED";
      
      public static const const_1638:String = "WE_LOCK";
      
      public static const const_1709:String = "WE_LOCKED";
      
      public static const const_1535:String = "WE_UNLOCK";
      
      public static const const_1619:String = "WE_UNLOCKED";
      
      public static const const_760:String = "WE_ENABLE";
      
      public static const const_230:String = "WE_ENABLED";
      
      public static const const_766:String = "WE_DISABLE";
      
      public static const const_211:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_259:String = "WE_RELOCATED";
      
      public static const const_1171:String = "WE_RESIZE";
      
      public static const const_39:String = "WE_RESIZED";
      
      public static const const_1646:String = "WE_MINIMIZE";
      
      public static const const_1699:String = "WE_MINIMIZED";
      
      public static const const_1645:String = "WE_MAXIMIZE";
      
      public static const const_1499:String = "WE_MAXIMIZED";
      
      public static const const_1525:String = "WE_RESTORE";
      
      public static const const_1620:String = "WE_RESTORED";
      
      public static const const_531:String = "WE_CHILD_ADDED";
      
      public static const const_415:String = "WE_CHILD_REMOVED";
      
      public static const const_206:String = "WE_CHILD_RELOCATED";
      
      public static const const_151:String = "WE_CHILD_RESIZED";
      
      public static const const_293:String = "WE_CHILD_ACTIVATED";
      
      public static const const_938:String = "WE_PARENT_ADDED";
      
      public static const const_1511:String = "WE_PARENT_REMOVED";
      
      public static const const_1596:String = "WE_PARENT_RELOCATED";
      
      public static const const_1159:String = "WE_PARENT_RESIZED";
      
      public static const const_1115:String = "WE_PARENT_ACTIVATED";
      
      public static const const_171:String = "WE_OK";
      
      public static const const_457:String = "WE_CANCEL";
      
      public static const const_104:String = "WE_CHANGE";
      
      public static const const_561:String = "WE_SCROLL";
      
      public static const const_179:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_697:IWindow;
      
      protected var var_1066:Boolean;
      
      protected var var_472:Boolean;
      
      protected var var_568:Boolean;
      
      protected var var_698:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_697 = param3;
         _loc5_.var_472 = param4;
         _loc5_.var_568 = false;
         _loc5_.var_698 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_697;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_472;
      }
      
      public function recycle() : void
      {
         if(this.var_568)
         {
            throw new Error("Event already recycled!");
         }
         this.var_697 = null;
         this._window = null;
         this.var_568 = true;
         this.var_1066 = false;
         this.var_698.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1066;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1066 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1066;
      }
      
      public function stopPropagation() : void
      {
         this.var_1066 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1066 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_472 + " window: " + this._window + " }";
      }
   }
}
