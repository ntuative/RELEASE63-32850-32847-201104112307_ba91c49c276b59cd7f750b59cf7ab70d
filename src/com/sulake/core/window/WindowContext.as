package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_534:uint = 0;
      
      public static const const_1555:uint = 1;
      
      public static const const_1886:int = 0;
      
      public static const const_1923:int = 1;
      
      public static const const_1820:int = 2;
      
      public static const const_1926:int = 3;
      
      public static const const_1460:int = 4;
      
      public static const const_384:int = 5;
      
      public static var var_395:IEventQueue;
      
      private static var var_659:IEventProcessor;
      
      private static var var_1910:uint = const_534;
      
      private static var stage:Stage;
      
      private static var var_147:IWindowRenderer;
       
      
      private var var_2641:EventProcessorState;
      
      private var var_2640:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_125:DisplayObjectContainer;
      
      protected var var_2932:Boolean = true;
      
      protected var var_1309:Error;
      
      protected var var_2102:int = -1;
      
      protected var var_1319:IInternalWindowServices;
      
      protected var var_1587:IWindowParser;
      
      protected var var_2881:IWindowFactory;
      
      protected var var_83:IDesktopWindow;
      
      protected var var_1588:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_563:Boolean = false;
      
      private var var_2639:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_147 = param2;
         this._localization = param4;
         this.var_125 = param5;
         this.var_1319 = new ServiceManager(this,param5);
         this.var_2881 = param3;
         this.var_1587 = new WindowParser(this);
         this.var_2640 = param7;
         if(!stage)
         {
            if(this.var_125 is Stage)
            {
               stage = this.var_125 as Stage;
            }
            else if(this.var_125.stage)
            {
               stage = this.var_125.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_83 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_83.limits.maxWidth = param6.width;
         this.var_83.limits.maxHeight = param6.height;
         this.var_125.addChild(this.var_83.getDisplayObject());
         this.var_125.doubleClickEnabled = true;
         this.var_125.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this.var_2641 = new EventProcessorState(var_147,this.var_83,this.var_83,null,this.var_2640);
         inputMode = const_534;
         this.var_1588 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1910;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_395)
         {
            if(var_395 is IDisposable)
            {
               IDisposable(var_395).dispose();
            }
         }
         if(var_659)
         {
            if(var_659 is IDisposable)
            {
               IDisposable(var_659).dispose();
            }
         }
         switch(value)
         {
            case const_534:
               var_395 = new MouseEventQueue(stage);
               var_659 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1555:
               var_395 = new TabletEventQueue(stage);
               var_659 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_534;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_125.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_125.removeChild(IGraphicContextHost(this.var_83).getGraphicContext(true) as DisplayObject);
            this.var_83.destroy();
            this.var_83 = null;
            this.var_1588.destroy();
            this.var_1588 = null;
            if(this.var_1319 is IDisposable)
            {
               IDisposable(this.var_1319).dispose();
            }
            this.var_1319 = null;
            this.var_1587.dispose();
            this.var_1587 = null;
            var_147 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1309;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_2102;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1309 = param2;
         this.var_2102 = param1;
         if(this.var_2932)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1309 = null;
         this.var_2102 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1319;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1587;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2881;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_83;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_83.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1460,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1588;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_83,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_83)
         {
            this.var_83 = null;
         }
         if(param1.state != WindowState.const_472)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_147.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_563 = true;
         if(this.var_1309)
         {
            throw this.var_1309;
         }
         var_659.process(this.var_2641,var_395);
         this.var_563 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2639 = true;
         var_147.update(param1);
         this.var_2639 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_83 != null && !this.var_83.disposed)
         {
            if(this.var_125 is Stage)
            {
               this.var_83.limits.maxWidth = Stage(this.var_125).stageWidth;
               this.var_83.limits.maxHeight = Stage(this.var_125).stageHeight;
               this.var_83.width = Stage(this.var_125).stageWidth;
               this.var_83.height = Stage(this.var_125).stageHeight;
            }
            else
            {
               this.var_83.limits.maxWidth = this.var_125.width;
               this.var_83.limits.maxHeight = this.var_125.height;
               this.var_83.width = this.var_125.width;
               this.var_83.height = this.var_125.height;
            }
         }
      }
   }
}
